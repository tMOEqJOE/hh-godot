extends IntroState

class_name OllieIntroState

var voice = preload("res://game/assets/voice/ollie/oll_do not test me like this.wav")

# Writing _delta instead of delta here prevents the unused variable warning.
func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 5):
		SyncManager.play_sound("OllieVoice", voice, {"bus": "Voice"})
