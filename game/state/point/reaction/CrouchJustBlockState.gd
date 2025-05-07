extends StandJustBlockState

class_name CrouchJustBlockState

func _init():
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			#
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 720896, Enums.StKey.Hurt1PosY : -3145728,
			Enums.StKey.Hurt1ScaleX : 539948, Enums.StKey.Hurt1ScaleY : 950818,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("CrouchBlock")
	state[Enums.StKey.velocity_x] = SGFixed.mul(state[Enums.StKey.velocity_x], Util.CROUCH_IB_PUSHBACK_MULT)

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.StrikeHurt):
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
