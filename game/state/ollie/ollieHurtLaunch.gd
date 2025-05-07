extends HurtLaunchState

class_name OllieHurtLaunchState

func _init() -> void:
	super._init()
	HurtSound = preload("res://game/assets/voice/ollie/oll_huh.wav")

func enter(state: Dictionary) -> void:
	super.enter(state)

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 20):
		SyncManager.play_sound("OllieVoice", HurtSound, {"bus": "Voice"})
