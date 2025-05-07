extends SuicopathHurtAirState

class_name SuicopathHurtOTGState


# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.accel_y] += (SGFixed.ONE*3)
	state[Enums.StKey.velocity_x] -= (SGFixed.ONE*15)
	state[Enums.StKey.hitstun] += 600

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.AirThrowOK:
			return false
		Enums.StateProperty.BlockingOK:
			return false
		_:
			return false

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.StrikeHurt):
		change_state.call("AngelHurtOTG")
	elif (event_cause == Enums.Reaction.BlockHurt):
		change_state.call("AngelAirBlock")
	elif (event_cause == Enums.Reaction.JustBlockHurt):
		change_state.call("AngelJustAirBlock")
	elif (event_cause == Enums.Reaction.ThrowHurt):
		change_state.call("AngelHurtAirThrow")
	elif (event_cause == Enums.Reaction.LaunchHurt):
		change_state.call("AngelHurtOTG")
	elif (event_cause == Enums.Reaction.KOHurt):
		change_state.call("AngelKO")
	elif (event_cause == Enums.Reaction.BurstLockHurt):
		state[Enums.StKey.burst_OK] = false
	elif (state[Enums.StKey.hitStopFrame] <= 0):
		if (event_cause == Enums.Reaction.GroundLand):
#			if (state[Enums.StKey.ground_bounce] > 0):
#				state[Enums.StKey.ground_bounce] -= 1
#				change_state.call("GroundBounce")
#			else:
			change_state.call("AngelWakeup")
		elif (event_cause == Enums.Reaction.WallLand):
			pass
#			if (state[Enums.StKey.wall_bounce] > 0):
#				state[Enums.StKey.wall_bounce] -= 1
#				change_state.call("WallBounce")
