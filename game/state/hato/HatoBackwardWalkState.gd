extends HatoIdleState

class_name HatoBackwardWalkState

const MOVEMENT_SPEED := -SGFixed.ONE*12

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true, 
			Enums.StKey.Hurt1Disable : false,
			Enums.StKey.Hurt1PosX : -327680, Enums.StKey.Hurt1PosY : -20447234,
			Enums.StKey.Hurt1ScaleX : 841262, Enums.StKey.Hurt1ScaleY : 1777410,
			},
	}
	
func enter(state: Dictionary) -> void:
	super.enter(state)
	
	anim.play("BackwardWalk")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] < 5):
		if (state[Enums.StKey.velocity_x] > -SGFixed.ONE*5):
			state[Enums.StKey.velocity_x] = -SGFixed.ONE*5
			state[Enums.StKey.drag_x] = 0
	else:
		if (state[Enums.StKey.velocity_x] > MOVEMENT_SPEED):
			state[Enums.StKey.velocity_x] = MOVEMENT_SPEED
			state[Enums.StKey.drag_x] = 0

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (not (interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface])) or
			(
				interpreter.is_button_down(Enums.InputFlags.AUp) or
				interpreter.is_button_down(Enums.InputFlags.BUp) or
				interpreter.is_button_down(Enums.InputFlags.CUp) or
				interpreter.is_button_down(Enums.InputFlags.DUp)
			)
		):
		common_idle_transitions(state, interpreter)
