extends ReactionState

class_name StandBlockState

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("StandBlock")
	state[Enums.StKey.burst_OK] = true
	state[Enums.StKey.kara_OK] = true
	state[Enums.StKey.drag_x] = Util.MOD_FRICTION
	state[Enums.StKey.velocity_y] = 0

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.BlockingOK:
			return true
		Enums.StateProperty.AirThrowOK:
			return false
		Enums.StateProperty.GroundThrowOK:
			return false
		Enums.StateProperty.CrossupProtect:
			return true
		Enums.StateProperty.RedParry:
			return true
		_:
			return super.has_property(state,property)

func meter_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (burst_OK(state, interpreter)):
			state[Enums.StKey.cancelState] = "Burst"
		elif (guard_cancel_OK(state, interpreter)):
			if (Util.assist_guard_cancel_exhausted(state)):
				state[Enums.StKey.cancelState] = "AssistWeakGuardCancel"
			else:
				state[Enums.StKey.cancelState] = "AssistGuardCancel"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
			change_state.call("RedCrouchParryWhiff")
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N5, state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
			change_state.call("RedStandParryWhiff")

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.StrikeHurt):
		state[Enums.StKey.hitCount] = 1
		change_state.call("HurtStand")
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
		state[Enums.StKey.hitCount] = 1
		change_state.call("HurtLaunch")
	elif (event_cause == Enums.Reaction.KOHurt):
		change_state.call("KO")

func guard_cancel_OK(state: Dictionary, interpreter: InputInterpreter) -> bool:
	return level_1_OK(state) and interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.DDown)
