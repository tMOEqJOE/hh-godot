extends AngelStandBlockState

class_name AngelCrouchBlockState

func _init():
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			#
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 4587519, Enums.StKey.Hurt1PosY : -8388608,
			Enums.StKey.Hurt1ScaleX : 257090, Enums.StKey.Hurt1ScaleY : 604574,
			Enums.StKey.Hurt2PosX : -131072, Enums.StKey.Hurt2PosY : -11403265,
			Enums.StKey.Hurt2ScaleX : 401098, Enums.StKey.Hurt2ScaleY : -853100,
			Enums.StKey.Hurt3PosX : 1245184, Enums.StKey.Hurt3PosY : -4259840,
			Enums.StKey.Hurt3ScaleX : 783139, Enums.StKey.Hurt3ScaleY : -370037,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("AngelCrouchBlock")
	state[Enums.StKey.velocity_x] = SGFixed.mul(state[Enums.StKey.velocity_x], Util.CROUCH_PUSHBACK_MULT)

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.StrikeHurt):
		state[Enums.StKey.hitCount] = 1
		change_state.call("AngelHurtCrouch")
	elif (event_cause == Enums.Reaction.BlockHurt):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])):
			change_state.call("AngelCrouchBlock")
		else:
			change_state.call("AngelStandBlock")
	elif (event_cause == Enums.Reaction.JustBlockHurt):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])):
			change_state.call("AngelJustCrouchBlock")
		else:
			change_state.call("AngelJustStandBlock")
	elif (event_cause == Enums.Reaction.ThrowHurt):
		change_state.call("AngelHurtThrow")
	elif (event_cause == Enums.Reaction.LaunchHurt):
		state[Enums.StKey.hitCount] = 1
		change_state.call("AngelHurtLaunch")
	elif (event_cause == Enums.Reaction.KOHurt):
		change_state.call("AngelKO")
