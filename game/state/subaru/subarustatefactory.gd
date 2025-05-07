extends PointStateFactory

class_name SubaruStateFactory

func _init():
	super._init()
	
	var new_states : Dictionary = {
		"Intro": preload("res://game/state/subaru/subaruIntroState.gd"),
		
		"Stand": SubaruStandState,
		"Crouch": SubaruCrouchState,
		"ForwardWalk": SubaruForwardWalk,
		"BackwardWalk": SubaruBackWalk,
		"Run": SubaruRunState,
		"Skid": SubaruSkidState,
		
		"StandBlock": preload("res://game/state/subaru/subaruStandBlockState.gd"),
		"CrouchBlock": preload("res://game/state/subaru/subaruCrouchBlockState.gd"),
		"AirBlock": preload("res://game/state/subaru/subaruAirBlockState.gd"),
		"JustStandBlock": preload("res://game/state/subaru/subaruStandJustBlockState.gd"),
		"JustCrouchBlock": preload("res://game/state/subaru/subaruCrouchJustBlockState.gd"),
		"JustAirBlock": preload("res://game/state/subaru/subaruAirJustBlockState.gd"),
		"StandParryCatch": preload("res://game/state/subaru/subaruStandParryCatchState.gd"),
		"CrouchParryCatch": preload("res://game/state/subaru/subaruCrouchParryCatchState.gd"),
		"AirParryCatch": preload("res://game/state/subaru/subaruAirParryCatchState.gd"),
		
		"Jump": SubaruJumpState,
		"ForwardJump": SubaruForwardJumpState,
		"BackwardJump": SubaruBackwardJumpState,
		"MidAirJump": SubaruMidAirJumpState,
		"ForwardMidAirJump": SubaruForwardMidAirJumpState,
		"BackwardMidAirJump": SubaruBackwardMidAirJumpState,
		"SuperJump": SubaruSuperJumpState,
		"ForwardSuperJump": SubaruForwardSuperJumpState,
		"BackwardSuperJump": SubaruBackwardSuperJumpState,
		
		"JumpFall": SubaruJumpFallState,
		
		"AirTech": preload("res://game/state/subaru/subaruAirTechState.gd"),
		"ForwardAirTech": preload("res://game/state/subaru/subaruForwardAirTechState.gd"),
		"BackAirTech": preload("res://game/state/subaru/subaruBackwardAirTechState.gd"),
		
		"ForwardAirDash": SubaruForwardAirDashState,
		"BackwardAirDash": SubaruBackwardAirDashState,
		
		"Stand5A": Subaru5AState,
		"Stand5B": Subaru5BState,
		"Stand5C": Subaru5CState,
		"Crouch2A": Subaru2AState,
		"Crouch2B": Subaru2BState,
		"Crouch2C": Subaru2CState,
		"StandcB": SubaruCBState,
		"Stand6A": Subaru6AState,
		"Stand6C": Subaru6CState,
		"Crouch3C": Subaru3CState,
		"Jump5A": SubarujAState,
		"Jump5B": SubarujBState,
		"Jump5C": SubarujCState,
		"Jump2C": Subaruj2CState,
		"Jump6C": preload("res://game/state/subaru/subaruJ6CState.gd"),
		
		"GroundAssistCall2": SubaruGroundAssistCall2State,
		"GroundAssistCallSuper": SubaruGroundAssistCallSuperState,
		"GroundAssistCall": SubaruGroundAssistCallState,
		"AirAssistCall": SubaruAirAssistCallState,
		"AirAssistCall2": SubaruAirAssistCall2State,
		"AirAssistCallSuper": SubaruAirAssistCallSuperState,

		"Stinger": SubaruStingerState,
		"DuckPunch": SubaruDPState,
		"LightDuckPunch": preload("res://game/state/subaru/subaruLightDPState.gd"),
		"LightStarBall": SubaruStarBallState,
		"BatterSet": preload("res://game/state/subaru/subaruBatterSetState.gd"),
		"BatterSwing": preload("res://game/state/subaru/subaruBatterSwingState.gd"),
		"AirStinger": SubaruAirStingerState,
		"AirLightStarBall": SubaruAirStarBallState,
		"AirBatterSet": preload("res://game/state/subaru/subaruAirBatterSetState.gd"),
		"AirBatterSwing": preload("res://game/state/subaru/subaruAirBatterSwingState.gd"),
		
		"EXStarBall": SubaruEXStarBallState,
		"AirEXStarBall": SubaruAirEXStarBallState,
		"BionicArm" : SubaruBionicArmState,
		"AngelInstall" : SubaruAngelInstallState,
		
		"LandingRecovery": preload("res://game/state/subaru/subaruLandingRecovery.gd"),
		
		"Wakeup": SubaruWakeupState,
		"HurtLaunch": SubaruHurtLaunchState,
		"GroundBounce": preload("res://game/state/subaru/subaruGroundBounceState.gd"), 
		"KO":  preload("res://game/state/subaru/subaruKO.gd"),
		
		"AngelStand": AngelStandState,
		"AngelCrouch": AngelCrouchState,
		"AngelForwardWalk": AngelForwardWalk,
		"AngelBackwardWalk": AngelBackWalk,
		"AngelRun": AngelRunState,
		"AngelSkid": AngelSkidState,
		
		"AngelJump": AngelJumpState,
		"AngelForwardJump": AngelForwardJumpState,
		"AngelBackwardJump": AngelBackwardJumpState,
		"AngelMidAirJump": AngelMidAirJumpState,
		"AngelForwardMidAirJump": AngelForwardMidAirJumpState,
		"AngelBackwardMidAirJump": AngelBackwardMidAirJumpState,
		"AngelSuperJump": AngelSuperJumpState,
		"AngelForwardSuperJump": AngelForwardSuperJumpState,
		"AngelBackwardSuperJump": AngelBackwardSuperJumpState,
		
		"AngelJumpFall": AngelJumpFallState,
		
		"AngelForwardAirDash": AngelForwardAirDashState,
		"AngelBackwardAirDash": AngelBackwardAirDashState,
		
		"AngelStand5A": Angel5AState,
		"AngelStand5B": Angel5BState,
		"AngelStand5C": Angel5CState,
		"AngelCrouch2A": Angel2AState,
		"AngelCrouch2B": Angel2BState,
		"AngelCrouch2C": Angel2CState,
		"AngelStandcB": AngelCBState,
		"AngelStand6A": Angel6AState,
		"AngelStand6C": Angel6CState,
		"AngelCrouch3C": Angel3CState,
		"AngelJump5A": AngeljAState,
		"AngelJump5B": AngeljBState,
		"AngelJump5C": AngeljCState,
		"AngelJump2C": Angelj2CState,
		
		"AngelGroundAssistCall2": AngelGroundAssistCall2State,
		"AngelGroundAssistCallSuper": AngelGroundAssistCallSuperState,
		"AngelGroundAssistCall": AngelGroundAssistCallState,
		"AngelAirAssistCall": AngelAirAssistCallState,
		"AngelAirAssistCall2": AngelAirAssistCall2State,
		"AngelAirAssistCallSuper": AngelAirAssistCallSuperState,

		"AngelStinger": AngelStingerState,
		"AngelDuckPunch": AngelDPState,
		"AngelLightStarBall": AngelStarBallState,
		"AngelAirStinger": AngelAirStingerState,
		"AngelAirLightStarBall": AngelAirStarBallState,
		"AngelSidewinder": AngelSidewinderState,
		
		"AngelEXStarBall": AngelEXStarBallState,
		"AngelAirEXStarBall": AngelAirEXStarBallState,
		"AngelBionicArm" : AngelBionicArmState,
		
		"AngelHH1" : AngelHH1State,
		"AngelHH2" : AngelHH2State,
		"AngelHH3" : AngelHH3State,
		"AngelHH4" : AngelHH4State,
		"AngelHH5" : AngelHH5State,
		"AngelHH6" : AngelHH6State,
		"AngelHH7" : AngelHH7State,
		"AngelHH8" : AngelHH8State,
		"AngelHH9" : AngelHH9State,
		"AngelHH10" : AngelHH10State,
		
		"AngelWakeup": AngelWakeupState,
		"AngelHurtLaunch": AngelHurtLaunchState,
		
		"AngelPreJump": AngelPreJumpState,
		"AngelForwardPreJump": AngelForwardPreJumpState,
		"AngelBackwardPreJump": AngelBackwardPreJumpState,
		"AngelPreSuperJump": AngelPreSuperJumpState,
		"AngelForwardPreSuperJump": AngelForwardPreSuperJumpState,
		"AngelBackwardPreSuperJump": AngelBackwardPreSuperJumpState,
		"AngelMidAirPreJump": AngelMidAirPreJumpState,
		"AngelForwardMidAirPreJump": AngelForwardMidAirPreJumpState,
		"AngelBackwardMidAirPreJump": AngelBackwardMidAirPreJumpState,
		
		"AngelBackDash": AngelBackDashState,
		
		"AngelGroundThrowWhiff": AngelGroundThrowWhiffState,
		"AngelAirThrowWhiff": AngelAirThrowWhiffState,
		"AngelGroundThrowHit": AngelGroundThrowHitState,
		"AngelAirThrowHit": AngelAirThrowHitState,
		"AngelGroundBackThrowWhiff": AngelGroundBackThrowWhiffState,
		"AngelAirBackThrowWhiff": AngelAirBackThrowWhiffState,
		"AngelGroundBackThrowHit": AngelGroundBackThrowHitState,
		"AngelAirBackThrowHit": AngelAirBackThrowHitState,
		
		"AngelKnockdown": AngelKnockdownState,
		"AngelHurtOTG": AngelHurtOTGState,
		"AngelHurtCrouch": AngelHurtCrouchState,
		"AngelStandBlock": AngelStandBlockState,
		"AngelCrouchBlock": AngelCrouchBlockState,
		"AngelAirBlock": AngelAirBlockState,
		"AngelJustStandBlock": AngelStandJustBlockState,
		"AngelJustCrouchBlock": AngelCrouchJustBlockState,
		"AngelJustAirBlock": AngelAirJustBlockState,
		"AngelStandFDStance": AngelStandFDStanceState,
		"AngelCrouchFDStance": AngelCrouchFDStanceState,
		"AngelAirFDStance": AngelAirFDStanceState,
		"AngelStandParryWhiff": AngelStandParryWhiffState,
		"AngelCrouchParryWhiff": AngelCrouchParryWhiffState,
		"AngelAirParryWhiff": AngelAirParryWhiffState,
		"AngelRedStandParryWhiff": AngelRedStandParryWhiffState,

		"AngelRedCrouchParryWhiff": AngelRedCrouchParryWhiffState,
		"AngelRedAirParryWhiff": AngelRedAirParryWhiffState,
		"AngelStandParryCatch": AngelStandParryCatchState,
		"AngelCrouchParryCatch": AngelCrouchParryCatchState,
		"AngelAirParryCatch": AngelAirParryCatchState,
		
		"AngelAirTech": AngelAirTechState,
		"AngelForwardAirTech": AngelForwardAirTechState,
		"AngelBackAirTech": AngelBackwardAirTechState,
		
		"AngelBurst": AngelBurstState,
		"AngelAssistGuardCancel": AngelAssistGuardCancelState,
		"AngelAirAssistGuardCancel": AngelAirAssistGuardCancelState,
		"AngelAssistWeakGuardCancel": AngelAssistWeakGuardCancelState,
		"AngelAirAssistWeakGuardCancel": AngelAirAssistWeakGuardCancelState,
		"AngelBoostCancel": AngelBoostCancelState,
		"AngelAirBoostCancel": AngelAirBoostCancelState,
		
		"AngelHurtStand": AngelHurtGroundState,
		"AngelHurtAir": AngelHurtAirState,
		"AngelHurtThrow": AngelThrowHurtState,
		"AngelHurtAirThrow": AngelAirThrowHurtState,
		"AngelGroundBounce": AngelHurtGroundBounceState,
		"AngelWallBounce": AngelHurtWallBounceState,
		"AngelKO": AngelKOState,
		
		"AngelUninstall": AngelUninstallState,
	}
	
	merge_state_dictionary(new_states)

