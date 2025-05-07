extends IntroState

class_name OgaIntroState

var voice = preload("res://game/assets/voice/oga/oga_Beam haku no ka.wav")

# Writing _delta instead of delta here prevents the unused variable warning.
func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 6):
		SyncManager.play_sound("ogaIntroVoice", voice, {"bus": "Voice"})
