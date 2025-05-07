extends "res://game/menus/buttonmap/OnlineControllerPickMenuScreen.gd"

class_name ReplayControllerPickMenu

func next_scene():
	MainMenuMusicControl.play_cursor_select()
	Global.IS_TRAINING = true
	get_tree().change_scene_to_file("res://game/menus/replay/ReplayFileMenu.tscn")
