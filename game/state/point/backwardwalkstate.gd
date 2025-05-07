extends IdleState

class_name BackwardWalkState

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("BackwardWalk")
	state[Enums.StKey.velocity_y] = 0

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	state[Enums.StKey.sync_rate] -= 3000

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface]) and
		not (interpreter.is_button_down(Enums.InputFlags.AHold) or
		interpreter.is_button_down(Enums.InputFlags.BHold) or
		interpreter.is_button_down(Enums.InputFlags.CHold) or
		interpreter.is_button_down(Enums.InputFlags.DHold))):
		pass
	else:
		common_idle_transitions(state, interpreter)
