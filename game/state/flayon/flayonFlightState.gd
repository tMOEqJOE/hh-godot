extends FlayonAirAttackState

class_name FlayonFlightState

const ACCEL = SGFixed.ONE*5
const SPEED = SGFixed.ONE*16

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
	state[Enums.StKey.leftfaceOK] = true
	state[Enums.StKey.hitStopFrame] = 0
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
			interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]))
			):
		if (state[Enums.StKey.velocity_x] > -SPEED):
			state[Enums.StKey.accel_x] = -ACCEL
		else:
			state[Enums.StKey.accel_x] = 0
	elif ( 
			(interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N9, state[Enums.StKey.leftface]))
			):
		if (state[Enums.StKey.velocity_x] < SPEED):
			state[Enums.StKey.accel_x] = ACCEL
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
		if (state[Enums.StKey.velocity_y] > -SPEED):
			state[Enums.StKey.accel_y] = -ACCEL
		else:
			state[Enums.StKey.accel_y] = 0
	elif (
			(interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]))
			):
		if (state[Enums.StKey.velocity_y] < SPEED):
			state[Enums.StKey.accel_y] = ACCEL
		else:
			state[Enums.StKey.accel_y] = 0
	else:
		state[Enums.StKey.accel_y] = 0
		state[Enums.StKey.velocity_y] = 0
	
	if (state[Enums.StKey.super_meter] <= 0):
		change_state.call("FlightNoFuel")

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Flight5C"
		elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "Flight5B"
		elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "Flight5A"

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	super.special_cancel(state,interpreter)
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.ADown, state[Enums.StKey.leftface]) or 
				interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.BDown, state[Enums.StKey.leftface]) or 
				interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "FlightExit"

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand):
		pass
	else:
		super.reaction(state, interpreter, event_cause)
