extends WakeupState

class_name OgaWakeupState

func _init():
	endFrame = 22
	
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
#
#func wakeup_buffer(state: Dictionary, interpreter: InputInterpreter) -> void:
	#if (burst_OK(state, interpreter)):
		#state[Enums.StKey.cancelState] = "Burst"
	#elif (boost_OK(state, interpreter)):
		#state[Enums.StKey.cancelState] = "BoostCancel"
	#elif (interpreter.is_button_down(Enums.InputFlags.ADown | Enums.InputFlags.DDown)):
		#if ((interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface]) or
				#interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or 
				#interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]))):
			#state[Enums.StKey.cancelState] = "GroundBackThrowWhiff"
		#else:
			#state[Enums.StKey.cancelState] = "GroundThrowWhiff"
	#elif (interpreter.is_blocking(state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BHold | Enums.InputFlags.CHold)):
		#if (interpreter.is_low_blocking(state[Enums.StKey.leftface])):
			#state[Enums.StKey.cancelState] = "CrouchFDStance"
		#else:
			#state[Enums.StKey.cancelState] = "StandFDStance"
	#elif (interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
		#state[Enums.StKey.cancelState] = "CrouchParryWhiff"
	#elif (interpreter.is_holding_a_direction(Enums.Numpad.N5, state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
		#state[Enums.StKey.cancelState] = "StandParryWhiff"
	#elif (level_2_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M632146, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		#state[Enums.StKey.cancelState] = "SlashMode"
	#elif (level_1_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M63214, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		#state[Enums.StKey.cancelState] = "Snapback"
	#elif (level_1_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M623, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		#state[Enums.StKey.cancelState] = "HeavyDP"
	#elif (interpreter.is_dashing(true, state[Enums.StKey.leftface])):
		#state[Enums.StKey.cancelState] = "Run"
	#elif (interpreter.is_dashing(false, state[Enums.StKey.leftface])):
		#state[Enums.StKey.cancelState] = "BackDash"
	#elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
		#state[Enums.StKey.cancelState] = "LightRiderKick"
	#elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		#state[Enums.StKey.cancelState] = "MediumRiderKick"
	#elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		#state[Enums.StKey.cancelState] = "HeavyRiderKick"
	#elif (interpreter.special_input_button(Enums.SpecialInput.M623, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
		#state[Enums.StKey.cancelState] = "LightDP"
	#elif (interpreter.special_input_button(Enums.SpecialInput.M623, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		#state[Enums.StKey.cancelState] = "MediumDP"
	#elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
			#interpreter.is_button_down(Enums.InputFlags.CDown)):
		#state[Enums.StKey.cancelState] = "Stand6C"
	#elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
			#interpreter.is_button_down(Enums.InputFlags.ADown)):
		#state[Enums.StKey.cancelState] = "Stand6A"
	#elif (interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) and 
			#interpreter.is_button_down(Enums.InputFlags.CDown)):
		#state[Enums.StKey.cancelState] = "Crouch3C"
	#elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			#interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
			#interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
			#interpreter.is_button_down(Enums.InputFlags.CDown)):
		#state[Enums.StKey.cancelState] = "Crouch2C"
	#elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			#interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
			#interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
			#interpreter.is_button_down(Enums.InputFlags.BDown)):
		#state[Enums.StKey.cancelState] = "Crouch2B"
	#elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			#interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
			#interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
			#interpreter.is_button_down(Enums.InputFlags.ADown)):
		#state[Enums.StKey.cancelState] = "Crouch2A"
	#elif (interpreter.is_button_down(Enums.InputFlags.CDown)):
		#state[Enums.StKey.cancelState] = "Stand5C"
	#elif (state[Enums.StKey.distance_to_opponent] <= Util.PROXY_NORMAL and
			#interpreter.is_button_down(Enums.InputFlags.BDown)):
		#state[Enums.StKey.cancelState] = "StandcB"
	#elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
		#state[Enums.StKey.cancelState] = "Stand5B"
	#elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
		#state[Enums.StKey.cancelState] = "Stand5A"
	#elif (assist_ok(state, interpreter)):
		#if (interpreter.is_low_blocking(state[Enums.StKey.leftface])):
			#state[Enums.StKey.cancelState] = "GroundAssistCall2"
		#elif (level_1_OK(state) and super_assist_meter_ok(state)  and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.DDown, state[Enums.StKey.leftface])):
			#state[Enums.StKey.cancelState] = "GroundAssistCallSuper"
		#else:
			#state[Enums.StKey.cancelState] = "GroundAssistCall"
	#else:
		#pass
