extends MioCrouchAttackState

class_name Mio2AState

func _init():
	endFrame = 15
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -1572863, Enums.StKey.Hurt1PosY : -17170432,
			Enums.StKey.Hurt1ScaleX : 543707, Enums.StKey.Hurt1ScaleY : 357275,
			Enums.StKey.Hurt2PosX : -1048576, Enums.StKey.Hurt2PosY : -6488064,
			Enums.StKey.Hurt2ScaleX : 587346, Enums.StKey.Hurt2ScaleY : -782652,
			Enums.StKey.Hurt3PosX : 8650753, Enums.StKey.Hurt3PosY : -1835008,
			Enums.StKey.Hurt3ScaleX : 449555, Enums.StKey.Hurt3ScaleY : -305170,
			},
		6 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 6453600, Enums.StKey.Hurt1PosY : -12451840,
			Enums.StKey.Hurt1ScaleX : 443707, Enums.StKey.Hurt1ScaleY : 357275,
			Enums.StKey.Hurt2PosX : -1048576, Enums.StKey.Hurt2PosY : -6488064,
			Enums.StKey.Hurt2ScaleX : 587346, Enums.StKey.Hurt2ScaleY : -782652,
			Enums.StKey.Hurt3PosX : 11403263, Enums.StKey.Hurt3PosY : -3866624,
			Enums.StKey.Hurt3ScaleX : 801976, Enums.StKey.Hurt3ScaleY : -507972,
			Enums.StKey.hitstun: Util.DEFAULT_LIGHT_HITSTUN,
			Enums.StKey.blockstun: Util.DEFAULT_LIGHT_BLOCKSTUN,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.Hit1PosX : 11403263, Enums.StKey.Hit1PosY : -2228224,
			Enums.StKey.Hit1ScaleX : 933349, Enums.StKey.Hit1ScaleY : 272771,
			Enums.StKey.attack_damage: 20,
			Enums.StKey.min_damage: 3,
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
		8 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 6553600, Enums.StKey.Hurt1PosY : -12451840,
			Enums.StKey.Hurt1ScaleX : 543707, Enums.StKey.Hurt1ScaleY : 357275,
			Enums.StKey.Hurt2PosX : -1048576, Enums.StKey.Hurt2PosY : -6488064,
			Enums.StKey.Hurt2ScaleX : 587346, Enums.StKey.Hurt2ScaleY : -782652,
			Enums.StKey.Hurt3PosX : 11403263, Enums.StKey.Hurt3PosY : -3866624,
			Enums.StKey.Hurt3ScaleX : 801976, Enums.StKey.Hurt3ScaleY : -507972,
			},
	}


# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("2A")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
#	if (state[Enums.StKey.frame] == 8):
#		state[Enums.StKey.hitStopFrame] = 0

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
		elif (interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Stand5C"
		elif (state[Enums.StKey.distance_to_opponent] <= Util.PROXY_NORMAL and
				interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "StandcB"
		elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "Stand5B"
