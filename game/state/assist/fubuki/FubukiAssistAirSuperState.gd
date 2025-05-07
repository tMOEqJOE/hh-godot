extends AssistAirAttackState

class_name FubukiAirSuperState

func _init():
	endFrame = 50
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hit1PosX : 0, Enums.StKey.Hit1PosY : -11337728,
			Enums.StKey.Hit1ScaleX : 686985, Enums.StKey.Hit1ScaleY : 1074037,
			Enums.StKey.Summon : "meterDump",
			},
		5 : {
			Enums.StKey.Summon : "superFlash",
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit1PosX : 0, Enums.StKey.Hit1PosY : 0,
			Enums.StKey.Hit1ScaleX : 18338272, Enums.StKey.Hit1ScaleY : 18338272,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.hitstop: 0,
			Enums.StKey.meter_build: 0,
			Enums.StKey.attack_type : Enums.AttackType.BurstLock,
			Enums.StKey.counter_hit : Enums.AttackType.BurstLock,
			},
		6 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : true, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 27656194, Enums.StKey.Hit1PosY : -8650752,
			Enums.StKey.Hit1ScaleX : 3994068, Enums.StKey.Hit1ScaleY : -820144,
			Enums.StKey.min_damage:10,
			Enums.StKey.chip_damage:10,
			Enums.StKey.attack_damage: 50,
			Enums.StKey.burst_OK: false,
			Enums.StKey.hitstun: 25, 
			Enums.StKey.hitstop: 10,
			Enums.StKey.meter_build: 0,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 60,
			Enums.StKey.counter_launch_dir_x: 0,
			Enums.StKey.counter_launch_dir_y: SGFixed.ONE*40,
			},
		8 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : true, Enums.StKey.Hurt2Disable : true,
			},
		12 : { 
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : true, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 27656194, Enums.StKey.Hit1PosY : -8650752,
			Enums.StKey.Hit1ScaleX : 3994068, Enums.StKey.Hit1ScaleY : -820144,
			Enums.StKey.min_damage:10,
			Enums.StKey.chip_damage:10,
			Enums.StKey.attack_damage: 50,
			Enums.StKey.hitstun: 25,
			Enums.StKey.hitstop: 10,
			Enums.StKey.burst_OK: false,
			Enums.StKey.meter_build: 0,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 60,
			Enums.StKey.counter_launch_dir_x: 0,
			Enums.StKey.counter_launch_dir_y: SGFixed.ONE*40,
			},
		14 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : true, Enums.StKey.Hurt2Disable : true,
			},
		18 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : true, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 15663104, Enums.StKey.Hit1PosY : -12124159,
			Enums.StKey.Hit1ScaleX : 2361402, Enums.StKey.Hit1ScaleY : -1246952,
			Enums.StKey.min_damage:15,
			Enums.StKey.chip_damage:10,
			Enums.StKey.attack_damage: 70,
			Enums.StKey.hitstun: 80,
			Enums.StKey.hitstop: 10,
			Enums.StKey.burst_OK: false,
			Enums.StKey.meter_build: 0,
			Enums.StKey.attack_type : Enums.AttackType.WallBouncer,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*50,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*50,
			Enums.StKey.counter_hit: Enums.AttackType.WallBouncer,
			Enums.StKey.counter_hitstun: 60,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*60,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*50,
			},
		40 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.drag_x] = Util.FRICTION
	state[Enums.StKey.accel_y] = 0
	anim.stop(true)
	anim.play("AssistSuper")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] >= 16 and state[Enums.StKey.frame] < 35):
		state[Enums.StKey.velocity_x] = SGFixed.ONE*70
