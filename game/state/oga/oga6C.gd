extends OgaAttackState

class_name Oga6CState

func _init():
	endFrame = 65
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt2PosX : -8126463, Enums.StKey.Hurt2PosY : -11927552,
			Enums.StKey.Hurt2ScaleX : 921393, Enums.StKey.Hurt2ScaleY : -1130861,
			},
		40 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 22216704, Enums.StKey.Hurt1PosY : -22282242,
			Enums.StKey.Hurt1ScaleX : 2402594, Enums.StKey.Hurt1ScaleY : 438028,
			Enums.StKey.Hurt2PosX : 12058625, Enums.StKey.Hurt2PosY : -16252929,
			Enums.StKey.Hurt2ScaleX : 883555, Enums.StKey.Hurt2ScaleY : -1246508,
			Enums.StKey.Hurt3PosX : 7471104, Enums.StKey.Hurt3PosY : -7274495,
			Enums.StKey.Hurt3ScaleX : 1058966, Enums.StKey.Hurt3ScaleY : 643717,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 24707072, Enums.StKey.Hit1PosY : -11993088,
			Enums.StKey.Hit1ScaleX : 2737817, Enums.StKey.Hit1ScaleY : -1429710,
			Enums.StKey.hitstun : 60,
			Enums.StKey.attack_damage: 90,
			Enums.StKey.attack_type : Enums.AttackType.WallBouncer,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*65,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*60,
			Enums.StKey.min_damage:20,
			Enums.StKey.chip_damage:20,
			Enums.StKey.hitstop: 15,
			Enums.StKey.counter_hit: Enums.AttackType.WallBouncer,
			Enums.StKey.counter_hitstun: 90,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*65,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*60,
			},
		47 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -2359296, Enums.StKey.Hurt1PosY : -24182784,
			Enums.StKey.Hurt1ScaleX : 1102513, Enums.StKey.Hurt1ScaleY : -384768,
			Enums.StKey.Hurt2PosX : 1769472, Enums.StKey.Hurt2PosY : -18743300,
			Enums.StKey.Hurt2ScaleX : 883555, Enums.StKey.Hurt2ScaleY : -1246508,
			Enums.StKey.Hurt3PosX : 6619136, Enums.StKey.Hurt3PosY : -7405568,
			Enums.StKey.Hurt3ScaleX : 1058966, Enums.StKey.Hurt3ScaleY : 643717,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("6C")
	state[Enums.StKey.super_meter] += SGFixed.ONE*300

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