func angel_common_idle_transitions(state: Dictionary, interpreter: InputInterpreter) -> String:
	if (Global.burst_OK(state, interpreter)):
		return "AngelBurst"
	elif (Global.boost_OK(state, interpreter)):
		return "AngelBoostCancel"
	elif (interpreter.is_button_down(Enums.InputFlags.ADown | Enums.InputFlags.DDown)):
		if ((interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or 
				interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]))):
			return "AngelGroundBackThrowWhiff"
		else:
			return "AngelGroundThrowWhiff"
	elif (interpreter.is_blocking(state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BHold | Enums.InputFlags.CHold)):
		if (interpreter.is_low_blocking(state[Enums.StKey.leftface])):
			return "AngelCrouchFDStance"
		else:
			return "AngelStandFDStance"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
		return "AngelCrouchParryWhiff"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N5, state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
		return "AngelStandParryWhiff"
	elif (interpreter.special_input_button(Enums.SpecialInput.M632146, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
		return "AngelHH1"
	elif (Global.level_2_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M632146, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		return "AngelBionicArm"
	elif (Global.level_1_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		return "AngelEXStarBall"
	elif (interpreter.special_input_button(Enums.SpecialInput.M623, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "AngelDuckPunch"
	elif (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "AngelStinger"
	elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "AngelLightStarBall"
	elif (interpreter.is_stick_dashing(true, state[Enums.StKey.leftface]) and state[Enums.StKey.stateName] != "AngelRun"):
		return "AngelRun"
	elif (interpreter.is_button_dashing(true, state[Enums.StKey.leftface])):
		return "AngelRun"
	elif (interpreter.is_dashing(false, state[Enums.StKey.leftface])):
		return "AngelBackDash"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
			interpreter.is_button_down(Enums.InputFlags.CDown)):
		return "AngelStand6C"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
			interpreter.is_button_down(Enums.InputFlags.ADown)):
		return "AngelStand6A"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) and 
			interpreter.is_button_down(Enums.InputFlags.CDown)):
		return "AngelCrouch3C"
	elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
			interpreter.is_button_down(Enums.InputFlags.CDown)):
		return "AngelCrouch2C"
	elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
			interpreter.is_button_down(Enums.InputFlags.BDown)):
		return "AngelCrouch2B"
	elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
			interpreter.is_button_down(Enums.InputFlags.ADown)):
		return "AngelCrouch2A"
	elif (interpreter.is_button_down(Enums.InputFlags.CDown)):
		return "AngelStand5C"
	elif (state[Enums.StKey.distance_to_opponent] <= Util.PROXY_NORMAL and
			interpreter.is_button_down(Enums.InputFlags.BDown)):
		return "AngelStandcB"
	elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
		return "AngelStand5B"
	elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
		return "AngelStand5A"
	elif (Global.assist_ok(state, interpreter)):
		if (interpreter.is_low_blocking(state[Enums.StKey.leftface])):
			return "AngelGroundAssistCall2"
		elif (Global.level_1_OK(state) and Global.super_assist_meter_ok(state) and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.DDown, state[Enums.StKey.leftface])):
			return "AngelGroundAssistCallSuper"
		else:
			return "AngelGroundAssistCall"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface])):
		return "AngelForwardWalk"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface])):
		return "AngelBackwardWalk"
	elif (interpreter.super_jump()):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N9, state[Enums.StKey.leftface])):
			return "AngelForwardPreSuperJump"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N8, state[Enums.StKey.leftface])):
			return "AngelPreSuperJump"
		else:
			return "AngelBackwardPreSuperJump"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N9, state[Enums.StKey.leftface])):
		return "AngelForwardPreJump"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N8, state[Enums.StKey.leftface])):
		return "AngelPreJump"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface])):
		return "AngelBackwardPreJump"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])):
		return "AngelCrouch"
	else:
		return "AngelStand"


