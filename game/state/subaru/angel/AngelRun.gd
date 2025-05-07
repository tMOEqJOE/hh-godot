extends AngelIdleState

class_name AngelRunState

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -262144, Enums.StKey.Hurt1PosY : -7471104,
			Enums.StKey.Hurt1ScaleX : 522078, Enums.StKey.Hurt1ScaleY : 1436954,
			},
		1 : {
			Enums.StKey.Summon : "rundust",
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
		},
	}
	
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_x] = Util.fixed_max(SGFixed.ONE*13, state[Enums.StKey.velocity_x])
	state[Enums.StKey.accel_x] = 115536
	state[Enums.StKey.leftfaceOK] = true
	anim.play("AngelRun")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (positive_bonus(state)):
		state[Enums.StKey.sync_rate] += SGFixed.mul(state[Enums.StKey.velocity_x], 436)
	elif (negative_penalty(state)):
		state[Enums.StKey.sync_rate] -= SGFixed.mul(state[Enums.StKey.velocity_x], 1036)

	if (state[Enums.StKey.frame] >= 8):
		state[Enums.StKey.frame] = 1
	if (state[Enums.StKey.velocity_x] > SGFixed.ONE*60):
		state[Enums.StKey.velocity_x] = SGFixed.ONE*60

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == 0):
		state[Enums.StKey.leftfaceOK] = false
		
		if (state[Enums.StKey.kara_OK]):
			# Kara Cancel section
			if (boost_OK(state, interpreter)):
				change_state.call("AngelBoostCancel")
			elif (interpreter.is_button_down(Enums.InputFlags.ADown | Enums.InputFlags.DDown)):
				if ((interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface]) or
						interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or 
						interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]))):
					change_state.call("AngelGroundBackThrowWhiff")
				else:
					change_state.call("AngelGroundThrowWhiff")
			elif (interpreter.is_blocking(state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BHold | Enums.InputFlags.CHold)):
				if (interpreter.is_low_blocking(state[Enums.StKey.leftface])):
					change_state.call("AngelCrouchFDStance")
				else:
					change_state.call("AngelStandFDStance")
			elif (interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
				change_state.call("AngelCrouchParryWhiff")
			elif (interpreter.is_holding_a_direction(Enums.Numpad.N5, state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
				change_state.call("AngelStandParryWhiff")
			elif (interpreter.is_dashing(false, state[Enums.StKey.leftface])):
				change_state.call("AngelBackDash")
		if (burst_OK(state, interpreter)):
			change_state.call("AngelBurst")
	elif (not (interpreter.is_button_down(Enums.InputFlags.ADown) or
			interpreter.is_button_down(Enums.InputFlags.BDown) or
			interpreter.is_button_down(Enums.InputFlags.CDown) or
			interpreter.is_button_down(Enums.InputFlags.DDown))):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface])):
			pass
		else:
			change_state.call("AngelSkid")
	else:
		if (state[Enums.StKey.frame] >= Util.INPUT_BUFFER_LENIANCY):
			common_idle_transitions(state, interpreter)
	if (state[Enums.StKey.super_meter] <= 0):
		change_state.call("AngelUninstall")

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.BlockingOK:
			return false
		_:
			return super.has_property(state,property)

