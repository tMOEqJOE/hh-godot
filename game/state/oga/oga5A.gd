extends OgaAttackState

class_name Oga5AState

func _init():
	endFrame = 15
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 10354688, Enums.StKey.Hurt1PosY : -27000832,
			Enums.StKey.Hurt1ScaleX : 2058119, Enums.StKey.Hurt1ScaleY : -699443,
			Enums.StKey.Hurt2PosX : -589824, Enums.StKey.Hurt2PosY : -28246016,
			Enums.StKey.Hurt2ScaleX : 826534, Enums.StKey.Hurt2ScaleY : -679323,
			Enums.StKey.Hurt3PosX : -2490366, Enums.StKey.Hurt3PosY : -12976128,
			Enums.StKey.Hurt3ScaleX : 896890, Enums.StKey.Hurt3ScaleY : -1310808,
			},
		4 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 10354688, Enums.StKey.Hurt1PosY : -27000832,
			Enums.StKey.Hurt1ScaleX : 2058119, Enums.StKey.Hurt1ScaleY : -699443,
			Enums.StKey.Hurt2PosX : -589824, Enums.StKey.Hurt2PosY : -28246016,
			Enums.StKey.Hurt2ScaleX : 826534, Enums.StKey.Hurt2ScaleY : -679323,
			Enums.StKey.Hurt3PosX : -2490366, Enums.StKey.Hurt3PosY : -12976128,
			Enums.StKey.Hurt3ScaleX : 896890, Enums.StKey.Hurt3ScaleY : -1310808,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 13893632, Enums.StKey.Hit1PosY : -24379392,
			Enums.StKey.Hit1ScaleX : 1456925, Enums.StKey.Hit1ScaleY : 383934,
			Enums.StKey.hitstop: 8,
			Enums.StKey.attack_damage: 15,
			Enums.StKey.hitstun: Util.DEFAULT_LIGHT_HITSTUN,
			Enums.StKey.blockstun: Util.DEFAULT_LIGHT_BLOCKSTUN,
			Enums.StKey.attack_type : Enums.AttackType.Strike,
			Enums.StKey.counter_hit: Enums.AttackType.Strike,
			Enums.StKey.counter_launch_dir_x: Util.BASE_SHORT_STRIKE_X_PUSHBACK,
			Enums.StKey.counter_launch_dir_y: Util.BASE_AIR_Y_PUSHBACK,
			Enums.StKey.block_dir_x : Util.BASE_SHORT_STRIKE_X_PUSHBACK,
			Enums.StKey.block_dir_y : Util.BASE_AIR_Y_PUSHBACK,
			Enums.StKey.launch_dir_x: Util.BASE_SHORT_STRIKE_X_PUSHBACK,
			Enums.StKey.launch_dir_y: Util.BASE_AIR_Y_PUSHBACK,
			},
		8 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 10354688, Enums.StKey.Hurt1PosY : -27000832,
			Enums.StKey.Hurt1ScaleX : 2058119, Enums.StKey.Hurt1ScaleY : -699443,
			Enums.StKey.Hurt2PosX : -589824, Enums.StKey.Hurt2PosY : -28246016,
			Enums.StKey.Hurt2ScaleX : 826534, Enums.StKey.Hurt2ScaleY : -679323,
			Enums.StKey.Hurt3PosX : -2490366, Enums.StKey.Hurt3PosY : -12976128,
			Enums.StKey.Hurt3ScaleX : 896890, Enums.StKey.Hurt3ScaleY : -1310808,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("5A")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) and 
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
		elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "Stand5A"
