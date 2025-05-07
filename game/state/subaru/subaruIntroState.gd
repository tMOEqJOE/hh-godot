extends IntroState

class_name SubaruIntroState

var voice = preload("res://game/assets/voice/subaru/sbr_kokode subaru wa item wo tsukaimasu.wav")

# Writing _delta instead of delta here prevents the unused variable warning.
func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 5):
		SyncManager.play_sound("SubaruVoice", voice, {"bus": "Voice"})
