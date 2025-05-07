extends AngelHurtGroundState

class_name AngelHurtCrouchState

func _init():
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			#
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 786432, Enums.StKey.Hurt1PosY : -8454144,
			Enums.StKey.Hurt1ScaleX : 305194, Enums.StKey.Hurt1ScaleY : 951940,
			Enums.StKey.Hurt2PosX : 917504, Enums.StKey.Hurt2PosY : -7208960,
			Enums.StKey.Hurt2ScaleX : 668398, Enums.StKey.Hurt2ScaleY : -793234,
			Enums.StKey.Hurt3PosX : 4390912, Enums.StKey.Hurt3PosY : -13172735,
			Enums.StKey.Hurt3ScaleX : 302121, Enums.StKey.Hurt3ScaleY : -600552,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("AngelCrouchHurt")
	state[Enums.StKey.velocity_x] = SGFixed.mul(state[Enums.StKey.velocity_x], Util.CROUCH_PUSHBACK_MULT)
	state[Enums.StKey.hitstun] += 1
	state[Enums.StKey.drag_x] = Util.MOD_FRICTION

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.StrikeHurt):
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
		change_state.call("AngelHurtLaunch")
	elif (event_cause == Enums.Reaction.KOHurt):
		change_state.call("AngelKO")
	elif (event_cause == Enums.Reaction.BurstLockHurt):
		state[Enums.StKey.burst_OK] = false
