extends StageMusicSelect

class_name TrainingStageMusicSelect

# Called when the node enters the scene tree for the first time.
func prepare_stage_music_select():
	if (not Global.TRAINING_P1):
		$P1Side.queue_free()
		input_prefix = "player2_"
	else:
		$P2Side.queue_free()
		input_prefix = "player1_"
	selected_index = 0
	stage_id = Global.STAGE_ART_ID
	bgm_id = Global.BGM_ID
	if (Global.STAGE_RANDOM_ONCE):
		stage_id = 1
	if (Global.BGM_RANDOM_ONCE):
		bgm_id = 1
	update_UI()

func evaluate_p1_side_bgm():
	return Global.TRAINING_P1

func go_to_prev_scene():
	MainMenuMusicControl.play_cursor_deselect()
	get_tree().change_scene_to_file("res://game/menus/characterselect/TrainingCharacterSelect.tscn")

func go_to_next_scene():
	MainMenuMusicControl.play_cursor_select()
	MainMenuMusicControl.reset_seek()
	get_tree().change_scene_to_file("res://game/menus/training/TrainingMain.tscn")
