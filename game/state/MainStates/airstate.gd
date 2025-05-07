extends State

class_name AirState

func enter(state: Dictionary) -> void:
	state[Enums.StKey.accel_x] = 0
	state[Enums.StKey.accel_y] = Util.GRAVITY
	state[Enums.StKey.drag_x] = 0
	state[Enums.StKey.cancelState] = ""
	state[Enums.StKey.hitCount] = 0
	state[Enums.StKey.comboTime] = 0
	state[Enums.StKey.burst_OK] = true
	state[Enums.StKey.ground_bounce] = 0
	state[Enums.StKey.wall_bounce] = 0
	state[Enums.StKey.counterOK] = false
	state[Enums.StKey.hitStopFrame] = -1
	state[Enums.StKey.leftfaceOK] = false
	anim.speed_scale = 1
	anim.stop(true)
	anim.play("JumpFall")
	

# Writing _delta instead of delta here prevents the unused variable warning.
func physics_tick(_state: Dictionary) -> void:
	pass
	
func handle_input(_state: Dictionary, _interpreter: InputInterpreter) -> void:
	pass

func reaction(state: Dictionary, _interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.StrikeHurt):
		change_state.call("HurtAir")
	elif (event_cause == Enums.Reaction.BlockHurt):
		change_state.call("AirBlock")
	elif (event_cause == Enums.Reaction.JustBlockHurt):
		change_state.call("JustAirBlock")
	elif (event_cause == Enums.Reaction.ThrowHurt):
		change_state.call("HurtAirThrow")
	elif (event_cause == Enums.Reaction.LaunchHurt):
		change_state.call("HurtLaunch")
	elif (event_cause == Enums.Reaction.KOHurt):
		change_state.call("KO")
	elif (state[Enums.StKey.hitStopFrame] <= 0):
		if (event_cause == Enums.Reaction.GroundLand):
			state[Enums.StKey.doubleJump] = 1
			state[Enums.StKey.airDash] = 1
			state[Enums.StKey.leftfaceOK] = true
			change_state.call("Stand")


func has_property(_state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.AirThrowOK:
			return true
		Enums.StateProperty.GroundThrowOK:
			return false
		Enums.StateProperty.BlockingOK:
			return true
		Enums.StateProperty.HighProtect:
			return true
		Enums.StateProperty.LowProtect:
			return true
		Enums.StateProperty.ExtraChip:
			return true
		_:
			return false

func common_jump_transitions(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (not common_jump_transitions_default(state, interpreter)):
		change_state.call("JumpFall")

func common_jump_transitions_default(state: Dictionary, interpreter: InputInterpreter) -> bool:
	var next_state = self.persistent_state.state_factory.common_jump_transitions_default(state, interpreter)
	if (next_state != ""):
		change_state.call(next_state)
		return true
	else:
		return false
