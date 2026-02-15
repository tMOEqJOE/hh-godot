extends AssistAttackState

class_name AssistKanataAssistAttackState

func _init():
	endFrame = 42
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			},
		5 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 6160384, Enums.StKey.Hit1PosY : -8192000,
			Enums.StKey.Hit1ScaleX : 1526897, Enums.StKey.Hit1ScaleY : 793983,
			Enums.StKey.attack_type : Enums.AttackType.Throw,
			Enums.StKey.counter_hit: Enums.AttackType.Throw,
			Enums.StKey.burst_OK: false,
			Enums.StKey.launch_dir_x : 0,
			Enums.StKey.launch_dir_y : 0,
			Enums.StKey.counter_launch_dir_x: 0,
			Enums.StKey.counter_launch_dir_y: 0,
			Enums.StKey.hitstun : 30,
			Enums.StKey.hitstop: 1,
			},
		6 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.drag_x] = Util.FRICTION
	anim.stop(true)
	anim.play("AssistAttack")


func reaction(state: Dictionary, interpreter: InputInterpreter,event_cause: int) -> void:
	if (event_cause == Enums.Reaction.ThrowHit):
		change_state.call("AssistAttackFollowup")
	elif (event_cause == Enums.Reaction.GroundLand and state[Enums.StKey.frame] <= 9):
		pass
	else:
		super.reaction(state, interpreter, event_cause)
