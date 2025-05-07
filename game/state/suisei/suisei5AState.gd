extends SuiseiAttackState

class_name Suisei5AState

func _init():
	endFrame = 18
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -3276800, Enums.StKey.Hurt1PosY : -16187396,
			Enums.StKey.Hurt1ScaleX : 480251, Enums.StKey.Hurt1ScaleY : 1634821,
			Enums.StKey.Hurt2PosX : 2752512, Enums.StKey.Hurt2PosY : -15728641,
			Enums.StKey.Hurt2ScaleX : 670493, Enums.StKey.Hurt2ScaleY : 534448,
			Enums.StKey.Hurt3PosX : 13959167, Enums.StKey.Hurt3PosY : -8519679,
			Enums.StKey.Hurt3ScaleX : 376905, Enums.StKey.Hurt3ScaleY : 376155,
			},
		5 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit1PosX : 7405568, Enums.StKey.Hit1PosY : -16646144,
			Enums.StKey.Hit1ScaleX : 657665, Enums.StKey.Hit1ScaleY : 734906,
			Enums.StKey.Hit2PosX : 11665408, Enums.StKey.Hit2PosY : -6881282,
			Enums.StKey.Hit2ScaleX : 850364, Enums.StKey.Hit2ScaleY : 428488,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -3276800, Enums.StKey.Hurt1PosY : -16187396,
			Enums.StKey.Hurt1ScaleX : 480251, Enums.StKey.Hurt1ScaleY : 1634821,
			Enums.StKey.Hurt2PosX : 2752512, Enums.StKey.Hurt2PosY : -15728641,
			Enums.StKey.Hurt2ScaleX : 670493, Enums.StKey.Hurt2ScaleY : 534448,
			Enums.StKey.Hurt3PosX : 13959167, Enums.StKey.Hurt3PosY : -8519679,
			Enums.StKey.Hurt3ScaleX : 376905, Enums.StKey.Hurt3ScaleY : 376155,
			Enums.StKey.guard: Enums.GuardType.Low,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.attack_damage: 20,
			Enums.StKey.meter_build: SGFixed.ONE*1000,
			Enums.StKey.hitstop: 8,
			Enums.StKey.hitstun: Util.DEFAULT_HITSTUN,
			Enums.StKey.blockstun: Util.DEFAULT_BLOCKSTUN,
			Enums.StKey.attack_type : Enums.AttackType.Strike,
			Enums.StKey.counter_hit: Enums.AttackType.Strike,
			Enums.StKey.counter_launch_dir_x: Util.BASE_SHORT_STRIKE_X_PUSHBACK,
			Enums.StKey.counter_launch_dir_y: Util.BASE_AIR_Y_PUSHBACK,
			Enums.StKey.block_dir_x : Util.BASE_SHORT_STRIKE_X_PUSHBACK,
			Enums.StKey.block_dir_y : Util.BASE_AIR_Y_PUSHBACK,
			Enums.StKey.launch_dir_x: Util.BASE_SHORT_STRIKE_X_PUSHBACK,
			Enums.StKey.launch_dir_y: Util.BASE_AIR_Y_PUSHBACK,
			},
		9 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -3276800, Enums.StKey.Hurt1PosY : -16187396,
			Enums.StKey.Hurt1ScaleX : 480251, Enums.StKey.Hurt1ScaleY : 1634821,
			Enums.StKey.Hurt2PosX : 2752512, Enums.StKey.Hurt2PosY : -15728641,
			Enums.StKey.Hurt2ScaleX : 670493, Enums.StKey.Hurt2ScaleY : 534448,
			Enums.StKey.Hurt3PosX : 13959167, Enums.StKey.Hurt3PosY : -8519679,
			Enums.StKey.Hurt3ScaleX : 376905, Enums.StKey.Hurt3ScaleY : 376155,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("5A")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "Stand6A"
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
		elif (state[Enums.StKey.distance_to_opponent] <= Util.PROXY_NORMAL and
				interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "StandcB"
		elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "Stand5B"
		elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "Stand5A"
