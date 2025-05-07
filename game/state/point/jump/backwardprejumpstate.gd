extends PreJumpState

class_name BackwardPreJumpState

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == endFrame):
		change_state.call("BackwardJump")
#	special_cancel(state, interpreter)
	meter_cancel(state, interpreter)
