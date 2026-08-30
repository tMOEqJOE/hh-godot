extends AssistBurstState

class_name AssistFlayonBurstState

var voice = preload("res://game/assets/voice/AssistFlayon/fbk_WOOOOW.wav")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 5):
		SyncManager.play_sound("AssistFlayonVoice", voice, {"bus": "Voice"})