func angel_common_jump_transitions_default(state: Dictionary, interpreter: InputInterpreter) -> String:
	if (Global.burst_OK(state, interpreter)):
		return "AngelBurst"
	elif (Global.boost_OK(state, interpreter)):
		return "AngelAirBoostCancel"
	elif (interpreter.is_button_down(Enums.InputFlags.ADown | Enums.InputFlags.DDown)):
		if ((interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or 
				interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]))):
			return "AngelAirBackThrowWhiff"
		else:
			return "AngelAirThrowWhiff"
	elif (interpreter.is_blocking(state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BHold | Enums.InputFlags.CHold)):
		return "AngelAirFDStance"
	elif ((interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N5, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N8, state[Enums.StKey.leftface])) 
			and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
		return "AngelAirParryWhiff"
	elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
			interpreter.is_button_down(Enums.InputFlags.CDown)):
		return "AngelJump2C"
	elif (Global.level_1_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		return "AngelAirEXStarBall"
	elif (interpreter.special_input_button(Enums.SpecialInput.M623, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "AngelDuckPunch"
	elif (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "AngelAirStinger"
	elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "AngelAirLightStarBall"
	elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
		return "AngelSidewinder"
	elif (state[Enums.StKey.airDash] > 0 and interpreter.is_air_dashing(true, state[Enums.StKey.leftface])):
		return "AngelForwardAirDash"
	elif (state[Enums.StKey.airDash] > 0 and interpreter.is_air_dashing(false, state[Enums.StKey.leftface])):
		return "AngelBackwardAirDash"
	elif (Global.assist_ok(state, interpreter)):
		if (interpreter.is_low_blocking(state[Enums.StKey.leftface])):
			return "AngelAirAssistCall2"
		elif (Global.level_1_OK(state) and Global.super_assist_meter_ok(state) and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.DDown, state[Enums.StKey.leftface])):
			return "AngelAirAssistCallSuper"
		else:
			return "AngelAirAssistCall"
	elif (interpreter.is_button_down(Enums.InputFlags.CDown)):
		return "AngelJump5C"
	elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
		return "AngelJump5B"
	elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
		return "AngelJump5A"
	elif (state[Enums.StKey.doubleJump] > 0 and interpreter.is_tap_jumping() and interpreter.is_holding_a_direction(Enums.Numpad.N9, state[Enums.StKey.leftface])):
		return "AngelForwardMidAirPreJump"
	elif (state[Enums.StKey.doubleJump] > 0 and interpreter.is_tap_jumping() and interpreter.is_holding_a_direction(Enums.Numpad.N8, state[Enums.StKey.leftface])):
		return "AngelMidAirPreJump"
	elif (state[Enums.StKey.doubleJump] > 0 and interpreter.is_tap_jumping() and interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface])):
		return "AngelBackwardMidAirPreJump"
	else:
		return ""

func common_idle_transitions(state: Dictionary, interpreter: InputInterpreter) -> String:
	if (Global.burst_OK(state, interpreter)):
		return "Burst"
	elif (Global.boost_OK(state, interpreter)):
		return "BoostCancel"
	elif (interpreter.is_button_down(Enums.InputFlags.ADown | Enums.InputFlags.DDown)):
		if ((interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or 
				interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]))):
			return "GroundBackThrowWhiff"
		else:
			return "GroundThrowWhiff"
	elif (interpreter.is_blocking(state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BHold | Enums.InputFlags.CHold)):
		if (interpreter.is_low_blocking(state[Enums.StKey.leftface])):
			return "CrouchFDStance"
		else:
			return "StandFDStance"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
		return "CrouchParryWhiff"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N5, state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
		return "StandParryWhiff"
	elif (Global.level_2_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M632146, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		return "BionicArm"
	elif (Global.level_1_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		return "EXStarBall"
	elif (Global.level_5_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M214214, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		return "AngelInstall"
	elif (interpreter.special_input_button(Enums.SpecialInput.M623, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "DuckPunch"
	elif (interpreter.special_input_button(Enums.SpecialInput.M623, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
		return "LightDuckPunch"
	elif (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "Stinger"
	elif (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
		return "BatterSwing"
	elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "BatterSet"
	elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
		return "LightStarBall"
	elif (interpreter.is_stick_dashing(true, state[Enums.StKey.leftface]) and state[Enums.StKey.stateName] != "Run"):
		return "Run"
	elif (interpreter.is_button_dashing(true, state[Enums.StKey.leftface])):
		return "Run"
	elif (interpreter.is_dashing(false, state[Enums.StKey.leftface])):
		return "BackDash"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
			interpreter.is_button_down(Enums.InputFlags.CDown)):
		return "Stand6C"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
			interpreter.is_button_down(Enums.InputFlags.ADown)):
		return "Stand6A"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) and 
			interpreter.is_button_down(Enums.InputFlags.CDown)):
		return "Crouch3C"
	elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
			interpreter.is_button_down(Enums.InputFlags.CDown)):
		return "Crouch2C"
	elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
			interpreter.is_button_down(Enums.InputFlags.BDown)):
		return "Crouch2B"
	elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
			interpreter.is_button_down(Enums.InputFlags.ADown)):
		return "Crouch2A"
	elif (interpreter.is_button_down(Enums.InputFlags.CDown)):
		return "Stand5C"
	elif (state[Enums.StKey.distance_to_opponent] <= Util.PROXY_NORMAL and
			interpreter.is_button_down(Enums.InputFlags.BDown)):
		return "StandcB"
	elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
		return "Stand5B"
	elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
		return "Stand5A"
	elif (Global.assist_ok(state, interpreter)):
		if (interpreter.is_low_blocking(state[Enums.StKey.leftface])):
			return "GroundAssistCall2"
		elif (Global.level_1_OK(state) and Global.super_assist_meter_ok(state) and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.DDown, state[Enums.StKey.leftface])):
			return "GroundAssistCallSuper"
		else:
			return "GroundAssistCall"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface])):
		return "ForwardWalk"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface])):
		return "BackwardWalk"
	elif (interpreter.super_jump()):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N9, state[Enums.StKey.leftface])):
			return "ForwardPreSuperJump"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N8, state[Enums.StKey.leftface])):
			return "PreSuperJump"
		else:
			return "BackwardPreSuperJump"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N9, state[Enums.StKey.leftface])):
		return "ForwardPreJump"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N8, state[Enums.StKey.leftface])):
		return "PreJump"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface])):
		return "BackwardPreJump"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])):
		return "Crouch"
	else:
		return "Stand"


