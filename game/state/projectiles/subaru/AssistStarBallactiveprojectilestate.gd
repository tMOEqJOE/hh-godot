extends ActiveProjectileState

class_name AssistSubaruStarBallActiveProjectileState

func _init():
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : true,
			},
		1 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.chip_damage: 4,
			Enums.StKey.min_damage: 4,
			Enums.StKey.attack_type : Enums.AttackType.Strike,
			Enums.StKey.counter_hit: Enums.AttackType.Strike,
			Enums.StKey.hit_box_colliding_frame : 1,
			Enums.StKey.meter_build: SGFixed.ONE*100,
			Enums.StKey.hitstop:4,
			Enums.StKey.attack_damage: 35,
#			Enums.StKey.hitstun: 25,
			},
		60 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Destroy : true,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.projectile_hp] = 2
	state[Enums.StKey.velocity_x] = SGFixed.ONE*38

func reaction(_state: Dictionary, _interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.StrikeHurt):
		change_state.call("Enhance")
