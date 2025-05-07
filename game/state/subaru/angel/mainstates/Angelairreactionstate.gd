extends AirReactionState

class_name AngelAirReactionState

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true, Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 196607, Enums.StKey.Hurt1PosY : -9830400,
			Enums.StKey.Hurt1ScaleX : 995833, Enums.StKey.Hurt1ScaleY : 994631,
			},
	}

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	state[Enums.StKey.super_meter] -= Util.ANGEL_FAST_METER_DRAIN

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.StrikeHurt):
		change_state.call("AngelHurtAir")
	elif (event_cause == Enums.Reaction.BlockHurt):
		change_state.call("AngelAirBlock")
	elif (event_cause == Enums.Reaction.JustBlockHurt):
		change_state.call("AngelJustAirBlock")
	elif (event_cause == Enums.Reaction.ThrowHurt):
		change_state.call("AngelHurtAirThrow")
	elif (event_cause == Enums.Reaction.LaunchHurt):
		change_state.call("AngelHurtLaunch")
	elif (event_cause == Enums.Reaction.KOHurt):
		change_state.call("AngelKO")
	elif (state[Enums.StKey.hitStopFrame] <= 0):
		if (event_cause == Enums.Reaction.GroundLand):
			state[Enums.StKey.doubleJump] = 1
			state[Enums.StKey.airDash] = 1
			state[Enums.StKey.leftfaceOK] = true
			change_state.call("AngelStand")


func meter_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (burst_OK(state, interpreter)):
			state[Enums.StKey.cancelState] = "AngelBurst"

func air_tech(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (interpreter.is_button_down(Enums.InputFlags.AHold) or
			interpreter.is_button_down(Enums.InputFlags.BHold) or
			interpreter.is_button_down(Enums.InputFlags.CHold) or
			interpreter.is_button_down(Enums.InputFlags.DHold)):
		if (interpreter.is_low_blocking(state[Enums.StKey.leftface]) or 
				interpreter.is_holding_a_direction(Enums.Numpad.N8, state[Enums.StKey.leftface]) or 
				interpreter.is_holding_a_direction(Enums.Numpad.N5, state[Enums.StKey.leftface])):
			change_state.call("AngelAirTech")
		elif (interpreter.is_blocking(state[Enums.StKey.leftface])):
			change_state.call("AngelBackAirTech")
		elif (interpreter.is_blocking(not state[Enums.StKey.leftface])):
			change_state.call("AngelForwardAirTech")
		else:
			change_state.call("AngelAirTech")
			printerr("Air Teched How??")


func common_jump_transitions(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (not common_jump_transitions_default(state, interpreter)):
		change_state.call("AngelJumpFall")

func common_jump_transitions_default(state: Dictionary, interpreter: InputInterpreter) -> bool:
	var next_state = self.persistent_state.state_factory.angel_common_jump_transitions_default(state, interpreter)
	if (next_state != ""):
		change_state.call(next_state)
		return true
	else:
		return false
