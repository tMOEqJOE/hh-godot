extends AssistBurstState

class_name FubukiBurstState

var voice = preload("res://game/assets/voice/fubuki/fbk_WOOOOW.wav")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 5):
		SyncManager.play_sound("FubukiVoice", voice, {"bus": "Voice"})
