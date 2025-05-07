extends "res://game/state/ollie/mainstates/ollieCrouchAttackState.gd"

class_name Ollie3CState

func _init():
	endFrame = 36
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt2PosX : -524288, Enums.StKey.Hurt2PosY : -7471104,
			Enums.StKey.Hurt2ScaleX : 446568, Enums.StKey.Hurt2ScaleY : -774072,
			Enums.StKey.Hurt3PosX : 655360, Enums.StKey.Hurt3PosY : -1835008,
			Enums.StKey.Hurt3ScaleX : 1161459, Enums.StKey.Hurt3ScaleY : -231611,
			},
		8 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hit1PosX : 19070976, Enums.StKey.Hit1PosY : -29360128,
			Enums.StKey.Hit1ScaleX : 879059, Enums.StKey.Hit1ScaleY : 1660524,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -524288, Enums.StKey.Hurt1PosY : -13893633,
			Enums.StKey.Hurt1ScaleX : 422039, Enums.StKey.Hurt1ScaleY : 1399748,
			Enums.StKey.Hurt2PosX : 1376256, Enums.StKey.Hurt2PosY : -28246018,
			Enums.StKey.Hurt2ScaleX : 837763, Enums.StKey.Hurt2ScaleY : -519068,
			Enums.StKey.Hurt3PosX : 12386304, Enums.StKey.Hurt3PosY : -40828928,
			Enums.StKey.Hurt3ScaleX : 427151, Enums.StKey.Hurt3ScaleY : -940364,
			Enums.StKey.hit_box_colliding_frame : 254,
#			Enums.StKey.hitstop : 3,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.hitstun: 28,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*7,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*55,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_hitstun: 110,
			Enums.StKey.attack_damage: 45,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*5,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*65,
			},
		13 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -524288, Enums.StKey.Hurt1PosY : -13893633,
			Enums.StKey.Hurt1ScaleX : 422039, Enums.StKey.Hurt1ScaleY : 1399748,
			Enums.StKey.Hurt2PosX : 1376256, Enums.StKey.Hurt2PosY : -28246018,
			Enums.StKey.Hurt2ScaleX : 837763, Enums.StKey.Hurt2ScaleY : -519068,
			Enums.StKey.Hurt3PosX : 12386304, Enums.StKey.Hurt3PosY : -40828928,
			Enums.StKey.Hurt3ScaleX : 427151, Enums.StKey.Hurt3ScaleY : -940364,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("3C")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
