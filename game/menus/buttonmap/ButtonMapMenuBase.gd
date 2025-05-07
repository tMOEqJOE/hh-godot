extends Node2D

class_name ButtonMapMenuBase

signal button_set_complete(is_p1)

var is_p1: bool
var ready_for_inputs: bool
var current_button: int # index of current button to set
var input_map_actions: Array
var actions_to_buttons: Array
var OK_delay: int # because OK would select your character also currently
var max_button_cooldown: int
var button_cooldown: int

func _ready():
	ready_for_inputs = false
	OK_delay = 0
	max_button_cooldown = 8

func _physics_process(delta):
	if (OK_delay > 0):
		OK_delay -= 1
		if (OK_delay == 0):
			emit_signal("button_set_complete", is_p1)
	if (button_cooldown > 0):
		$ButtonMapBase/GridContainer.modulate = "#dddddd"
		button_cooldown -= 1
	elif (button_cooldown == 0):
		$ButtonMapBase/GridContainer.modulate = "#ffffff"

func free_button_menu():
	queue_free()

func set_is_p1(is_p1:bool):
	self.is_p1 = is_p1
	input_map_actions = ["player1_a", "player1_b", "player1_c", "player1_d", "player1_ab", "player1_ad", "player1_bc", "player1_abc", "player1_abcd", "player1_cancel", "player1_record", "player1_replay"]
	if (not is_p1):
		input_map_actions = ["player2_a", "player2_b", "player2_c", "player2_d", "player2_ab", "player2_ad", "player2_bc", "player2_abc", "player2_abcd", "player2_cancel", "player2_record", "player2_replay"]

	for i in range (0, len(input_map_actions)):
		var input_action = input_map_actions[i]
		for input_event in InputMap.action_get_events(input_action):
			if (Util.is_gamepad_button_event(input_event)):
				actions_to_buttons.append(input_event)
				display_button(i, input_event.button_index)
				break
	ready_for_inputs = true

func display_button(list_index: int, button_index: int):
	pass

func valid_attack_button(event):
	var correct_device: bool = false
	if (is_p1 and event.device == Global.p1_device_id):
		correct_device = true
	elif (not is_p1 and event.device == Global.p2_device_id):
		correct_device = true
	return correct_device and not (event.button_index == 11 or 
										event.button_index == 12 or 
										event.button_index == 13 or
										event.button_index == 14 or 
										event.button_index == 15)

func valid_unmap_action(event):
	var correct_device: bool = false
	var is_right_input = false
	if (is_p1 and event.device == Global.p1_device_id):
		correct_device = true
		is_right_input = Input.is_action_just_pressed("player1_right")
	elif (not is_p1 and event.device == Global.p2_device_id):
		correct_device = true
		is_right_input = Input.is_action_just_pressed("player2_right")
	var is_unmap_action = is_right_input
	return correct_device and is_unmap_action

func advance_to_next_button():
	if (current_button < len(input_map_actions)):
		current_button += 1
		$ButtonMapBase/Sprite2D.position.y += 55
	else:
		current_button = 0
		$ButtonMapBase/Sprite2D.position.y -= 55 * (len(input_map_actions))

func advance_to_prev_button():
	if (current_button > 0):
		current_button -= 1
		$ButtonMapBase/Sprite2D.position.y -= 55
	else:
		current_button = len(input_map_actions)
		$ButtonMapBase/Sprite2D.position.y += 55 * (len(input_map_actions))

func prep_new_button(button: int):
	button_cooldown = max_button_cooldown
	# TODO: delete if OK to delete
	#var new_event = InputEventJoypadButton.new()
	#if (is_p1):
		#new_event.device = Global.p1_device_id
	#else:
		#new_event.device = Global.p2_device_id
	#new_event.button_index = button
	## switch events if new_event is the same button as existing event 
	#var action_index = find_button_by_action(new_event.button_index)
	#if (action_index != -1):
		#var old_event = actions_to_buttons[current_button]
		#actions_to_buttons[action_index] = old_event
		#display_button(action_index, old_event.button_index)
	#actions_to_buttons[current_button] = new_event
	#display_button(current_button, new_event.button_index)

func unmap_button():
	button_cooldown = max_button_cooldown
	# TODO: delete if OK to delete
	#var new_event = InputEventJoypadButton.new()
	#if (is_p1):
		#new_event.device = Global.p1_device_id
	#else:
		#new_event.device = Global.p2_device_id
	#new_event.button_index = 127
	## switch events if new_event is the same button as existing event 
	#actions_to_buttons[current_button] = new_event
	#display_button(current_button, new_event.button_index)


func find_button_by_action(button_index):
	for i in range(0, len(actions_to_buttons)):
		if (actions_to_buttons[i].button_index == button_index):
			return i
	return -1

func set_new_buttons():
	for i in range(0, len(input_map_actions)):
		var input_action: String = input_map_actions[i]
		var event_action = actions_to_buttons[i]
#		InputMap.action_erase_events(input_action)
#		InputMap.action_add_event(input_action, event_action)
		var appended = false
		for input_event in InputMap.action_get_events(input_action): 
			if (input_event is InputEventJoypadButton):
				input_event.button_index = event_action.button_index
				appended = true
			#elif (input_event is InputEventJoypadMotion):
				#input_event.axis = event_action.
				#appended = true
		if (not appended):
			InputMap.action_add_event(input_action, event_action)
	var is_key = true
	if (is_p1):
		if (Global.p1_is_gamepad):
			is_key = false
	else:
		if (Global.p2_is_gamepad):
			is_key = false
	Util.save_control_scheme(is_p1, is_key)
	Util.set_input_map_ui_controls()
	OK_delay = 5
	MainMenuMusicControl.play_cursor_select()

func _input(event: InputEvent):
	input_helper(event)

func input_helper(event: InputEvent):
	pass
