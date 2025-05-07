extends IntroState

class_name MioIntroState

var voice = preload("res://game/assets/voice/mio/mio_seki meter ga max.wav")

# Writing _delta instead of delta here prevents the unused variable warning.
func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 8):
		SyncManager.play_sound("MioVoice", voice, {"bus": "Voice"})
