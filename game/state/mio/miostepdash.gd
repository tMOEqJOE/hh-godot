extends MioIdleState

class_name MioStepDashState

const DASH_SPEED := SGFixed.ONE*-20
const GRAVITY := SGFixed.ONE*3

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,
			Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -262144, Enums.StKey.Hurt1PosY : -7471104,
			Enums.StKey.Hurt1ScaleX : 522078, Enums.StKey.Hurt1ScaleY : 1436954,
			},
	}
	
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_x] = DASH_SPEED
	state[Enums.StKey.velocity_y] = 0

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	state[Enums.StKey.velocity_x] = state[Enums.StKey.velocity_x] + GRAVITY
	state[Enums.StKey.velocity_y] = 0

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) and
		not (interpreter.is_button_down(Enums.InputFlags.AHold) or
		interpreter.is_button_down(Enums.InputFlags.BHold) or
		interpreter.is_button_down(Enums.InputFlags.CHold) or
		interpreter.is_button_down(Enums.InputFlags.DHold))):
		pass
	else:
		common_idle_transitions(state, interpreter)
