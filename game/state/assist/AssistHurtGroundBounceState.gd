extends AssistHurtLaunchState

class_name AssistHurtGroundBounceState

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true, Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
#			Enums.StKey.Hurt1PosX : 196607, Enums.StKey.Hurt1PosY : -9830400,
#			Enums.StKey.Hurt1ScaleX : 995833, Enums.StKey.Hurt1ScaleY : 994631,
			Enums.StKey.Summon : "knockdowndust",
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.hitStopFrame] = -1
	SyncManager.play_sound("knockdown", Global.GroundBounceSound, {"bus": "Sound"})

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.hitStopFrame] < 0 and state[Enums.StKey.frame] == 1):
		state[Enums.StKey.hitStopFrame] = Util.GROUND_BOUNCE_HITSTOP
	elif (state[Enums.StKey.frame] == 2):
		state[Enums.StKey.velocity_y] = SGFixed.mul(state[Enums.StKey.velocity_y], Util.GROUND_BOUNCE_POWER_DECAY)

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.StrikeHurt):
		if (state[Enums.StKey.frame] > 2):
			change_state.call("HurtAir")
		else:
			change_state.call("HurtStand")
	elif (event_cause == Enums.Reaction.LaunchHurt):
		change_state.call("HurtLaunch")
	elif (event_cause == Enums.Reaction.TagCall):
		tag_cancel(state, interpreter)
	elif (state[Enums.StKey.hitStopFrame] <= 0):
		if (event_cause == Enums.Reaction.GroundLand and state[Enums.StKey.frame] > 2):
			if (state[Enums.StKey.ground_bounce] > 0):
				state[Enums.StKey.ground_bounce] -= 1
				change_state.call("GroundBounce")
			else:
				change_state.call("Knockdown")
		elif (event_cause == Enums.Reaction.WallLand):
			if (state[Enums.StKey.wall_bounce] > 0):
				state[Enums.StKey.wall_bounce] -= 1
				change_state.call("WallBounce")
	
