extends AngelPreSuperJumpState

class_name AngelBackwardPreSuperJumpState

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == endFrame):
		change_state.call("AngelBackwardSuperJump")
	special_cancel(state, interpreter)
	meter_cancel(state, interpreter)
