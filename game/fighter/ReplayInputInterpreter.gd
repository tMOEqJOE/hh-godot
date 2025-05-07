extends InputInterpreter

class_name ReplayInputInterpreter

var log_data
var current_tick
var is_p1

func read_input() -> Dictionary:
	var input := {}
	if (is_p1):
		input[Enums.PlayerInput.InputVector] = log_data.p1_input[current_tick]
	else:
		input[Enums.PlayerInput.InputVector] = log_data.p2_input[current_tick]
	current_tick += 1
	return input
