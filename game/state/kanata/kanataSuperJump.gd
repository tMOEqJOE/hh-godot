extends "res://game/state/kanata/mainstates/kanataAirIdleState.gd"

class_name KanataSuperJumpState

const JUMP_SPEED := SGFixed.ONE*-60

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 65536, Enums.StKey.Hurt1PosY : -15597568,
			Enums.StKey.Hurt1ScaleX : 938999, Enums.StKey.Hurt1ScaleY : 1087430,
			},
	}


func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.leftfaceOK] = true
	state[Enums.StKey.velocity_y] = JUMP_SPEED
	state[Enums.StKey.accel_y] = Util.KANATA_GRAVITY
	anim.play("Jump")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.velocity_x] > SGFixed.ONE*49):
		state[Enums.StKey.velocity_x] = SGFixed.ONE*49
	elif (state[Enums.StKey.velocity_x] < -SGFixed.ONE*49):
		state[Enums.StKey.velocity_x] = -SGFixed.ONE*49 

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	common_jump_transitions_default(state, interpreter)
	if ((interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N8, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N9, state[Enums.StKey.leftface]))):
		state[Enums.StKey.accel_y] = 105536
	elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]))):
		state[Enums.StKey.accel_y] = 225536
	else:
		state[Enums.StKey.accel_y] = Util.KANATA_GRAVITY
	
	if ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]))):
		state[Enums.StKey.accel_x] = -8536
	elif ((interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N9, state[Enums.StKey.leftface]))):
		state[Enums.StKey.accel_x] = 8536
	else:
		state[Enums.StKey.accel_x] = 0

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.BlockingOK:
			return true
		Enums.StateProperty.GroundThrowOK:
			return false
		_:
			return super.has_property(state,property)
