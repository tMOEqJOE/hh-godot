extends SuicopathCrouchAttackState

class_name Suicopath2AState

func _init():
	endFrame = 17
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -9109504,
			Enums.StKey.Hurt1ScaleX : 1249216, Enums.StKey.Hurt1ScaleY : 870269,
			Enums.StKey.Hurt2PosX : -1572863, Enums.StKey.Hurt2PosY : -18677760,
			Enums.StKey.Hurt2ScaleX : 577283, Enums.StKey.Hurt2ScaleY : 391120,
			Enums.StKey.Hurt3PosX : 19595264, Enums.StKey.Hurt3PosY : -12845056,
			Enums.StKey.Hurt3ScaleX : 776686, Enums.StKey.Hurt3ScaleY : 377347,
			},
		7 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit1PosX : 13893633, Enums.StKey.Hit1PosY : -13107199,
			Enums.StKey.Hit1ScaleX : 1770297, Enums.StKey.Hit1ScaleY : 269438,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -9109504,
			Enums.StKey.Hurt1ScaleX : 1249216, Enums.StKey.Hurt1ScaleY : 870269,
			Enums.StKey.Hurt2PosX : -1572863, Enums.StKey.Hurt2PosY : -18677760,
			Enums.StKey.Hurt2ScaleX : 577283, Enums.StKey.Hurt2ScaleY : 391120,
			Enums.StKey.Hurt3PosX : 19595264, Enums.StKey.Hurt3PosY : -12845056,
			Enums.StKey.Hurt3ScaleX : 776686, Enums.StKey.Hurt3ScaleY : 377347,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.guard: Enums.GuardType.Mid,
			Enums.StKey.attack_type : Enums.AttackType.WallBouncer,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*30,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*30,
			Enums.StKey.hitstop: 7,
			Enums.StKey.attack_damage: 20,
			Enums.StKey.min_damage:3,
			Enums.StKey.chip_damage:3,
			Enums.StKey.meter_build: 0,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 30,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*20,
			Enums.StKey.counter_launch_dir_y: SGFixed.ONE*50,
			},
		10 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -9109504,
			Enums.StKey.Hurt1ScaleX : 1249216, Enums.StKey.Hurt1ScaleY : 870269,
			Enums.StKey.Hurt2PosX : -1572863, Enums.StKey.Hurt2PosY : -18677760,
			Enums.StKey.Hurt2ScaleX : 577283, Enums.StKey.Hurt2ScaleY : 391120,
			Enums.StKey.Hurt3PosX : 19595264, Enums.StKey.Hurt3PosY : -12845056,
			Enums.StKey.Hurt3ScaleX : 776686, Enums.StKey.Hurt3ScaleY : 377347,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("Suicopath2A")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "AngelStand6A"
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "AngelCrouch2B"
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "AngelCrouch2A"
		elif (state[Enums.StKey.distance_to_opponent] <= Util.PROXY_NORMAL and
				interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "AngelStandcB"
		elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "AngelStand5B"
		elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "AngelStand5A"
