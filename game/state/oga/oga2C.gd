extends OgaCrouchAttackState

class_name Oga2CState

func _init():
	endFrame = 32
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -3080195, Enums.StKey.Hurt1PosY : -14024704,
			Enums.StKey.Hurt1ScaleX : 1657215, Enums.StKey.Hurt1ScaleY : -450676,
			Enums.StKey.Hurt2PosX : -6488064, Enums.StKey.Hurt2PosY : -14286848,
			Enums.StKey.Hurt2ScaleX : 620817, Enums.StKey.Hurt2ScaleY : -650113,
			Enums.StKey.Hurt3PosX : 20840448, Enums.StKey.Hurt3PosY : -13107200,
			Enums.StKey.Hurt3ScaleX : 1280424, Enums.StKey.Hurt3ScaleY : -275664,
			},
		10 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit1PosX : 14942208, Enums.StKey.Hit1PosY : -13238276,
			Enums.StKey.Hit1ScaleX : 1802455, Enums.StKey.Hit1ScaleY : 224295,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -3080195, Enums.StKey.Hurt1PosY : -14024704,
			Enums.StKey.Hurt1ScaleX : 1657215, Enums.StKey.Hurt1ScaleY : -450676,
			Enums.StKey.Hurt2PosX : -6488064, Enums.StKey.Hurt2PosY : -14286848,
			Enums.StKey.Hurt2ScaleX : 620817, Enums.StKey.Hurt2ScaleY : -650113,
			Enums.StKey.Hurt3PosX : 20840448, Enums.StKey.Hurt3PosY : -13107200,
			Enums.StKey.Hurt3ScaleX : 1280424, Enums.StKey.Hurt3ScaleY : -275664,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.guard: Enums.GuardType.Low,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.launch_dir_x: -SGFixed.ONE*12,
			Enums.StKey.launch_dir_y: -SGFixed.ONE*30,
			Enums.StKey.attack_damage: 40,
			Enums.StKey.hitstun: 60,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_hitstun: 60,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*12,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*40,
			},
		14 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 19070976, Enums.StKey.Hurt1PosY : -3866624,
			Enums.StKey.Hurt1ScaleX : 534613, Enums.StKey.Hurt1ScaleY : 274398,
			Enums.StKey.Hurt2PosX : 6750208, Enums.StKey.Hurt2PosY : -14286848,
			Enums.StKey.Hurt2ScaleX : 1073082, Enums.StKey.Hurt2ScaleY : 628093,
			Enums.StKey.Hurt3PosX : 1310719, Enums.StKey.Hurt3PosY : -5636095,
			Enums.StKey.Hurt3ScaleX : 1376776, Enums.StKey.Hurt3ScaleY : 534814,
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
