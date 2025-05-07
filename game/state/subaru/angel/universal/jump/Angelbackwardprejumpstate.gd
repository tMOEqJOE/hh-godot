extends AngelPreJumpState

class_name AngelBackwardPreJumpState

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == endFrame):
		change_state.call("AngelBackwardJump")
#	special_cancel(state, interpreter)
	meter_cancel(state, interpreter)
