extends HurtLaunchState

class_name MioHurtLaunchState

func enter(state: Dictionary) -> void:
	super.enter(state)
	HurtSound = preload("res://game/assets/voice/mio/mio_cough1.wav")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 20):
		SyncManager.play_sound("MioVoice", HurtSound, {"bus": "Voice"})
