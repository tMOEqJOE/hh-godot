extends TrainingMain

class_name ComboTrialMain

func exit():
	super.exit()
	get_tree().change_scene_to_file("res://game/menus/combo_trial/ComboTrialCharacterSelect.tscn")
