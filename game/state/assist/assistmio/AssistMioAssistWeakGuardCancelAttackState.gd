extends "res://game/state/assist/assistmio/AssistMioAssistGuardCancelAttackState.gd"

class_name AssistMioAssistWeakGuardCancelAttackState

func _init():
	endFrame = 120
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -17337728,
			Enums.StKey.Hurt1ScaleX : 1086985, Enums.StKey.Hurt1ScaleY : 1774037,
			},
		9 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : true, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 12320770, Enums.StKey.Hit1PosY : -29229054,
			Enums.StKey.Hit1ScaleX : 504556, Enums.StKey.Hit1ScaleY : 2022140,
			Enums.StKey.min_damage:0,
			Enums.StKey.chip_damage:0,
			Enums.StKey.attack_damage: 0,
			Enums.StKey.hitstun: 10, 
			Enums.StKey.counter_hitstun: 10,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*10,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*65,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_launch_dir_x : -SGFixed.ONE*40,
			Enums.StKey.counter_launch_dir_y : -SGFixed.ONE*65,
			},
		15 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			},
	}
