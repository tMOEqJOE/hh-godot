extends MioAttackState

class_name Mio5AState

func _init():
	endFrame = 15
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt2PosX : 9306112, Enums.StKey.Hurt2PosY : -23134206,
			Enums.StKey.Hurt2ScaleX : 430035, Enums.StKey.Hurt2ScaleY : -705015,
			Enums.StKey.Hurt3PosX : 2883584, Enums.StKey.Hurt3PosY : -10944512,
			Enums.StKey.Hurt3ScaleX : 561893, Enums.StKey.Hurt3ScaleY : -1088870,
			},
		5 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit1PosX : 13500417, Enums.StKey.Hit1PosY : -9240572,
			Enums.StKey.Hit1ScaleX : 708524, Enums.StKey.Hit1ScaleY : 335509,
			Enums.StKey.Hit2PosX : 10420224, Enums.StKey.Hit2PosY : -13762560,
			Enums.StKey.Hit2ScaleX : 471598, Enums.StKey.Hit2ScaleY : -407452,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 12255231, Enums.StKey.Hurt1PosY : -11599871,
			Enums.StKey.Hurt1ScaleX : 692179, Enums.StKey.Hurt1ScaleY : 354035,
			Enums.StKey.Hurt2PosX : 3932160, Enums.StKey.Hurt2PosY : -26542080,
			Enums.StKey.Hurt2ScaleX : 430035, Enums.StKey.Hurt2ScaleY : -705015,
			Enums.StKey.Hurt3PosX : -131071, Enums.StKey.Hurt3PosY : -11468801,
			Enums.StKey.Hurt3ScaleX : 561893, Enums.StKey.Hurt3ScaleY : -1088870,
			Enums.StKey.hitstop: 8,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.attack_damage: 10,
			Enums.StKey.min_damage: 3,
			Enums.StKey.hitstun: Util.DEFAULT_LIGHT_HITSTUN,
			Enums.StKey.blockstun: Util.DEFAULT_LIGHT_BLOCKSTUN,
			Enums.StKey.guard: Enums.GuardType.Low,
			Enums.StKey.attack_type : Enums.AttackType.Strike,
			Enums.StKey.counter_hit: Enums.AttackType.Strike,
			Enums.StKey.counter_launch_dir_x: Util.BASE_SHORT_STRIKE_X_PUSHBACK,
			Enums.StKey.counter_launch_dir_y: Util.BASE_AIR_Y_PUSHBACK,
			Enums.StKey.block_dir_x : Util.BASE_SHORT_STRIKE_X_PUSHBACK,
			Enums.StKey.block_dir_y : Util.BASE_AIR_Y_PUSHBACK,
			Enums.StKey.launch_dir_x: Util.BASE_SHORT_STRIKE_X_PUSHBACK,
			Enums.StKey.launch_dir_y: Util.BASE_AIR_Y_PUSHBACK,
			},
		7 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 12255231, Enums.StKey.Hurt1PosY : -11599871,
			Enums.StKey.Hurt1ScaleX : 692179, Enums.StKey.Hurt1ScaleY : 354035,
			Enums.StKey.Hurt2PosX : 3932160, Enums.StKey.Hurt2PosY : -26542080,
			Enums.StKey.Hurt2ScaleX : 430035, Enums.StKey.Hurt2ScaleY : -705015,
			Enums.StKey.Hurt3PosX : -131071, Enums.StKey.Hurt3PosY : -11468801,
			Enums.StKey.Hurt3ScaleX : 561893, Enums.StKey.Hurt3ScaleY : -1088870,
			},
	}


# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("5A")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 7):
		state[Enums.StKey.hitStopFrame] = 0

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Stand6C"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Crouch3C"
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Crouch2C"
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "Crouch2B"
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "Crouch2A"
		elif (interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Stand5C"
		elif (state[Enums.StKey.distance_to_opponent] <= Util.PROXY_NORMAL and
				interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "StandcB"
		elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "Stand5B"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "Stand6A"
