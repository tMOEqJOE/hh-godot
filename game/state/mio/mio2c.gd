extends MioCrouchAttackState

class_name Mio2CState

func _init():
	endFrame = 28
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true, Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 5505024, Enums.StKey.Hurt1PosY : -11665410,
			Enums.StKey.Hurt1ScaleX : 371401, Enums.StKey.Hurt1ScaleY : 601618,
			Enums.StKey.Hurt2PosX : 1638400, Enums.StKey.Hurt2PosY : -7143424,
			Enums.StKey.Hurt2ScaleX : 430035, Enums.StKey.Hurt2ScaleY : -705015,
			Enums.StKey.Hurt3PosX : 9764864, Enums.StKey.Hurt3PosY : -2752512,
			Enums.StKey.Hurt3ScaleX : 395314, Enums.StKey.Hurt3ScaleY : -284798,
			},
		10 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 5505024, Enums.StKey.Hurt1PosY : -11665410,
			Enums.StKey.Hurt1ScaleX : 371401, Enums.StKey.Hurt1ScaleY : 601618,
			Enums.StKey.Hurt2PosX : 1638400, Enums.StKey.Hurt2PosY : -7143424,
			Enums.StKey.Hurt2ScaleX : 430035, Enums.StKey.Hurt2ScaleY : -705015,
			Enums.StKey.Hurt3PosX : 9764864, Enums.StKey.Hurt3PosY : -2752512,
			Enums.StKey.Hurt3ScaleX : 395314, Enums.StKey.Hurt3ScaleY : -284798,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.Hit1PosX : 17432576, Enums.StKey.Hit1PosY : -3473408,
			Enums.StKey.Hit1ScaleX : 1260160, Enums.StKey.Hit1ScaleY : 488013,
			Enums.StKey.attack_damage: 40,
			Enums.StKey.min_damage: 10,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.guard: Enums.GuardType.Low,
			Enums.StKey.launch_dir_x: -SGFixed.ONE*12, # 17
			Enums.StKey.launch_dir_y: -SGFixed.ONE*30, # 32
			Enums.StKey.hitstun: 60,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_hitstun: 60,
			Enums.StKey.counter_launch_dir_x: SGFixed.ONE*5,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*40,
			},
		16 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 5505024, Enums.StKey.Hurt1PosY : -11665410,
			Enums.StKey.Hurt1ScaleX : 371401, Enums.StKey.Hurt1ScaleY : 601618,
			Enums.StKey.Hurt2PosX : 1638400, Enums.StKey.Hurt2PosY : -7143424,
			Enums.StKey.Hurt2ScaleX : 430035, Enums.StKey.Hurt2ScaleY : -705015,
			Enums.StKey.Hurt3PosX : 9764864, Enums.StKey.Hurt3PosY : -2752512,
			Enums.StKey.Hurt3ScaleX : 395314, Enums.StKey.Hurt3ScaleY : -284798,
			},
	}


# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("2C")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Stand6C"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Crouch3C"
