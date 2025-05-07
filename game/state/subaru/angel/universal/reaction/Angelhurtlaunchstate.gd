extends AngelHurtAirState

class_name AngelHurtLaunchState

var HurtSound

func _init() -> void:
	super._init()
	HurtSound = preload("res://game/assets/voice/subaru/SubaruYaya.wav")

func pushback_multiplier(state: Dictionary):
	# launch_dir_x is usually a high magnitude for grounded pushback, so tone it down for air pushback
	# launches aren't affected tho
	pass

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("AngelAirHit")
	state[Enums.StKey.accel_y] = Util.gravity_scaling(Util.JUGGLE_GRAVITY, state[Enums.StKey.comboTime])

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 20):
		SyncManager.play_sound("MioVoice", HurtSound, {"bus": "Voice"})
