extends ControllerPickMenu

class_name TrainingControllerPickMenu

func try_player_set(id:int, is_p1_direction: bool):
	if (p1_id == id and not is_p1_direction):
		p1_id = -1000
		current_picks[id].move_reset()
	elif (p2_id == id and is_p1_direction):
		p2_id = -1000
		current_picks[id].move_reset()
	else:
		if (is_p1_direction and p1_id < 0 and p2_id < 0):
			p1_id = id
			current_picks[id].move_p1()
		elif (not is_p1_direction and p2_id < 0 and p1_id < 0):
			p2_id = id
			current_picks[id].move_p2()

func ready(event_device) -> bool:
	return (event_device == p1_id or event_device == p2_id)

func finalize_devices():
	if (p1_id >= 0):
		Global.TRAINING_P1 = true
	elif (p2_id >= 0):
		Global.TRAINING_P1 = false
	else:
		Global.TRAINING_P1 = true
	Global.IS_TRAINING = true
	# now it is ok to un-null device ids
	super.finalize_devices()
	# disable keyboard for other player
	if (Global.TRAINING_P1):
		Global.p2_is_gamepad = true
	elif (not Global.TRAINING_P1):
		Global.p1_is_gamepad = true

func next_scene():
	MainMenuMusicControl.play_cursor_select()
	get_tree().change_scene_to_file("res://game/menus/characterselect/TrainingCharacterSelect.tscn")

func prev_scene():
	MainMenuMusicControl.play_cursor_deselect()
	get_tree().change_scene_to_file("res://game/menus/mainmenu/MainMenu.tscn")
