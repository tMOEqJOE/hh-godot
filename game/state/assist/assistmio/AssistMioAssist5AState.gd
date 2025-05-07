extends AssistAttackState

class_name AssistMioAssist5AState

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
	anim.play("Assist5A")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] >= 5):
		state[Enums.StKey.velocity_x] = SGFixed.ONE*30

func exit_state():
	change_state.call("AssistAttack")

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.ForceTagOut):
		exit_state()
	else:
		super.reaction(state, interpreter, event_cause)

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (interpreter.is_button_down(Enums.InputFlags.CUp)):
		change_state.call("Assist5C")
	elif (interpreter.is_button_down(Enums.InputFlags.BUp)):
		change_state.call("Assist5B")

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.DrainAssistMeter:
			return true
		_:
			return super.has_property(state,property)