#func common_idle_transitions(state: Dictionary, interpreter: InputInterpreter) -> void:
	#if (state[Enums.StKey.super_meter] <= 0):
		#change_state.call("AngelUninstall")
	#elif (burst_OK(state, interpreter)):
		#change_state.call("AngelBurst")
	#elif (boost_OK(state, interpreter)):
		#change_state.call("AngelBoostCancel")
	#elif (interpreter.is_button_down(Enums.InputFlags.ADown | Enums.InputFlags.DDown)):
		#if ((interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface]) or
				#interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or 
				#interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]))):
			#change_state.call("AngelGroundBackThrowWhiff")
		#else:
			#change_state.call("AngelGroundThrowWhiff")
	#elif (interpreter.is_blocking(state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BHold | Enums.InputFlags.CHold)):
		#if (interpreter.is_low_blocking(state[Enums.StKey.leftface])):
			#change_state.call("AngelCrouchFDStance")
		#else:
			#change_state.call("AngelStandFDStance")
	#elif (interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
		#change_state.call("AngelCrouchParryWhiff")
	#elif (interpreter.is_holding_a_direction(Enums.Numpad.N5, state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
		#change_state.call("AngelStandParryWhiff")
	#elif (interpreter.special_input_button(Enums.SpecialInput.M632146, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
		#change_state.call("AngelHH1")
	#elif (level_2_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M632146, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		#change_state.call("AngelBionicArm")
	#elif (level_1_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		#change_state.call("AngelEXStarBall")
	#elif (interpreter.special_input_button(Enums.SpecialInput.M623, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		#change_state.call("AngelDuckPunch")
	#elif (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		#change_state.call("AngelStinger")
	#elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		#change_state.call("AngelLightStarBall")
	#elif (interpreter.is_dashing(false, state[Enums.StKey.leftface])):
		#change_state.call("AngelBackDash")
	#elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
			#interpreter.is_button_down(Enums.InputFlags.CDown)):
		#change_state.call("AngelStand6C")
	#elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
			#interpreter.is_button_down(Enums.InputFlags.ADown)):
		#change_state.call("AngelStand6A")
	#elif (interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) and 
			#interpreter.is_button_down(Enums.InputFlags.CDown)):
		#change_state.call("AngelCrouch3C")
	#elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			#interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
			#interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
			#interpreter.is_button_down(Enums.InputFlags.CDown)):
		#change_state.call("AngelCrouch2C")
	#elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			#interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
			#interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
			#interpreter.is_button_down(Enums.InputFlags.BDown)):
		#change_state.call("AngelCrouch2B")
	#elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			#interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
			#interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
			#interpreter.is_button_down(Enums.InputFlags.ADown)):
		#change_state.call("AngelCrouch2A")
	#elif (interpreter.is_button_down(Enums.InputFlags.CDown)):
		#change_state.call("AngelStand5C")
	#elif (state[Enums.StKey.distance_to_opponent] <= Util.PROXY_NORMAL and
			#interpreter.is_button_down(Enums.InputFlags.BDown)):
		#change_state.call("AngelStandcB")
	#elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
		#change_state.call("AngelStand5B")
	#elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
		#change_state.call("AngelStand5A")
	#elif (assist_ok(state, interpreter)):
		#if (interpreter.is_low_blocking(state[Enums.StKey.leftface])):
			#change_state.call("AngelGroundAssistCall2")
		#elif (level_1_OK(state) and super_assist_meter_ok(state)  and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.DDown, state[Enums.StKey.leftface])):
			#change_state.call("AngelGroundAssistCallSuper")
		#else:
			#change_state.call("AngelGroundAssistCall")
	#elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface])):
		#change_state.call("AngelForwardWalk")
	#elif (interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface])):
		#change_state.call("AngelBackwardWalk")
	#elif (interpreter.super_jump()):
		#if (interpreter.is_holding_a_direction(Enums.Numpad.N9, state[Enums.StKey.leftface])):
			#change_state.call("AngelForwardPreSuperJump")
		#elif (interpreter.is_holding_a_direction(Enums.Numpad.N8, state[Enums.StKey.leftface])):
			#change_state.call("AngelPreSuperJump")
		#elif (interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface])):
			#change_state.call("AngelBackwardPreSuperJump")
	#elif (interpreter.is_holding_a_direction(Enums.Numpad.N9, state[Enums.StKey.leftface])):
		#change_state.call("AngelForwardPreJump")
	#elif (interpreter.is_holding_a_direction(Enums.Numpad.N8, state[Enums.StKey.leftface])):
		#change_state.call("AngelPreJump")
	#elif (interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface])):
		#change_state.call("AngelBackwardPreJump")
	#elif (interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			#interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
			#interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])):
		#change_state.call("AngelCrouch")
	#else:
		#change_state.call("AngelStand")
