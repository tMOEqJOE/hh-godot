extends IntroState

class_name FlayonIntroState

var voice = preload("res://game/assets/voice/flayon/mxf_rtrus_cleared_for_takeoff.wav")

# Writing _delta instead of delta here prevents the unused variable warning.
func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 5):
		SyncManager.play_sound("FlayonVoice", voice, {"bus": "Voice"})
