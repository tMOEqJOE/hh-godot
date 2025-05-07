extends HurtGroundState

class_name AssistHurtGroundState

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true, Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
#			Enums.StKey.Hit1PosX : 0, Enums.StKey.Hit1PosY : -11337728,
#			Enums.StKey.Hit1ScaleX : 686985, Enums.StKey.Hit1ScaleY : 1074037,
			},
	}

func enter(state: Dictionary) -> void:
	state[Enums.StKey.drag_x] = Util.MOD_FRICTION
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.accel_x] = 0
	state[Enums.StKey.accel_y] = 0
	state[Enums.StKey.cancelState] = ""
	state[Enums.StKey.leftfaceOK] = false
	state[Enums.StKey.velocity_x] = SGFixed.mul(state[Enums.StKey.velocity_x], Util.ASSIST_PUSHBACK_MULT)
	state[Enums.StKey.hitstun] += 5
	anim.speed_scale = 1
	anim.stop(true)
	anim.play("StandHighHit")

func physics_tick(state: Dictionary) -> void:
	if (state[Enums.StKey.hitStopFrame] == 1):
		# last frame and transition out of hitstop
		pass
	elif (state[Enums.StKey.hitStopFrame] <= 0):
		# business as usual
		state[Enums.StKey.hitstun] -= 1

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.hitstun] <= 0):
		change_state.call("Dormant")

func has_property(state: Dictionary,property: int) -> bool:
	return false

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.StrikeHurt):
		
		change_state.call("HurtStand")
	elif (event_cause == Enums.Reaction.LaunchHurt):
		
		change_state.call("HurtLaunch")
	elif (event_cause == Enums.Reaction.TagCall):
		tag_cancel(state, interpreter)

func tag_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state["tag_attack"] == 12 or state["tag_attack"] == 13):
		change_state.call("AssistBurst")
