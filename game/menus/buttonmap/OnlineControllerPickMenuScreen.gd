extends "res://game/menus/buttonmap/TrainingControllerPickMenuScreen.gd"

class_name OnlineControllerPickMenu

func try_player_set(id:int, is_p1_direction: bool):
	if (p1_id == id and not is_p1_direction):
		p1_id = -1000
		current_picks[id].move_reset()
	else:
		if (is_p1_direction and p1_id < 0 and p2_id < 0):
			p1_id = id
			current_picks[id].move_p1()

func ready(event_device) -> bool:
	return (event_device == p1_id or event_device == p2_id)

func next_scene():
	MainMenuMusicControl.play_cursor_select()
	Global.NETPLAY_MODE = Global.NETPLAY_MODES.PRIVATE_ROOM
	Global.IS_TRAINING = false
	get_tree().change_scene_to_file("res://game/menus/onlinemenu/LoginToServer.tscn")
