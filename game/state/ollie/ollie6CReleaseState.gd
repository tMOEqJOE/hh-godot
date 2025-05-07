extends "res://game/state/ollie/mainstates/ollieAttackState.gd"

class_name Ollie6CReleaseState

func _init():
	endFrame = 39
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 5111808, Enums.StKey.Hurt1PosY : -8257536,
			Enums.StKey.Hurt1ScaleX : 660841, Enums.StKey.Hurt1ScaleY : -873729,
			Enums.StKey.Hurt2PosX : -1900544, Enums.StKey.Hurt2PosY : -10944513,
			Enums.StKey.Hurt2ScaleX : 792031, Enums.StKey.Hurt2ScaleY : 1034044,
			},
		8 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit2PosX : 50200572, Enums.StKey.Hit2PosY : -14614529,
			Enums.StKey.Hit2ScaleX : 293329, Enums.StKey.Hit2ScaleY : 293329,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 5111808, Enums.StKey.Hurt1PosY : -8257536,
			Enums.StKey.Hurt1ScaleX : 660841, Enums.StKey.Hurt1ScaleY : -873729,
			Enums.StKey.Hurt2PosX : -1900544, Enums.StKey.Hurt2PosY : -10944513,
			Enums.StKey.Hurt2ScaleX : 792031, Enums.StKey.Hurt2ScaleY : 1034044,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.hitstun : 60,
			Enums.StKey.blockstun : 20,
			Enums.StKey.attack_damage: 60,
			Enums.StKey.attack_type : Enums.AttackType.Launcher, 
			Enums.StKey.launch_dir_x : -SGFixed.ONE*50,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*40,
			Enums.StKey.hitstop: 15,
			Enums.StKey.min_damage: 15,
			Enums.StKey.chip_damage: 9,
			Enums.StKey.counter_hit: Enums.AttackType.WallBouncer,
			Enums.StKey.counter_hitstun: 200,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*60,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*40,
			},
		10 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit2PosX : 29949952, Enums.StKey.Hit2PosY : -16252928,
			Enums.StKey.Hit2ScaleX : 2799346, Enums.StKey.Hit2ScaleY : 617190,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 5111808, Enums.StKey.Hurt1PosY : -8257536,
			Enums.StKey.Hurt1ScaleX : 660841, Enums.StKey.Hurt1ScaleY : -873729,
			Enums.StKey.Hurt2PosX : -1900544, Enums.StKey.Hurt2PosY : -10944513,
			Enums.StKey.Hurt2ScaleX : 792031, Enums.StKey.Hurt2ScaleY : 1034044,
			Enums.StKey.attack_damage: 40,
			Enums.StKey.min_damage:6,
			Enums.StKey.chip_damage:4,
			Enums.StKey.attack_type : Enums.AttackType.Launcher, 
			Enums.StKey.launch_dir_x : -SGFixed.ONE*35,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*40,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 200,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*40,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*20,
			},
		13 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 5111808, Enums.StKey.Hurt1PosY : -8257536,
			Enums.StKey.Hurt1ScaleX : 660841, Enums.StKey.Hurt1ScaleY : -873729,
			Enums.StKey.Hurt2PosX : -1900544, Enums.StKey.Hurt2PosY : -10944513,
			Enums.StKey.Hurt2ScaleX : 792031, Enums.StKey.Hurt2ScaleY : 1034044,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("6CFollowup")
	state[Enums.StKey.super_meter] += SGFixed.ONE*200

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
