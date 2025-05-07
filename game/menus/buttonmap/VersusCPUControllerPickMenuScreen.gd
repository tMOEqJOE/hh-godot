extends TrainingControllerPickMenu

class_name VersusCPUControllerPickMenu

func next_scene():
	MainMenuMusicControl.play_cursor_select()
	Global.IS_TRAINING = false
	get_tree().change_scene_to_file("res://game/menus/versus/VersusCPUCharacterSelect.tscn")

func prev_scene():
	MainMenuMusicControl.play_cursor_deselect()
	get_tree().change_scene_to_file("res://game/menus/versus/VersusModeSelect.tscn")
