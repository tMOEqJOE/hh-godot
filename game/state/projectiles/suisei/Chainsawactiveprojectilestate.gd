extends ActiveProjectileState

class_name SuicopathChainsawActiveProjectileState

func _init():
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : true,
			},
		2 : {
			Enums.StKey.hit_box_colliding_frame : 2,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.chip_damage: 3,
			Enums.StKey.min_damage: 3,
			Enums.StKey.attack_type : Enums.AttackType.Strike,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.attack_damage: 25,
			Enums.StKey.meter_build: 0,
			Enums.StKey.burst_OK: false,
			Enums.StKey.hitstun: 20,
			Enums.StKey.hitstop: 5,
#			Enums.StKey.launch_dir_x : ,
#			Enums.StKey.launch_dir_y : -SGFixed.ONE*40,
			Enums.StKey.counter_hitstun: 50,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*10,
			Enums.StKey.counter_launch_dir_y: SGFixed.ONE*50,
			},
		200 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Destroy : true,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.projectile_hp] = 20
	state[Enums.StKey.velocity_x] = -SGFixed.ONE*5
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.accel_x] = 10536
