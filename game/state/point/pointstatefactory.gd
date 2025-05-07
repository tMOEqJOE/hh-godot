extends StateFactory

class_name PointStateFactory

func _init():
	super._init()
	
	var new_states : Dictionary = {
		"Stand": StandState,
		"Crouch": Stand5BState,
		
		"Jump": JumpState,
		"ForwardJump": ForwardJumpState,
		"BackwardJump": BackwardJumpState,
		"SuperJump": SuperJumpState,
		"ForwardSuperJump": ForwardSuperJumpState,
		"BackwardSuperJump": BackwardSuperJumpState,
		"MidAirJump": MidAirJumpState,
		"ForwardMidAirJump": ForwardMidAirJumpState,
		"BackwardMidAirJump": BackwardMidAirJumpState,
		
		"JumpFall": JumpFallState,
		
		"PreJump": PreJumpState,
		"ForwardPreJump": ForwardPreJumpState,
		"BackwardPreJump": BackwardPreJumpState,
		"PreSuperJump": PreSuperJumpState,
		"ForwardPreSuperJump": ForwardPreSuperJumpState,
		"BackwardPreSuperJump": BackwardPreSuperJumpState,
		"MidAirPreJump": MidAirPreJumpState,
		"ForwardMidAirPreJump": ForwardMidAirPreJumpState,
		"BackwardMidAirPreJump": BackwardMidAirPreJumpState,
		
		"ForwardWalk": ForwardWalkState,
		"BackwardWalk": BackwardWalkState,
		"Run": RunState,
		"Skid": SkidState,
		"BackDash": BackDashState,
		"ForwardAirDash": ForwardAirDashState,
		"BackwardAirDash": BackwardAirDashState,
		
		"Stand5A": Stand5AState,
		"Stand5B": Stand5BState,
		"Stand5C": Stand5CState,
		"Crouch2A": Stand5AState,
		"Crouch2B": Stand5BState,
		"Crouch2C": Stand5CState,
		"Jump5A": Jump5AState,
		"Jump5B": Jump5BState,
		"Jump5C": Jump5CState,
		"StandcB": StandcBState,
		"Stand6A": Stand5AState,
		"Stand6C": Stand6CState,
		"Crouch3C": Crouch3CState,
		"Jump2C": Jump2CState,
		"Jump6C": Jump5BState,
		"GroundThrowWhiff": GroundThrowWhiffState,
		"AirThrowWhiff": AirThrowWhiffState,
		"GroundThrowHit": GroundThrowHitState,
		"AirThrowHit": AirThrowHitState,
		"GroundBackThrowWhiff": GroundBackThrowWhiffState,
		"AirBackThrowWhiff": AirBackThrowWhiffState,
		"GroundBackThrowHit": GroundBackThrowHitState,
		"AirBackThrowHit": AirBackThrowHitState,
		"GroundAssistCall2": GroundAssistCall2State,
		"GroundAssistCallSuper": GroundAssistCallSuperState,
		"GroundAssistCall": GroundAssistCallState,
		"AirAssistCall": AirAssistCallState,
		"AirAssistCall2": AirAssistCall2State,
		"AirAssistCallSuper": AirAssistCallSuperState,
		
		"Knockdown": PointKnockdownState,
		"HurtOTG": HurtOTGState,
		"HurtCrouch": HurtCrouchState,
		"StandBlock": StandBlockState,
		"CrouchBlock": CrouchBlockState,
		"AirBlock": AirBlockState,
		"JustStandBlock": StandJustBlockState,
		"JustCrouchBlock": preload("res://game/state/point/reaction/CrouchJustBlockState.gd"),
		"JustAirBlock": AirJustBlockState,
		"StandFDStance": StandFDStanceState,
		"CrouchFDStance": CrouchFDStanceState,
		"AirFDStance": AirFDStanceState,
		"StandParryWhiff": StandParryWhiffState,
		"CrouchParryWhiff": CrouchParryWhiffState,
		"AirParryWhiff": AirParryWhiffState,
		"RedStandParryWhiff": RedStandParryWhiffState,
		"RedCrouchParryWhiff": RedCrouchParryWhiffState,
		"RedAirParryWhiff": RedAirParryWhiffState,
		"StandParryCatch": StandParryCatchState,
		"CrouchParryCatch": CrouchParryCatchState,
		"AirParryCatch": AirParryCatchState,
		
		"AirTech": AirTechState,
		"ForwardAirTech": ForwardAirTechState,
		"BackAirTech": BackwardAirTechState,
		
		"Burst": BurstState,
		"AssistGuardCancel": AssistGuardCancelState,
		"AirAssistGuardCancel": AirAssistGuardCancelState,
		"AssistWeakGuardCancel": AssistWeakGuardCancelState,
		"AirAssistWeakGuardCancel": AirAssistWeakGuardCancelState,
		"BoostCancel": BoostCancelState,
		"AirBoostCancel": AirBoostCancelState,
		
		"Intro": IntroState,
	}
	
	merge_state_dictionary(new_states)

func angel_common_jump_transitions_default(state: Dictionary, interpreter: InputInterpreter) -> String:
	print("Warning: used Default Angel Common Jump transitions")
	return ""

func angel_common_idle_transitions(state: Dictionary, interpreter: InputInterpreter) -> String:
	print("Warning: used Default Angel Common Idle transitions")
	return ""

func common_jump_transitions_default(state: Dictionary, interpreter: InputInterpreter) -> String:
	print("Warning: used Default Common Jump transitions")
	return ""

func common_idle_transitions(state: Dictionary, interpreter: InputInterpreter) -> String:
	print("Warning: used Default Common idle transitions")
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
	elif (Global.level_1_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M41236, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		return "Super1"
	elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		return "ChargeStart"
	elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "ChargeStart"
	elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
		return "ChargeStart"
	elif (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		return "Unsummon"
	elif (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "Unsummon"
	elif (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
		return "Unsummon"
	elif (interpreter.is_stick_dashing(true, state[Enums.StKey.leftface]) and state[Enums.StKey.stateName] != "Run"):
		return "Run"
	elif (interpreter.is_button_dashing(true, state[Enums.StKey.leftface])):
		return "Run"
	elif (interpreter.is_dashing(false, state[Enums.StKey.leftface])):
		return "BackDash"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
			interpreter.is_button_down(Enums.InputFlags.CDown)):
		return "Stand6C"
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
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
			interpreter.is_button_down(Enums.InputFlags.ADown)):
		return "Stand6A"
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
