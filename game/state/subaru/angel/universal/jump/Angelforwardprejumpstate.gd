extends AngelPreJumpState

class_name AngelForwardPreJumpState

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.drag_x] = 0 # Bunny hop OK
	if (state[Enums.StKey.velocity_x] < 0):
		state[Enums.StKey.velocity_x] = 0

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == endFrame):
		change_state.call("AngelForwardJump")
#	special_cancel(state, interpreter)
	meter_cancel(state, interpreter)
