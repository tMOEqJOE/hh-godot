extends AssistAirAttackState

class_name AssistMioAssistjAState

func _init():
	endFrame = 30
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -12337728,
			Enums.StKey.Hurt1ScaleX : 1286985, Enums.StKey.Hurt1ScaleY : 1374037,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.drag_x] = Util.FRICTION
	state[Enums.StKey.accel_y] = 0
	anim.stop(true)
	anim.play("AssistjA")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] >= 5):
		state[Enums.StKey.velocity_x] = SGFixed.ONE*25

func exit_state():
	change_state.call("AssistAirAttack")

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

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.DrainAssistMeter:
			return true
		_:
			return super.has_property(state,property)
