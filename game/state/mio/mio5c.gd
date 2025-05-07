extends MioAttackState

class_name Mio5CState

func _init():
	endFrame = 30
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 3997696, Enums.StKey.Hurt1PosY : -21430272,
			Enums.StKey.Hurt1ScaleX : 692179, Enums.StKey.Hurt1ScaleY : 354035,
			Enums.StKey.Hurt2PosX : 2949120, Enums.StKey.Hurt2PosY : -13959168,
			Enums.StKey.Hurt2ScaleX : 430035, Enums.StKey.Hurt2ScaleY : -705015,
			Enums.StKey.Hurt3PosX : -131071, Enums.StKey.Hurt3PosY : -11468801,
			Enums.StKey.Hurt3ScaleX : 561893, Enums.StKey.Hurt3ScaleY : -1088870,
			},
		12 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit1PosX : 8323071, Enums.StKey.Hit1PosY : -16384002,
			Enums.StKey.Hit1ScaleX : 1948257, Enums.StKey.Hit1ScaleY : -341914,
			Enums.StKey.Hit2PosX : 25296898, Enums.StKey.Hit2PosY : -21954564,
			Enums.StKey.Hit2ScaleX : 980095, Enums.StKey.Hit2ScaleY : -425806,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 13238272, Enums.StKey.Hurt1PosY : -5242880,
			Enums.StKey.Hurt1ScaleX : 692179, Enums.StKey.Hurt1ScaleY : 354035,
			Enums.StKey.Hurt2PosX : 983040, Enums.StKey.Hurt2PosY : -22413310,
			Enums.StKey.Hurt2ScaleX : 430035, Enums.StKey.Hurt2ScaleY : -705015,
			Enums.StKey.Hurt3PosX : 5898240, Enums.StKey.Hurt3PosY : -11010049,
			Enums.StKey.Hurt3ScaleX : 561893, Enums.StKey.Hurt3ScaleY : -1088870,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_hitstun: 10,
			Enums.StKey.hitstun: 19,
			Enums.StKey.attack_damage: 45,
			Enums.StKey.min_damage: 5,
			Enums.StKey.counter_launch_dir_x: SGFixed.ONE*10,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*30,
			},
		17 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 13238272, Enums.StKey.Hurt1PosY : -5242880,
			Enums.StKey.Hurt1ScaleX : 692179, Enums.StKey.Hurt1ScaleY : 354035,
			Enums.StKey.Hurt2PosX : 983040, Enums.StKey.Hurt2PosY : -22413310,
			Enums.StKey.Hurt2ScaleX : 430035, Enums.StKey.Hurt2ScaleY : -705015,
			Enums.StKey.Hurt3PosX : 5898240, Enums.StKey.Hurt3PosY : -11010049,
			Enums.StKey.Hurt3ScaleX : 561893, Enums.StKey.Hurt3ScaleY : -1088870,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("5C")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Stand6C"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "Stand6A"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Crouch3C"
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Crouch2C"
