extends State

class_name IdleState

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.kara_OK] = true
	anim.speed_scale = 1

func has_property(_state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.BlockingOK:
			return true
		Enums.StateProperty.GroundThrowOK:
			return true
		_:
			return false

func meter_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (boost_OK(state, interpreter)):
		change_state.call("BoostCancel")
	elif (assist_ok(state, interpreter) and state[Enums.StKey.cancelState] != "BoostCancel"):
		if (interpreter.is_low_blocking(state[Enums.StKey.leftface])):
			change_state.call("GroundAssistCall2")
		elif (level_1_OK(state) and super_assist_meter_ok(state)  and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.DDown, state[Enums.StKey.leftface])):
			change_state.call("GroundAssistCallSuper")
		else:
			change_state.call("GroundAssistCall")

func special_cancel(_state: Dictionary, _interpreter: InputInterpreter):
	pass
