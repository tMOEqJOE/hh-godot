extends AssistAirAttackState

class_name AssistOgaFastFallState

func _init():
	endFrame = 100
	
	anim_data = {
		0 : {
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
	#state[Enums.StKey.drag_x] = Util.FRICTION
	state[Enums.StKey.drag_x] = 0
	state[Enums.StKey.accel_y] = 0
	anim.stop(true)
	anim.play("BackAirDash")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 2):
		state[Enums.StKey.velocity_y] = SGFixed.ONE*40
		state[Enums.StKey.velocity_x] = -SGFixed.ONE*22

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand):
#		if (state[Enums.StKey.frame] > 8 and state[Enums.StKey.hitStopFrame] <= 0):
		change_state.call("LandAttackRecovery")
	else:
		super.reaction(state, interpreter, event_cause)
