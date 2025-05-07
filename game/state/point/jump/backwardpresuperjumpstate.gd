extends PreSuperJumpState

class_name BackwardPreSuperJumpState

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == endFrame):
		change_state.call("BackwardSuperJump")
	special_cancel(state, interpreter)
	meter_cancel(state, interpreter)
