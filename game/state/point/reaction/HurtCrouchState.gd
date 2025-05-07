extends HurtGroundState

class_name HurtCrouchState

func _init():
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			#
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -8000000,
			Enums.StKey.Hurt1ScaleX : 705536, Enums.StKey.Hurt1ScaleY : 805536,
			Enums.StKey.Hurt2PosX : 0, Enums.StKey.Hurt2PosY : -10316198,
			Enums.StKey.Hurt2ScaleX : 342394, Enums.StKey.Hurt2ScaleY : 1096324,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("CrouchHurt")
	state[Enums.StKey.velocity_x] = SGFixed.mul(state[Enums.StKey.velocity_x], Util.CROUCH_PUSHBACK_MULT)
	state[Enums.StKey.hitstun] += 1
	state[Enums.StKey.drag_x] = Util.MOD_FRICTION

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.BurstLockHurt):
		state[Enums.StKey.burst_OK] = false
	elif (event_cause == Enums.Reaction.StrikeHurt):
		change_state.call("HurtCrouch")
	elif (event_cause == Enums.Reaction.BlockHurt):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])):
			change_state.call("CrouchBlock")
		else:
			change_state.call("StandBlock")
	elif (event_cause == Enums.Reaction.JustBlockHurt):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])):
			change_state.call("JustCrouchBlock")
		else:
			change_state.call("JustStandBlock")
	elif (event_cause == Enums.Reaction.ThrowHurt):
		change_state.call("HurtThrow")
	elif (event_cause == Enums.Reaction.LaunchHurt):
		change_state.call("HurtLaunch")
	elif (event_cause == Enums.Reaction.KOHurt):
		change_state.call("KO")
