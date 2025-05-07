extends AssistAirAttackState

class_name OkakoroAirPowerBounceRollingFallState

var voicefail = preload("res://game/assets/voice/okayu/oky_korewa muzukashiiyone.wav")

func _init():
	endFrame = 360
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	var old_accel = state[Enums.StKey.accel_y]
	super.enter(state)
	state[Enums.StKey.accel_y] = old_accel
	state[Enums.StKey.leftfaceOK] = false
#	state[Enums.StKey.drag_x] = Util.FRICTION
	anim.stop(true)
	anim.play("AssistSuperFall")

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.velocity_x] > -SGFixed.ONE*20 and 
			(interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]))):
		state[Enums.StKey.accel_x] = -85336
	elif (state[Enums.StKey.velocity_x] < SGFixed.ONE*20 and 
			(interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N9, state[Enums.StKey.leftface]))):
		state[Enums.StKey.accel_x] = 85336
	else:
		state[Enums.StKey.accel_x] = 0

	if (interpreter.is_button_down(Enums.InputFlags.CUp)):
		change_state.call("AssistAirSuperAttack")
	elif (interpreter.is_button_down(Enums.InputFlags.BUp)):
		change_state.call("AssistAirSuperAttack")
	elif (interpreter.is_button_down(Enums.InputFlags.AUp)):
		change_state.call("AssistAirSuperAttack")

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand):
		if (state[Enums.StKey.hitStopFrame] <= 0):
			SyncManager.play_sound("OkakoroPowerBounceAttack", voicefail, {"bus": "Voice"})
			change_state.call("LandAttackRecovery")
	else:
		super.reaction(state, interpreter, event_cause)
