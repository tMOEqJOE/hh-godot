extends AirAttackState

class_name AssistAirAttackState

func _init():
	endFrame = 45
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true, Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hit1PosX : 0, Enums.StKey.Hit1PosY : -11337728,
			Enums.StKey.Hit1ScaleX : 686985, Enums.StKey.Hit1ScaleY : 1074037,
			}
	}
# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	state[Enums.StKey.accel_x] = 0
	state[Enums.StKey.accel_y] = 0
	state[Enums.StKey.drag_x] = 0
	state[Enums.StKey.cancelState] = ""
	state[Enums.StKey.leftfaceOK] = true
	state[Enums.StKey.hitStopFrame] = -1 # whiff cancel not OK

# Writing _delta instead of delta here prevents the unused variable warning.
func physics_tick(state: Dictionary) -> void:
	if (state[Enums.StKey.frame] == 1):
		state[Enums.StKey.leftfaceOK] = false
	# NOTE: hitStopFrame == 0 is the "I was in hitstop, and can delay cancel"
	if (state[Enums.StKey.hitStopFrame] == 1):
		# last frame and transition out of hitstop
		anim.speed_scale = 1
		if (not state[Enums.StKey.cancelState].is_empty()):
			change_state.call(state[Enums.StKey.cancelState])
	elif (state[Enums.StKey.hitStopFrame] <= 0):
		# business as usual
		anim.speed_scale = 1
		pass
	elif (state[Enums.StKey.hitStopFrame] > 0):
		# During hitstop
		anim.speed_scale = 0

func has_property(state: Dictionary,property: int) -> bool:
	return false

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.StrikeHurt):
		change_state.call("HurtAir")
	elif (event_cause == Enums.Reaction.LaunchHurt):
		change_state.call("HurtLaunch")
	elif (event_cause == Enums.Reaction.GroundLand):
		if (state[Enums.StKey.hitStopFrame] <= 0):
			change_state.call("LandAttackRecovery")
	elif (event_cause == Enums.Reaction.TagCall):
		tag_cancel(state, interpreter)

func combo_pushback(comboTime: int) -> int:
	return Util.pushback_scaling(0, comboTime)

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == endFrame):
		exit_state()
	if (state[Enums.StKey.hitStopFrame] == 0 and not state[Enums.StKey.cancelState].is_empty()):
		# is out of hitstop, and cancellable
		# delay cancel state
		anim.stop(true)
		change_state.call(state[Enums.StKey.cancelState])
	
	gatling_cancel(state, interpreter)

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func exit_state():
	change_state.call("AssistAirExit")

func tag_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state["tag_attack"] == 0):
		change_state.call("AssistAirSuper")
	elif (state["tag_attack"] == 10):
		change_state.call("AssistAirGuardCancelAttack")
	elif (state["tag_attack"] == 11):
		change_state.call("AssistAirWeakGuardCancelAttack")
	elif (state["tag_attack"] == 12 or state["tag_attack"] == 13):
		change_state.call("AssistBurst")
	else:
		change_state.call("AssistAirAttack")
		if (state["tag_attack"] == 2 or state["tag_attack"] == 1 or state["tag_attack"] == 3):
			change_state.call("AssistAirAttack2")
