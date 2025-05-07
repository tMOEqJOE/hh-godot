extends "res://game/state/kanata/mainstates/kanataAirIdleState.gd"

class_name KanataAirWingStanceAAState

func _init():
	endFrame = 400
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -6422528, Enums.StKey.Hurt1PosY : -13107200,
			Enums.StKey.Hurt1ScaleX : 803537, Enums.StKey.Hurt1ScaleY : 971143,
			Enums.StKey.Hurt2PosX : 5373951, Enums.StKey.Hurt2PosY : -18284542,
			Enums.StKey.Hurt2ScaleX : 964115, Enums.StKey.Hurt2ScaleY : 370909,
			Enums.StKey.Hurt3PosX : 13565953, Enums.StKey.Hurt3PosY : -24641538,
			Enums.StKey.Hurt3ScaleX : 533029, Enums.StKey.Hurt3ScaleY : 656697,
			},
		2 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Summon : "rundust",
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -6422528, Enums.StKey.Hurt1PosY : -13107200,
			Enums.StKey.Hurt1ScaleX : 803537, Enums.StKey.Hurt1ScaleY : 971143,
			Enums.StKey.Hurt2PosX : 5373951, Enums.StKey.Hurt2PosY : -18284542,
			Enums.StKey.Hurt2ScaleX : 964115, Enums.StKey.Hurt2ScaleY : 370909,
			Enums.StKey.Hurt3PosX : 13565953, Enums.StKey.Hurt3PosY : -24641538,
			Enums.StKey.Hurt3ScaleX : 533029, Enums.StKey.Hurt3ScaleY : 656697,
		},
	}
	
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("Moonkick")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 1):
		state[Enums.StKey.velocity_x] = Util.fixed_max(SGFixed.ONE*12, state[Enums.StKey.velocity_x])
		state[Enums.StKey.velocity_y] = -SGFixed.ONE*43

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == 0):
		state[Enums.StKey.leftfaceOK] = false
	if (state[Enums.StKey.frame] == endFrame):
		common_jump_transitions(state, interpreter)
	
	if (boost_OK(state, interpreter)):
		change_state.call("AirBoostCancel")

	if ((interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N8, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N9, state[Enums.StKey.leftface]))):
		state[Enums.StKey.accel_y] = 105536
	elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]))):
		state[Enums.StKey.accel_y] = 205536
	else:
		state[Enums.StKey.accel_y] = Util.KANATA_GRAVITY
	
	if ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]))):
		state[Enums.StKey.accel_x] = -35536
	elif ((interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N9, state[Enums.StKey.leftface]))):
		state[Enums.StKey.accel_x] = 35536
	else:
		state[Enums.StKey.accel_x] = 0

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.BlockingOK:
			return false
		_:
			return super.has_property(state,property)

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand):
		if (state[Enums.StKey.frame] >= 4):
			state[Enums.StKey.doubleJump] = 1
			state[Enums.StKey.airDash] = 1
			state[Enums.StKey.leftfaceOK] = true
			change_state.call("Stand")
	else:
		super.reaction(state, interpreter, event_cause)
