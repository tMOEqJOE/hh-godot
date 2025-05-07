extends HurtAirState

class_name HurtLaunchState

var HurtSound

func pushback_multiplier(_state: Dictionary):
	# launch_dir_x is usually a high magnitude for grounded pushback, so tone it down for air pushback
	# launches aren't affected tho
	pass

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("AirHit")
	state[Enums.StKey.accel_y] = Util.gravity_scaling(Util.JUGGLE_GRAVITY, state[Enums.StKey.comboTime])
