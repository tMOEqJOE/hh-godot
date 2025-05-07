extends AttackState

class_name HatoAttackState

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			#
			Enums.StKey.Hurt1Disable : true,
			Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt3Disable : true,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.drag_x] = Util.ICE_FRICTION
	state[Enums.StKey.leftfaceOK] = false

# Writing _delta instead of delta here prevents the unused variable warning.
func physics_tick(state: Dictionary) -> void:
	# NOTE: hitStopFrame == 0 is the "I was in hitstop, and can delay cancel"
	if (state[Enums.StKey.frame] == 2):
		SyncManager.play_sound("whiff", Global.WhiffSound, {"bus": "Sound"})
	
	if (state[Enums.StKey.hitStopFrame] == 1):
		# last frame and transition out of hitstop
		anim.speed_scale = 1
		if (not state[Enums.StKey.cancelState].is_empty()):
			change_state.call(state[Enums.StKey.cancelState])
	elif (state[Enums.StKey.hitStopFrame] <= 0):
		# business as usual
		pass
		anim.speed_scale = 1
	elif (state[Enums.StKey.hitStopFrame] > 0):
		# During hitstop
		anim.speed_scale = 0
		
func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == endFrame):
		change_state.call("Stand")
	if (state[Enums.StKey.hitStopFrame] == 0 and not state[Enums.StKey.cancelState].is_empty()):
		# is out of hitstop, and cancellable
		# delay cancel state
		anim.stop(true)
		change_state.call(state[Enums.StKey.cancelState])
	gatling_cancel(state, interpreter)

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.StrikeHit):
#		anim.speed_scale = 0
		pass
	elif (event_cause == Enums.Reaction.StrikeHurt):
		
		change_state.call("HurtStand")
	elif (event_cause == Enums.Reaction.BlockHurt):
		
		change_state.call("HurtStand")
	elif (event_cause == Enums.Reaction.JustBlockHurt):
		
		change_state.call("HurtStand")
	elif (event_cause == Enums.Reaction.ThrowHurt):
		change_state.call("HurtStand")
	elif (event_cause == Enums.Reaction.LaunchHurt):
		
		change_state.call("HurtStand")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (pilot_level_2_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.CUp, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "HatoCards"

func pilot_level_2_OK(state:Dictionary) -> bool:
	return state["pilot_meter"] >= Util.LEVEL_ONE_SUPER

func combo_pushback(comboTime: int) -> int:
	return Util.pushback_scaling(0, comboTime)*2

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.GroundThrowOK:
			return false
		_:
			return false
