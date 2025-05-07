extends AssistBurstState

class_name SoraBurstState

var voice = preload("res://game/assets/voice/sora/sor_NEEEEEEEEeee.wav")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 5):
		SyncManager.play_sound("SoraVoice", voice, {"bus": "Voice"})
