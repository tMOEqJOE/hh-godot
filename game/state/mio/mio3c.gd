extends MioCrouchAttackState

class_name Mio3CState

func _init():
	endFrame = 38
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -2293758, Enums.StKey.Hurt1PosY : -11665407,
			Enums.StKey.Hurt1ScaleX : 371401, Enums.StKey.Hurt1ScaleY : 601618,
			Enums.StKey.Hurt2PosX : -2097152, Enums.StKey.Hurt2PosY : -7208960,
			Enums.StKey.Hurt2ScaleX : 430035, Enums.StKey.Hurt2ScaleY : -705015,
			},
		12 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.Hit1PosX : 12320770, Enums.StKey.Hit1PosY : -29229054,
			Enums.StKey.Hit1ScaleX : 504556, Enums.StKey.Hit1ScaleY : 2022140,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 6291456, Enums.StKey.Hurt1PosY : -36175872,
			Enums.StKey.Hurt1ScaleX : 208117, Enums.StKey.Hurt1ScaleY : 551604,
			Enums.StKey.Hurt2PosX : 3473408, Enums.StKey.Hurt2PosY : -27787266,
			Enums.StKey.Hurt2ScaleX : 430035, Enums.StKey.Hurt2ScaleY : -705015,
			Enums.StKey.Hurt3PosX : 1572864, Enums.StKey.Hurt3PosY : -11141122,
			Enums.StKey.Hurt3ScaleX : 561893, Enums.StKey.Hurt3ScaleY : -1088870,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.hitstun: 25,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*7,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*50,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.attack_damage: 48,
			Enums.StKey.min_damage: 6,
			Enums.StKey.counter_hitstun: 200,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*5,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*50,
			},
		18 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 6291456, Enums.StKey.Hurt1PosY : -36175872,
			Enums.StKey.Hurt1ScaleX : 208117, Enums.StKey.Hurt1ScaleY : 551604,
			Enums.StKey.Hurt2PosX : 3473408, Enums.StKey.Hurt2PosY : -27787266,
			Enums.StKey.Hurt2ScaleX : 430035, Enums.StKey.Hurt2ScaleY : -705015,
			Enums.StKey.Hurt3PosX : 1572864, Enums.StKey.Hurt3PosY : -11141122,
			Enums.StKey.Hurt3ScaleX : 561893, Enums.StKey.Hurt3ScaleY : -1088870,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("3C")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
