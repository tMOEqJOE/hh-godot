extends HurtAirState

class_name AssistASuicoHurtAirState

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true, Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -18153472,
			Enums.StKey.Hurt1ScaleX : 1185327, Enums.StKey.Hurt1ScaleY : 1324647,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	state[Enums.StKey.hitstun] = Util.FORCE_UNDIZZY
	state[Enums.StKey.drag_x] = 0
	state[Enums.StKey.accel_x] = 0
	state[Enums.StKey.accel_y] = Util.JUGGLE_GRAVITY
	state[Enums.StKey.cancelState] = ""
	state[Enums.StKey.leftfaceOK] = false
	pushback_multiplier(state)
	anim.speed_scale = 1
	anim.stop(true)
	anim.play("ASuicoAirHit")

func pushback_multiplier(state: Dictionary):
	# launch_dir_x is usually a high magnitude for grounded pushback, so tone it down for air pushback
	state[Enums.StKey.velocity_x] = SGFixed.mul(state[Enums.StKey.velocity_x], Util.BASE_AIR_X_MULT)

func has_property(state: Dictionary,property: int) -> bool:
	return false

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.StrikeHurt):
		change_state.call("ASuicoHurtAir")
	elif (event_cause == Enums.Reaction.LaunchHurt):
		
		change_state.call("ASuicoHurtLaunch")
	elif (event_cause == Enums.Reaction.TagCall):
		tag_cancel(state, interpreter)
	elif (state[Enums.StKey.hitStopFrame] <= 0):
		if (event_cause == Enums.Reaction.GroundLand):
			if (state[Enums.StKey.ground_bounce] > 0):
				change_state.call("ASuicoGroundBounce")
			else:
				change_state.call("ASuicoKnockdown")
		elif (event_cause == Enums.Reaction.WallLand):
			if (state[Enums.StKey.wall_bounce] > 0):
				change_state.call("ASuicoWallBounce")

func physics_tick(state: Dictionary) -> void:
	if (state[Enums.StKey.hitStopFrame] == 1):
		pass
	elif (state[Enums.StKey.hitStopFrame] <= 0):
		# business as usual
		state[Enums.StKey.hitstun] -= 1

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	pass

func tag_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state["tag_attack"] == 12 or state["tag_attack"] == 13):
		change_state.call("ASuicoAssistBurst")