func common_jump_transitions_default(state: Dictionary, interpreter: InputInterpreter) -> String:
	if (Global.burst_OK(state, interpreter)):
		return "Burst"
	elif (Global.boost_OK(state, interpreter)):
		return "AirBoostCancel"
	elif (interpreter.is_button_down(Enums.InputFlags.ADown | Enums.InputFlags.DDown)):
		if ((interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or 
				interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]))):
			return "AirBackThrowWhiff"
		else:
			return "AirThrowWhiff"
	elif (interpreter.is_blocking(state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BHold | Enums.InputFlags.CHold)):
		return "AirFDStance"
	elif ((interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N5, state[Enums.StKey.leftface]) or 
			interpreter.is_holding_a_direction(Enums.Numpad.N8, state[Enums.StKey.leftface])) 
			and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
		return "AirParryWhiff"
	elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
			interpreter.is_button_down(Enums.InputFlags.CDown)):
		return "Jump2C"
	elif (Global.level_1_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		return "AirEXStarBall"
	elif (interpreter.special_input_button(Enums.SpecialInput.M623, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "DuckPunch"
	elif (interpreter.special_input_button(Enums.SpecialInput.M623, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
		return "LightDuckPunch"
	elif (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "AirStinger"
	elif (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
		return "AirBatterSwing"
	elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "AirBatterSet"
	elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
		return "AirLightStarBall"
	elif (state[Enums.StKey.airDash] > 0 and interpreter.is_air_dashing(true, state[Enums.StKey.leftface])):
		return "ForwardAirDash"
	elif (state[Enums.StKey.airDash] > 0 and interpreter.is_air_dashing(false, state[Enums.StKey.leftface])):
		return "BackwardAirDash"
	elif (Global.assist_ok(state, interpreter)):
		if (interpreter.is_low_blocking(state[Enums.StKey.leftface])):
			return "AirAssistCall2"
		elif (Global.level_1_OK(state) and Global.super_assist_meter_ok(state) and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.DDown, state[Enums.StKey.leftface])):
			return "AirAssistCallSuper"
		else:
			return "AirAssistCall"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			return "Jump6C"
	elif (interpreter.is_button_down(Enums.InputFlags.CDown)):
		return "Jump5C"
	elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
		return "Jump5B"
	elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
		return "Jump5A"
	elif (state[Enums.StKey.doubleJump] > 0 and interpreter.is_tap_jumping() and interpreter.is_holding_a_direction(Enums.Numpad.N9, state[Enums.StKey.leftface])):
		return "ForwardMidAirPreJump"
	elif (state[Enums.StKey.doubleJump] > 0 and interpreter.is_tap_jumping() and interpreter.is_holding_a_direction(Enums.Numpad.N8, state[Enums.StKey.leftface])):
		return "MidAirPreJump"
	elif (state[Enums.StKey.doubleJump] > 0 and interpreter.is_tap_jumping() and interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface])):
		return "BackwardMidAirPreJump"
	else:
		return ""
