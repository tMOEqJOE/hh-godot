extends SuiseiCrouchAttackState

class_name Suisei2AState

func _init():
	endFrame = 11
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 589824, Enums.StKey.Hurt1PosY : -6619136,
			Enums.StKey.Hurt1ScaleX : 800996, Enums.StKey.Hurt1ScaleY : 673303,
			Enums.StKey.Hurt2PosX : -3407872, Enums.StKey.Hurt2PosY : -16121856,
			Enums.StKey.Hurt2ScaleX : 577283, Enums.StKey.Hurt2ScaleY : 391120,
			},
		4 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit1PosX : 655360, Enums.StKey.Hit1PosY : -27493506,
			Enums.StKey.Hit1ScaleX : 744752, Enums.StKey.Hit1ScaleY : 909274,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 589824, Enums.StKey.Hurt1PosY : -6619136,
			Enums.StKey.Hurt1ScaleX : 800996, Enums.StKey.Hurt1ScaleY : 673303,
			Enums.StKey.Hurt2PosX : -3407872, Enums.StKey.Hurt2PosY : -16121856,
			Enums.StKey.Hurt2ScaleX : 577283, Enums.StKey.Hurt2ScaleY : 391120,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.guard: Enums.GuardType.Low,
			Enums.StKey.attack_damage: 25,
			Enums.StKey.meter_build: SGFixed.ONE*1000,
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
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 589824, Enums.StKey.Hurt1PosY : -6619136,
			Enums.StKey.Hurt1ScaleX : 800996, Enums.StKey.Hurt1ScaleY : 673303,
			Enums.StKey.Hurt2PosX : -3407872, Enums.StKey.Hurt2PosY : -16121856,
			Enums.StKey.Hurt2ScaleX : 577283, Enums.StKey.Hurt2ScaleY : 391120,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("2A")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
#	if (state[Enums.StKey.frame] == 6):
#		state[Enums.StKey.hitStopFrame] = 0

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
