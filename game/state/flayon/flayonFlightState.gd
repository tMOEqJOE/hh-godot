extends FlayonAirAttackState

class_name FlayonFlightState

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
	anim.play("FlightEnter")
	state[Enums.StKey.drag_x] = Util.FRICTION
	state[Enums.StKey.accel_y] = 0
	
func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 8):
		state[Enums.StKey.frame] = 2
	state[Enums.StKey.super_meter] -= Util.FLIGHT_METER_DRAIN

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	super.handle_input(state, interpreter)
	if (
			(interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]))
			):
		if (state[Enums.StKey.velocity_x] > -SGFixed.ONE*16):
			state[Enums.StKey.accel_x] = -SGFixed.ONE*8
		else:
			state[Enums.StKey.accel_x] = 0
	elif ( 
			(interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N9, state[Enums.StKey.leftface]))
			):
		if (state[Enums.StKey.velocity_x] < SGFixed.ONE*16):
			state[Enums.StKey.accel_x] = SGFixed.ONE*8
		else:
			state[Enums.StKey.accel_x] = 0
	else:
		state[Enums.StKey.accel_x] = 0
		state[Enums.StKey.velocity_x] = 0
	
	if (
			(interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N8, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N9, state[Enums.StKey.leftface]))
			):
		if (state[Enums.StKey.velocity_y] > -SGFixed.ONE*16):
			state[Enums.StKey.accel_y] = -SGFixed.ONE*8
		else:
			state[Enums.StKey.accel_y] = 0
	elif (
			(interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]))
			):
		if (state[Enums.StKey.velocity_y] < SGFixed.ONE*16):
			state[Enums.StKey.accel_y] = SGFixed.ONE*8
	else:
		state[Enums.StKey.accel_y] = 0
		state[Enums.StKey.velocity_y] = 0

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand):
		pass
	else:
		super.reaction(state, interpreter, event_cause)
