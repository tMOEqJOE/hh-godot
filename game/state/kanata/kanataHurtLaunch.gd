extends HurtLaunchState

class_name KanataHurtLaunchState

func _init() -> void:
	super._init()
	HurtSound = preload("res://game/assets/voice/kanata/amk_itai2.wav")

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 20):
		SyncManager.play_sound("KanataVoice", HurtSound, {"bus": "Voice"})
