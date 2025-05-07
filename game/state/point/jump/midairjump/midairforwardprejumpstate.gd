extends MidAirPreJumpState

class_name ForwardMidAirPreJumpState

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:

	if (state[Enums.StKey.frame] == endFrame):
		change_state.call("ForwardMidAirJump")
