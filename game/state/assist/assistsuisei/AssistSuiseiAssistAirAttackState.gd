extends AssistAirAttackState

class_name AssistSuiseiAssistAirAttackState

func _init():
	endFrame = 30

	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,
			},
		6 : {
			Enums.StKey.Hit1Disable : false, Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hit1PosX : 7471104, Enums.StKey.Hit1PosY : -19136512,
			Enums.StKey.Hit1ScaleX : 758429, Enums.StKey.Hit1ScaleY : 871353,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,
			Enums.StKey.hit_box_colliding_frame : 3,
			Enums.StKey.attack_damage: 20,
			Enums.StKey.hitstun: 25,
			Enums.StKey.min_damage: 3,
			Enums.StKey.hitstop: 4,
			Enums.StKey.counter_hit: Enums.AttackType.Strike,
			Enums.StKey.counter_hitstun: 5,
			},
	}


# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.drag_x] = 0
	anim.stop(true)
	anim.play("AssistAttack")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 6):
		state[Enums.StKey.velocity_x] = Util.fixed_max(SGFixed.ONE*30, state[Enums.StKey.velocity_x])
	elif (state[Enums.StKey.frame] == 14):
		state[Enums.StKey.drag_x] = Util.FD_FRICTION
