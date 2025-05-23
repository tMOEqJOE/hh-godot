extends Node2D

class_name ControllerPickMenu

@onready var ControllerPick = preload("res://game/menus/buttonmap/ControllerPick.tscn")

var current_picks: = {}

var p1_id: int
var p2_id: int

# Called when the node enters the scene tree for the first time.
func _ready():
	MainMenuMusicControl.play_main_menu_music()
	Global.MATCH_TOTAL = 0
	Global.P1_WIN_TOTAL = 0
	
	Input.connect("joy_connection_changed", Callable(self, "update_controllers"))
	p1_id = -1000
	p2_id = -1000
	for id in Input.get_connected_joypads():
		spawn_controller_pick(id)

func update_controllers(device: int, connected: bool):
#	print(device, connected)
	if (connected):
		spawn_controller_pick(device)
	else:
		despawn_controller_pick(device)

func spawn_controller_pick(device: int):
	var new_pick = ControllerPick.instantiate()
	new_pick.set_id(device + 1)
	add_child(new_pick)
	current_picks[device] = new_pick

func despawn_controller_pick(device: int):
	remove_child(current_picks[device])
	if (p1_id == device):
		p1_id = -1000
	elif (p2_id == device):
		p2_id = -1000

func try_player_set(id:int, is_p1_direction: bool):
	if (p1_id == id and not is_p1_direction):
		p1_id = -1000
		current_picks[id].move_reset()
	elif (p2_id == id and is_p1_direction):
		p2_id = -1000
		current_picks[id].move_reset()
	else:
		if (is_p1_direction and p1_id < 0):
			p1_id = id
			current_picks[id].move_p1()
		elif (not is_p1_direction and p2_id < 0):
			p2_id = id
			current_picks[id].move_p2()

func ready(event_device) -> bool:
	return (event_device == p1_id or event_device == p2_id)

func _input(event):
	input_help(event)

func input_help(event):
	if event.is_action_pressed("ui_cancel"):
		prev_scene()
	
	# check for left right inputs on every joypad
	if (event is InputEventJoypadMotion):
		if (event.axis == JOY_AXIS_LEFT_X and abs(event.axis_value) > 0.5):
			if (event.axis_value < 0):
				try_player_set(event.device, true)
			else:
				try_player_set(event.device, false)
	elif (event is InputEventJoypadButton):
		if (event.pressed):
			if (event.button_index == JOY_BUTTON_DPAD_LEFT):
				try_player_set(event.device, true)
			elif (event.button_index == JOY_BUTTON_DPAD_RIGHT):
				try_player_set(event.device, false)
			elif (event.button_index == JOY_BUTTON_A):
				if (ready(event.device)):
					finalize_devices()
	elif (event is InputEventKey or event is InputEventMouseButton):
		if (event.is_action_pressed("ui_accept")):
			finalize_devices()

func finalize_devices():
	var new_ids = prevent_null_device_id(p1_id, p2_id)
	p1_id = new_ids[0]
	p2_id = new_ids[1]
	Global.p1_device_id = p1_id
	Global.p2_device_id = p2_id
	reset_controllers()
	next_scene()

func prevent_null_device_id(p1_id, p2_id):
	if (p1_id < 0):
		Global.p1_is_gamepad = false
		if (p2_id == 0):
			p1_id = 1
		else:
			p1_id = 0
	else:
		Global.p1_is_gamepad = true
	
	if (p2_id < 0):
		Global.p2_is_gamepad = false
		if (p1_id == 0):
			p2_id = 1
		else:
			p2_id = 0
	else:
		Global.p2_is_gamepad = true
	return [p1_id, p2_id]

func reset_controllers():
	Util.load_battle_controller_config()
	Util.reset_input_map_device(Global.p1_device_id, true)
	Util.reset_input_map_device(Global.p2_device_id, false)
	Util.set_input_map_ui_controls()

func next_scene():
	reset_controllers()
	MainMenuMusicControl.play_cursor_select()
	get_tree().change_scene_to_file("res://game/menus/characterselect/CharacterSelect.tscn")

func prev_scene():
	MainMenuMusicControl.play_cursor_deselect()
	get_tree().change_scene_to_file("res://game/menus/versus/VersusModeSelect.tscn")
