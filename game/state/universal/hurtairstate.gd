extends AirReactionState

class_name HurtAirState


# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("AirHit")
	pushback_multiplier(state)

func pushback_multiplier(state: Dictionary):
	# launch_dir_x is usually a high magnitude for grounded pushback, so tone it down for air pushback
	state[Enums.StKey.velocity_x] = SGFixed.mul(state[Enums.StKey.velocity_x], Util.BASE_AIR_X_MULT)

func has_property(_state: Dictionary, property: int) -> bool:
	match property:
		Enums.StateProperty.AirThrowOK:
			return true
		Enums.StateProperty.BlockingOK:
			return false
		_:
			return false

func reaction(state: Dictionary, _interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.StrikeHurt):
		change_state.call("HurtAir")
	elif (event_cause == Enums.Reaction.BlockHurt):
		change_state.call("AirBlock")
	elif (event_cause == Enums.Reaction.JustBlockHurt):
		change_state.call("JustAirBlock")
	elif (event_cause == Enums.Reaction.ThrowHurt):
		change_state.call("HurtAirThrow")
	elif (event_cause == Enums.Reaction.LaunchHurt):
		change_state.call("HurtLaunch")
	elif (event_cause == Enums.Reaction.BurstLockHurt):
		state[Enums.StKey.burst_OK] = false
	elif (event_cause == Enums.Reaction.KOHurt):
		change_state.call("KO")
	elif (state[Enums.StKey.hitStopFrame] <= 0):
		if (event_cause == Enums.Reaction.GroundLand):
			if (state[Enums.StKey.ground_bounce] > 0):
				state[Enums.StKey.ground_bounce] -= 1
				change_state.call("GroundBounce")
			else:
				state[Enums.StKey.doubleJump] = 1
				state[Enums.StKey.airDash] = 1
				change_state.call("Knockdown")
		elif (event_cause == Enums.Reaction.WallLand):
			if (state[Enums.StKey.wall_bounce] > 0):
				state[Enums.StKey.wall_bounce] -= 1
				change_state.call("WallBounce")
