extends AngelAttackState

class_name Angel5AState

func _init():
	endFrame = 12
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 1572864, Enums.StKey.Hurt1PosY : -10485762,
			Enums.StKey.Hurt1ScaleX : 554342, Enums.StKey.Hurt1ScaleY : -1021119,
			Enums.StKey.Hurt2PosX : 6946816, Enums.StKey.Hurt2PosY : -19005440,
			Enums.StKey.Hurt2ScaleX : 505049, Enums.StKey.Hurt2ScaleY : 482913,
			Enums.StKey.Hurt3PosX : -1048576, Enums.StKey.Hurt3PosY : -23789568,
			Enums.StKey.Hurt3ScaleX : 618677, Enums.StKey.Hurt3ScaleY : -386558,
			},
		3 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit1PosX : 8323071, Enums.StKey.Hit1PosY : -16449536,
			Enums.StKey.Hit1ScaleX : 583304, Enums.StKey.Hit1ScaleY : 652648,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 1572864, Enums.StKey.Hurt1PosY : -10485762,
			Enums.StKey.Hurt1ScaleX : 554342, Enums.StKey.Hurt1ScaleY : -1021119,
			Enums.StKey.Hurt2PosX : 6946816, Enums.StKey.Hurt2PosY : -19005440,
			Enums.StKey.Hurt2ScaleX : 505049, Enums.StKey.Hurt2ScaleY : 482913,
			Enums.StKey.Hurt3PosX : -1048576, Enums.StKey.Hurt3PosY : -23789568,
			Enums.StKey.Hurt3ScaleX : 618677, Enums.StKey.Hurt3ScaleY : -386558,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.attack_damage: 10,
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
		5 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit1PosX : 16318466, Enums.StKey.Hit1PosY : -27590658,
			Enums.StKey.Hit1ScaleX : 643169, Enums.StKey.Hit1ScaleY : 511310,
			Enums.StKey.Hit2PosX : 8388607, Enums.StKey.Hit2PosY : -16908288,
			Enums.StKey.Hit2ScaleX : 583304, Enums.StKey.Hit2ScaleY : 652648,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 1572864, Enums.StKey.Hurt1PosY : -10485762,
			Enums.StKey.Hurt1ScaleX : 554342, Enums.StKey.Hurt1ScaleY : -1021119,
			Enums.StKey.Hurt2PosX : 6946816, Enums.StKey.Hurt2PosY : -19005440,
			Enums.StKey.Hurt2ScaleX : 505049, Enums.StKey.Hurt2ScaleY : 482913,
			Enums.StKey.Hurt3PosX : -1048576, Enums.StKey.Hurt3PosY : -23789568,
			Enums.StKey.Hurt3ScaleX : 618677, Enums.StKey.Hurt3ScaleY : -386558,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.attack_damage: 20,
			},
		8 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 1572864, Enums.StKey.Hurt1PosY : -10485762,
			Enums.StKey.Hurt1ScaleX : 554342, Enums.StKey.Hurt1ScaleY : -1021119,
			Enums.StKey.Hurt2PosX : 6946816, Enums.StKey.Hurt2PosY : -19005440,
			Enums.StKey.Hurt2ScaleX : 505049, Enums.StKey.Hurt2ScaleY : 482913,
			Enums.StKey.Hurt3PosX : -1048576, Enums.StKey.Hurt3PosY : -23789568,
			Enums.StKey.Hurt3ScaleX : 618677, Enums.StKey.Hurt3ScaleY : -386558,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("Angel5A")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "AngelStand6C"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "AngelStand6A"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "AngelCrouch3C"
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "AngelCrouch2C"
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "AngelCrouch2B"
		elif (interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "AngelStand5C"
		elif (state[Enums.StKey.distance_to_opponent] <= Util.PROXY_NORMAL and
				interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "AngelStandcB"
		elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "AngelStand5B"
