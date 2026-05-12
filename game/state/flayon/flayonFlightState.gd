extends FlayonFlightBaseState

class_name FlayonFlightState

const ACCEL = SGFixed.ONE*5
const SPEED = SGFixed.ONE*15
const UP_SPEED = SGFixed.ONE*6

func _init():
	endFrame = 180
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -262144, Enums.StKey.Hurt1PosY : -13471104,
			Enums.StKey.Hurt1ScaleX : 822078, Enums.StKey.Hurt1ScaleY : 1436954,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("Flight")
	state[Enums.StKey.hitStopFrame] = 0
	
func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 8):
		state[Enums.StKey.frame] = 2
	state[Enums.StKey.super_meter] -= Util.FLIGHT_METER_DRAIN

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	super.handle_input(state, interpreter)
	if (
			(interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]))
			):
		if (state[Enums.StKey.velocity_x] > -SPEED):
			state[Enums.StKey.accel_x] = -ACCEL
		else:
			state[Enums.StKey.accel_x] = 0
			state[Enums.StKey.velocity_x] = -SPEED 
	elif ( 
			(interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N9, state[Enums.StKey.leftface]))
			):
		if (state[Enums.StKey.velocity_x] < SPEED):
			state[Enums.StKey.accel_x] = ACCEL
		else:
			state[Enums.StKey.accel_x] = 0
			state[Enums.StKey.velocity_x] = SPEED
	else:
		state[Enums.StKey.accel_x] = 0
		state[Enums.StKey.velocity_x] = 0
	
	if (
			(interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N8, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N9, state[Enums.StKey.leftface]))
			):
		if (state[Enums.StKey.velocity_y] > -UP_SPEED):
			state[Enums.StKey.accel_y] = -ACCEL
		else:
			state[Enums.StKey.accel_y] = 0
			state[Enums.StKey.velocity_y] = -UP_SPEED
	elif (
			(interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]))
			):
		if (state[Enums.StKey.velocity_y] < SPEED):
			state[Enums.StKey.accel_y] = ACCEL
		else:
			state[Enums.StKey.accel_y] = 0
			state[Enums.StKey.velocity_y] = SPEED
	else:
		state[Enums.StKey.accel_y] = 0
		state[Enums.StKey.velocity_y] = 0
	
	if (state[Enums.StKey.super_meter] <= 0):
		change_state.call("FlightNoFuel")
