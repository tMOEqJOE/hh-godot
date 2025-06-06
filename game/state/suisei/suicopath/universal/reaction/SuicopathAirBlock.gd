extends SuicopathAirReactionState

class_name SuicopathAirBlockState

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true, Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -18153472,
			Enums.StKey.Hurt1ScaleX : 1185327, Enums.StKey.Hurt1ScaleY : 1324647,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("AngelAirBlock")
	state[Enums.StKey.hitstun] += 50
	state[Enums.StKey.burst_OK] = true
	state[Enums.StKey.kara_OK] = true
	state[Enums.StKey.velocity_x] = SGFixed.mul(state[Enums.StKey.velocity_x], Util.BASE_AIR_X_MULT)

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	super.handle_input(state, interpreter)
	if (state[Enums.StKey.hitstun] <= 0):
		common_jump_transitions(state, interpreter)

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.StrikeHurt):
		change_state.call("AngelAirBlock")
	elif (event_cause == Enums.Reaction.BlockHurt):
		change_state.call("AngelAirBlock")
	elif (event_cause == Enums.Reaction.JustBlockHurt):
		change_state.call("AngelJustAirBlock")
	elif (event_cause == Enums.Reaction.LaunchHurt):
		change_state.call("AngelAirBlock")
	elif (event_cause == Enums.Reaction.KOHurt):
		change_state.call("AngelKO")
	elif (state[Enums.StKey.hitStopFrame] <= 0):
		if (event_cause == Enums.Reaction.GroundLand):
			state[Enums.StKey.doubleJump] = 1
			state[Enums.StKey.airDash] = 1
			state[Enums.StKey.leftfaceOK] = true
			change_state.call("AngelStand")
#			common_idle_transitions(state, interpreter)

func meter_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (burst_OK(state, interpreter)):
			state[Enums.StKey.cancelState] = "AngelBurst"
		elif (guard_cancel_OK(state, interpreter)):
			if (Util.assist_guard_cancel_exhausted(state)):
				state[Enums.StKey.cancelState] = "AngelAirAssistWeakGuardCancel"
			else:
				state[Enums.StKey.cancelState] = "AngelAirAssistGuardCancel"
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N5, state[Enums.StKey.leftface]) or 
				interpreter.is_holding_a_direction(Enums.Numpad.N8, state[Enums.StKey.leftface])) 
				and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
			change_state.call("AngelRedAirParryWhiff")

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.BlockingOK:
			return true
		Enums.StateProperty.AirThrowOK:
			return false
		Enums.StateProperty.CrossupProtect:
			return true
		Enums.StateProperty.ExtraChip:
			return true
		Enums.StateProperty.RedParry:
			return true
		_:
			return super.has_property(state,property)

func guard_cancel_OK(state: Dictionary, interpreter: InputInterpreter) -> bool:
	return level_1_OK(state) and interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.DDown)
