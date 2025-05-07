extends SuicopathAirAttackState

class_name Suicopath6AState

func _init():
	endFrame = 80
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 3080192, Enums.StKey.Hurt1PosY : -8257537,
			Enums.StKey.Hurt1ScaleX : 1096239, Enums.StKey.Hurt1ScaleY : 967118,
			Enums.StKey.Hurt2PosX : -9371648, Enums.StKey.Hurt2PosY : -2359296,
			Enums.StKey.Hurt2ScaleX : 871868, Enums.StKey.Hurt2ScaleY : 393004,
			Enums.StKey.Hurt3PosX : 14090242, Enums.StKey.Hurt3PosY : -9830400,
			Enums.StKey.Hurt3ScaleX : 722139, Enums.StKey.Hurt3ScaleY : 457863,
			},
		21 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit1PosX : 20316160, Enums.StKey.Hit1PosY : -27000830,
			Enums.StKey.Hit1ScaleX : 1774487, Enums.StKey.Hit1ScaleY : 672969,
			Enums.StKey.Hit2PosX : 12582912, Enums.StKey.Hit2PosY : -19529728,
			Enums.StKey.Hit2ScaleX : 989170, Enums.StKey.Hit2ScaleY : 1076104,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 4259840, Enums.StKey.Hurt1PosY : -14942206,
			Enums.StKey.Hurt1ScaleX : 1096239, Enums.StKey.Hurt1ScaleY : 967118,
			Enums.StKey.Hurt2PosX : -12124160, Enums.StKey.Hurt2PosY : -5046271,
			Enums.StKey.Hurt2ScaleX : 871868, Enums.StKey.Hurt2ScaleY : 393004,
			Enums.StKey.Hurt3PosX : 14745601, Enums.StKey.Hurt3PosY : -10223616,
			Enums.StKey.Hurt3ScaleX : 722139, Enums.StKey.Hurt3ScaleY : 457863,
			Enums.StKey.hit_box_colliding_frame : 2,
			Enums.StKey.attack_damage: 30,
			Enums.StKey.attack_type : Enums.AttackType.Strike,
			Enums.StKey.meter_build: 0,
			Enums.StKey.hitstop: 3,
			Enums.StKey.min_damage: 3,
			Enums.StKey.chip_damage: 3,
#			Enums.StKey.hitstun: 18,
			Enums.StKey.counter_hit: Enums.AttackType.Strike,
			},
		50 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 4259840, Enums.StKey.Hurt1PosY : -14942206,
			Enums.StKey.Hurt1ScaleX : 1096239, Enums.StKey.Hurt1ScaleY : 967118,
			Enums.StKey.Hurt2PosX : -12124160, Enums.StKey.Hurt2PosY : -5046271,
			Enums.StKey.Hurt2ScaleX : 871868, Enums.StKey.Hurt2ScaleY : 393004,
			Enums.StKey.Hurt3PosX : 14745601, Enums.StKey.Hurt3PosY : -10223616,
			Enums.StKey.Hurt3ScaleX : 722139, Enums.StKey.Hurt3ScaleY : 457863,
			},
	}


# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.drag_x] = Util.FRICTION
	anim.play("Suicopath6A")

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	super.handle_input(state, interpreter)
	if (state[Enums.StKey.frame] > 15 and state[Enums.StKey.frame] < 50):
		if (state[Enums.StKey.velocity_x] > -SGFixed.ONE*5 and (
			interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]))):
			state[Enums.StKey.accel_x] = -35536
		elif (state[Enums.StKey.velocity_x] < SGFixed.ONE*16 and (
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N9, state[Enums.StKey.leftface]))):
			state[Enums.StKey.accel_x] = SGFixed.ONE
		else:
			state[Enums.StKey.accel_x] = 0
		
		if ((interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N8, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N9, state[Enums.StKey.leftface]))):
			state[Enums.StKey.accel_y] = 15536
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]))):
			state[Enums.StKey.accel_y] = 222536
		else:
			state[Enums.StKey.accel_y] = 65536

# Writing _delta instead of delta here prevents the unused variable warning.
func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 12):
		state[Enums.StKey.velocity_x] = Util.fixed_max(SGFixed.ONE*8, state[Enums.StKey.velocity_x])
		state[Enums.StKey.velocity_y] = -SGFixed.ONE*30
		state[Enums.StKey.drag_x] = 0
	elif (state[Enums.StKey.frame] == 55):
		state[Enums.StKey.accel_y] = Util.GRAVITY
		state[Enums.StKey.accel_x] = 0

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand and state[Enums.StKey.frame] <= 18):
		pass
	else:
		super.reaction(state, interpreter, event_cause)
