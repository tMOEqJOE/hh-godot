extends IntroState

class_name SuiseiIntroState

var voice = preload("res://game/assets/voice/suisei/sui_show ga hajimattaze.wav")

# Writing _delta instead of delta here prevents the unused variable warning.
func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 5):
		SyncManager.play_sound("SuiseiVoice", voice, {"bus": "Voice"})
