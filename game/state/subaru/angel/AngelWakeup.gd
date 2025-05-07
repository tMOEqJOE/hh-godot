extends WakeupState

class_name AngelWakeupState

func _init():
	endFrame = 10
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,
			Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt3Disable : true,
			# Enums.StKey.Hit1PosX : 2025, Enums.StKey.Hit1PosY : -13828096,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.super_meter] -= Util.LEVEL_ONE_SUPER

func meter_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (burst_OK(state, interpreter)):
			state[Enums.StKey.cancelState] = "AngelBurst"

func wakeup_buffer(state: Dictionary, interpreter: InputInterpreter) -> void:
	state[Enums.StKey.cancelState] = self.persistent_state.state_factory.angel_common_idle_transitions(state, interpreter)
	#if (state[Enums.StKey.super_meter] > 0):
		#if (burst_OK(state, interpreter)):
			#state[Enums.StKey.cancelState] = "AngelBurst"
		#elif (boost_OK(state, interpreter)):
			#state[Enums.StKey.cancelState] = "AngelBoostCancel"
		#elif (interpreter.is_button_down(Enums.InputFlags.ADown | Enums.InputFlags.DDown)):
			#if ((interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface]) or
					#interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or 
					#interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]))):
				#state[Enums.StKey.cancelState] = "AngelGroundBackThrowWhiff"
			#else:
				#state[Enums.StKey.cancelState] = "AngelGroundThrowWhiff"
		#elif (interpreter.is_blocking(state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BHold | Enums.InputFlags.CHold)):
			#if (interpreter.is_low_blocking(state[Enums.StKey.leftface])):
				#state[Enums.StKey.cancelState] = "AngelCrouchFDStance"
			#else:
				#state[Enums.StKey.cancelState] = "AngelStandFDStance"
		#elif (interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
			#state[Enums.StKey.cancelState] = "AngelCrouchParryWhiff"
		#elif (interpreter.is_holding_a_direction(Enums.Numpad.N5, state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
			#state[Enums.StKey.cancelState] = "AngelStandParryWhiff"
		#elif (interpreter.special_input_button(Enums.SpecialInput.M632146, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
			#state[Enums.StKey.cancelState] = "AngelHH1"
		#elif (level_2_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M632146, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
			#state[Enums.StKey.cancelState] = "AngelBionicArm"
		#elif (level_1_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
			#state[Enums.StKey.cancelState] = "AngelEXStarBall"
		#elif (interpreter.special_input_button(Enums.SpecialInput.M623, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
			#state[Enums.StKey.cancelState] = "AngelDuckPunch"
		#elif (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
			#state[Enums.StKey.cancelState] = "AngelStinger"
		#elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
			#state[Enums.StKey.cancelState] = "LightStarBall"
		#elif (interpreter.is_dashing(true, state[Enums.StKey.leftface])):
			#state[Enums.StKey.cancelState] = "AngelRun"
		#elif (interpreter.is_dashing(false, state[Enums.StKey.leftface])):
			#state[Enums.StKey.cancelState] = "AngelBackDash"
		#elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				#interpreter.is_button_down(Enums.InputFlags.CDown)):
			#state[Enums.StKey.cancelState] = "AngelStand6C"
		#elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				#interpreter.is_button_down(Enums.InputFlags.ADown)):
			#state[Enums.StKey.cancelState] = "AngelStand6A"
		#elif (interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) and 
				#interpreter.is_button_down(Enums.InputFlags.CDown)):
			#state[Enums.StKey.cancelState] = "AngelCrouch3C"
		#elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				#interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				#interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				#interpreter.is_button_down(Enums.InputFlags.CDown)):
			#state[Enums.StKey.cancelState] = "AngelCrouch2C"
		#elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				#interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				#interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				#interpreter.is_button_down(Enums.InputFlags.BDown)):
			#state[Enums.StKey.cancelState] = "AngelCrouch2B"
		#elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				#interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				#interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				#interpreter.is_button_down(Enums.InputFlags.ADown)):
			#state[Enums.StKey.cancelState] = "AngelCrouch2A"
		#elif (interpreter.is_button_down(Enums.InputFlags.CDown)):
			#state[Enums.StKey.cancelState] = "AngelStand5C"
		#elif (state[Enums.StKey.distance_to_opponent] <= Util.PROXY_NORMAL and
				#interpreter.is_button_down(Enums.InputFlags.BDown)):
			#state[Enums.StKey.cancelState] = "AngelStandcB"
		#elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
			#state[Enums.StKey.cancelState] = "AngelStand5B"
		#elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
			#state[Enums.StKey.cancelState] = "AngelStand5A"
		#elif (assist_ok(state, interpreter)):
			#if (interpreter.is_low_blocking(state[Enums.StKey.leftface])):
				#state[Enums.StKey.cancelState] = "AngelGroundAssistCall2"
			#elif (level_1_OK(state) and super_assist_meter_ok(state)  and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.DDown, state[Enums.StKey.leftface])):
				#state[Enums.StKey.cancelState] = "AngelGroundAssistCallSuper"
			#else:
				#state[Enums.StKey.cancelState] = "AngelGroundAssistCall"
		#else:
			#pass

func common_idle_transitions(state: Dictionary, interpreter: InputInterpreter) -> void:
	change_state.call(self.persistent_state.state_factory.angel_common_idle_transitions(state, interpreter))
