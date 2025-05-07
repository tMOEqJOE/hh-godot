extends ActiveProjectileState

class_name AssistProtonCannonActiveState

func _init():
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : true,
			},
		2 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : false,
			Enums.StKey.attack_damage: 1, # trust me it'll still be good
			Enums.StKey.hit_box_colliding_frame : 3,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*50,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*10,
			Enums.StKey.meter_build: 0,
			Enums.StKey.hitstop: 3,
			Enums.StKey.min_damage: 1, # trust me it'll still be good
			Enums.StKey.chip_damage:0,
			Enums.StKey.hitstun : 50,
			Enums.StKey.burst_OK: false, # trust me it's worse if you burst it
			Enums.StKey.counter_hit: Enums.AttackType.WallBouncer,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*50,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*5,
			},
		100 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Destroy : true,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.accel_y] = 0
	state[Enums.StKey.projectile_hp] = 1000
	anim.play("Active")

func combo_pushback(comboTime: int) -> int:
	return 0
