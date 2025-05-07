extends AngelStandFDStanceState

class_name AngelCrouchFDStanceState

func _init():
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 786432, Enums.StKey.Hurt1PosY : -8454144,
			Enums.StKey.Hurt1ScaleX : 305194, Enums.StKey.Hurt1ScaleY : 951940,
			Enums.StKey.Hurt2PosX : 917504, Enums.StKey.Hurt2PosY : -7208960,
			Enums.StKey.Hurt2ScaleX : 668398, Enums.StKey.Hurt2ScaleY : -793234,
			Enums.StKey.Hurt3PosX : 4390912, Enums.StKey.Hurt3PosY : -13172735,
			Enums.StKey.Hurt3ScaleX : 302121, Enums.StKey.Hurt3ScaleY : -600552,
			Enums.StKey.Summon : "FDBubble",
			},
		12 : {
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Summon : "FDBubble",
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("AngelCrouchBlock")
	state[Enums.StKey.drag_x] = Util.FD_FRICTION
	state[Enums.StKey.leftfaceOK] = true

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == 0):
		if (state[Enums.StKey.kara_OK]):
			# Kara Cancel section
			state[Enums.StKey.kara_OK] = false
		if (burst_OK(state, interpreter)):
			change_state.call("AngelBurst")
	elif (interpreter.is_blocking(state[Enums.StKey.leftface]) and interpreter.is_low_blocking(state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BHold | Enums.InputFlags.CHold)):
		pass
	else:
		common_idle_transitions(state, interpreter)

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.BlockingOK:
			return true
		_:
			return super.has_property(state,property)

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
