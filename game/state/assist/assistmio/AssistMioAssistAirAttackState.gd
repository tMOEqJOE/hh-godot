extends AssistAirAttackState

class_name AssistMioAssistAirAttackState

func _init():
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hit1PosX : 0, Enums.StKey.Hit1PosY : -11337728,
			Enums.StKey.Hit1ScaleX : 686985, Enums.StKey.Hit1ScaleY : 1074037,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.drag_x] = Util.FRICTION
	state[Enums.StKey.accel_y] = 0
	anim.stop(true)
	anim.play("AssistAttack")

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.hitStopFrame] == 0 and not state[Enums.StKey.cancelState].is_empty()):
		# is out of hitstop, and cancellable
		# delay cancel state
		anim.stop(true)
		change_state.call(state[Enums.StKey.cancelState])
	
	gatling_cancel(state, interpreter)

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.ForceTagOut):
		exit_state()
	else:
		super.reaction(state, interpreter, event_cause)

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (interpreter.is_button_down(Enums.InputFlags.CUp)):
		change_state.call("AssistjC")
	elif (interpreter.is_button_down(Enums.InputFlags.BUp)):
		change_state.call("AssistjB")
	elif (interpreter.is_button_down(Enums.InputFlags.AUp)):
		change_state.call("AssistjA")

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.DrainAssistMeter:
			return true
		_:
			return super.has_property(state,property)
