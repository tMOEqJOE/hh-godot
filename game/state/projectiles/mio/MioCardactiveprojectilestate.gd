extends ActiveProjectileState

class_name MioCardActiveProjectileState

func _init():
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : true,
			},
		2 : {
			Enums.StKey.hit_box_colliding_frame : 1,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.chip_damage: 6,
			Enums.StKey.min_damage: 8,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.attack_damage: 25,
			Enums.StKey.hitstun: 18,
			Enums.StKey.hitstop: 5,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*5,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*40,
			Enums.StKey.counter_hitstun: 50,
			Enums.StKey.counter_launch_dir_x: +SGFixed.ONE*2,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*50,
			},
		5 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Destroy : true,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.projectile_hp] = 2
	state[Enums.StKey.velocity_x] = SGFixed.ONE*70
	state[Enums.StKey.velocity_y] = SGFixed.ONE*15
