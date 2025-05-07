extends ActiveProjectileState

class_name AssistSubaruStarBallEnhanceProjectileState

func _init():
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : true,
			},
		1 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.chip_damage: 6,
			Enums.StKey.min_damage: 6,
			Enums.StKey.attack_type : Enums.AttackType.WallBouncer,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.attack_damage: 45,
			Enums.StKey.hitstun : 45,
			Enums.StKey.hitstop : 10,
			Enums.StKey.hit_box_colliding_frame : 1,
			Enums.StKey.meter_build: SGFixed.ONE*100,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*10,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*30,
			Enums.StKey.counter_hitstun: 200,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*10,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*40,
			},
		60 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Destroy : true,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.projectile_hp] = 3
	state[Enums.StKey.accel_y] = 65536
	state[Enums.StKey.velocity_x] = SGFixed.ONE*38

func reaction(state: Dictionary, _interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.StrikeHurt):
		state[Enums.StKey.frame] = 2
		
