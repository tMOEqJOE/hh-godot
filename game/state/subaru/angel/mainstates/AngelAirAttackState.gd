extends SubaruAirAttackState

class_name AngelAirAttackState

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			#
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -458752, Enums.StKey.Hurt1PosY : -22282238,
			Enums.StKey.Hurt1ScaleX : 339834, Enums.StKey.Hurt1ScaleY : 629832,
			Enums.StKey.Hurt2PosX : -655360, Enums.StKey.Hurt2PosY : -18219008,
			Enums.StKey.Hurt2ScaleX : 548413, Enums.StKey.Hurt2ScaleY : -906915,
			Enums.StKey.Hurt3PosX : 6094848, Enums.StKey.Hurt3PosY : -4784128,
			Enums.StKey.Hurt3ScaleX : 1171400, Enums.StKey.Hurt3ScaleY : -464723,
			},
	}

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	state[Enums.StKey.super_meter] -= Util.ANGEL_METER_DRAIN

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == endFrame):
		common_jump_transitions(state, interpreter)
	if (state[Enums.StKey.frame] == 0):
		if (state[Enums.StKey.kara_OK]):
			# Kara Cancel section
			if (boost_OK(state, interpreter)):
				change_state.call("AngelAirBoostCancel")
			elif (interpreter.is_button_down(Enums.InputFlags.ADown | Enums.InputFlags.DDown)):
				if ((interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface]) or
						interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or 
						interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]))):
					change_state.call("AngelAirBackThrowWhiff")
				else:
					change_state.call("AngelAirThrowWhiff")
			elif ((interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
					interpreter.is_holding_a_direction(Enums.Numpad.N5, state[Enums.StKey.leftface]) or 
					interpreter.is_holding_a_direction(Enums.Numpad.N8, state[Enums.StKey.leftface])) 
					and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
				change_state.call("AngelAirParryWhiff")
			elif (interpreter.is_blocking(state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
				change_state.call("AngelAirFDStance")
			elif (state[Enums.StKey.airDash] > 0 and interpreter.is_button_dashing(true, state[Enums.StKey.leftface])):
				change_state.call("AngelForwardAirDash")
			elif (state[Enums.StKey.airDash] > 0 and interpreter.is_button_dashing(false, state[Enums.StKey.leftface])):
				change_state.call("AngelBackwardAirDash")
			state[Enums.StKey.kara_OK] = false
		if (burst_OK(state, interpreter)):
			change_state.call("AngelBurst")
	
	if (state[Enums.StKey.hitStopFrame] == 0 and not state[Enums.StKey.cancelState].is_empty()):
		# is out of hitstop, and cancellable
		# delay cancel state
		anim.stop(true)
		change_state.call(state[Enums.StKey.cancelState])
	
	gatling_cancel(state, interpreter)
	special_cancel(state, interpreter)
	jump_cancel(state, interpreter)
	meter_cancel(state, interpreter)

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

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.doubleJump] > 0 and state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_tapping_direction(Enums.Numpad.N9, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "AngelForwardMidAirPreJump"
		elif (interpreter.is_tapping_direction(Enums.Numpad.N8, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "AngelMidAirPreJump"
		elif (interpreter.is_tapping_direction(Enums.Numpad.N7, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "AngelBackwardMidAirPreJump"

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (level_1_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "AngelAirEXStarBall"
		elif (interpreter.special_input_button(Enums.SpecialInput.M623, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "AngelDuckPunch"
		elif (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "AngelAirStinger"
		elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "AngelAirLightStarBall"
		elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "AngelSidewinder"


func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "AngelJump5C"
		elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "AngelJump5B"
		elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "AngelJump5A"

func meter_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (boost_OK(state, interpreter)):
			state[Enums.StKey.cancelState] = "AngelAirBoostCancel"
		elif (assist_ok(state, interpreter)):
			if (interpreter.is_low_blocking(state[Enums.StKey.leftface])):
				state[Enums.StKey.cancelState] = "AngelAirAssistCall2"
			elif (level_1_OK(state) and super_assist_meter_ok(state)  and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.DDown, state[Enums.StKey.leftface])):
				state[Enums.StKey.cancelState] = "AngelAirAssistCallSuper"
			else:
				state[Enums.StKey.cancelState] = "AngelAirAssistCall"
	else:
		if (boost_OK(state, interpreter)):
			change_state.call("AngelAirBoostCancel")

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
