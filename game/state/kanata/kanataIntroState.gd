extends IntroState

class_name KanataIntroState

var voice = preload("res://game/assets/voice/kanata/amk_ konkanata.wav")

# Writing _delta instead of delta here prevents the unused variable warning.
func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 5):
		SyncManager.play_sound("KanataVoice", voice, {"bus": "Voice"})
