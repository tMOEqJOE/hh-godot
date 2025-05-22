extends PointStateFactory

class_name OllieStateFactory

func _init():
	super._init()
	
	var new_states : Dictionary = {
		"Intro": OllieIntroState,
		
		"HurtStand": OllieHurtGroundState,
		
		"Stand": preload("res://game/state/ollie/ollieStandState.gd"),
		"Crouch": preload("res://game/state/ollie/mainstates/ollieCrouchState.gd"),
		"ForwardWalk": preload("res://game/state/ollie/ollieforwardwalk.gd"),
		"BackwardWalk": preload("res://game/state/ollie/olliebackwalk.gd"),
		"Run": preload("res://game/state/ollie/ollieRun.gd"),
		"Skid": preload("res://game/state/ollie/ollieSkid.gd"),
		"BackDash": preload("res://game/state/ollie/ollieBackdash.gd"),
		
		"GroundThrowWhiff": preload("res://game/state/ollie/ollieGroundThrowWhiffState.gd"),
		"GroundBackThrowWhiff": preload("res://game/state/ollie/ollieGroundBackThrowWhiffState.gd"),
		
		"StandBlock": preload("res://game/state/ollie/ollieStandBlockState.gd"),
		"CrouchBlock": preload("res://game/state/ollie/ollieCrouchBlockState.gd"),
		"AirBlock": preload("res://game/state/ollie/ollieAirBlockState.gd"),
		"JustStandBlock": preload("res://game/state/ollie/ollieStandJustBlockState.gd"),
		"JustCrouchBlock": preload("res://game/state/ollie/ollieCrouchJustBlockState.gd"),
		"JustAirBlock": preload("res://game/state/ollie/ollieAirJustBlockState.gd"),
#		"StandFDStance": StandFDStanceState,
#		"CrouchFDStance": CrouchFDStanceState,
#		"AirFDStance": AirFDStanceState,
#		"StandParryWhiff": StandParryWhiffState,
#		"CrouchParryWhiff": CrouchParryWhiffState,
#		"AirParryWhiff": AirParryWhiffState,
#		"RedStandParryWhiff": RedStandParryWhiffState,
#		"RedCrouchParryWhiff": RedCrouchParryWhiffState,
#		"RedAirParryWhiff": RedAirParryWhiffState,
		"StandParryCatch": preload("res://game/state/ollie/ollieStandParryCatchState.gd"),
		"CrouchParryCatch": preload("res://game/state/ollie/ollieCrouchParryCatchState.gd"),
		"AirParryCatch": preload("res://game/state/ollie/ollieAirParryCatchState.gd"),
		
		"Jump": preload("res://game/state/ollie/ollieJump.gd"),
		"ForwardJump": preload("res://game/state/ollie/ollieForwardJump.gd"),
		"BackwardJump": preload("res://game/state/ollie/ollieBackJump.gd"),
		"MidAirJump": preload("res://game/state/ollie/ollieMidAirJump.gd"),
		"ForwardMidAirJump": preload("res://game/state/ollie/ollieMidAirForwardJump.gd"),
		"BackwardMidAirJump": preload("res://game/state/ollie/ollieMidAirBackJump.gd"),
		"SuperJump": preload("res://game/state/ollie/ollieSuperJump.gd"),
		"ForwardSuperJump": preload("res://game/state/ollie/ollieForwardSuperJump.gd"),
		"BackwardSuperJump": preload("res://game/state/ollie/ollieBackwardSuperJump.gd"),
		
		"AirTech": preload("res://game/state/ollie/ollieAirTechState.gd"),
		"ForwardAirTech": preload("res://game/state/ollie/ollieForwardAirTechState.gd"),
		"BackAirTech": preload("res://game/state/ollie/ollieBackwardAirTechState.gd"),
		
		"JumpFall": preload("res://game/state/ollie/ollieJumpFall.gd"),
		
		"ForwardAirDash": preload("res://game/state/ollie/ollieFairDash.gd"),
		"BackwardAirDash": preload("res://game/state/ollie/ollieBairDash.gd"),
		
		"Stand5A": preload("res://game/state/ollie/ollie5AState.gd"),
		"Stand5B": preload("res://game/state/ollie/ollie5BState.gd"),
		"Stand5C": preload("res://game/state/ollie/ollie5CState.gd"),
		"Crouch2A": preload("res://game/state/ollie/ollie2AState.gd"),
		"Crouch2B": preload("res://game/state/ollie/ollie2BState.gd"),
		"Crouch2C": preload("res://game/state/ollie/ollie2CState.gd"),
		"StandcB": preload("res://game/state/ollie/ollie5BState.gd"),
		"Stand6A": preload("res://game/state/ollie/ollie6AState.gd"),
		"Stand6C": preload("res://game/state/ollie/ollie6CState.gd"),
		"Stand6CRelease": preload("res://game/state/ollie/ollie6CReleaseState.gd"),
		"Crouch3C": preload("res://game/state/ollie/ollie3CState.gd"),
		"Jump5A": preload("res://game/state/ollie/ollieJAState.gd"),
		"Jump5B": preload("res://game/state/ollie/ollieJBState.gd"),
		"Jump5C": preload("res://game/state/ollie/ollieJCState.gd"),
		"Jump2C": preload("res://game/state/ollie/ollieJ2CState.gd"),
		
		"GroundAssistCall2": preload("res://game/state/ollie/ollieGroundAssistCall2.gd"),
		"GroundAssistCallSuper": preload("res://game/state/ollie/ollieGroundAssistCallSuper.gd"),
		"GroundAssistCall": preload("res://game/state/ollie/ollieGroundAssistCall.gd"),
		"AirAssistCall": preload("res://game/state/ollie/ollieAirAssistCall.gd"),
		"AirAssistCall2": preload("res://game/state/ollie/ollieAirAssistCall2.gd"),
		"AirAssistCallSuper": preload("res://game/state/ollie/ollieAirAssistCallSuper.gd"),

		"ChessA": preload("res://game/state/ollie/ollieChargeRookState.gd"),
		"ChessB": preload("res://game/state/ollie/ollieChargeBishopState.gd"),
		"ChessC": preload("res://game/state/ollie/ollieChargeKnightState.gd"),
		"ChessAThrow": preload("res://game/state/ollie/ollieRookState.gd"),
		"ChessBThrow": preload("res://game/state/ollie/ollieBishopState.gd"),
		"ChessCThrow": preload("res://game/state/ollie/ollieKnightState.gd"),
		"ChessAChargeThrow": preload("res://game/state/ollie/ollieChargeRookThrowState.gd"),
		"ChessBChargeThrow": preload("res://game/state/ollie/ollieChargeBishopThrowState.gd"),
		"ChessCChargeThrow": preload("res://game/state/ollie/ollieChargeKnightThrowState.gd"),
		"AirChessA": preload("res://game/state/ollie/ollieAirRookState.gd"),
		"AirChessB": preload("res://game/state/ollie/ollieAirBishopState.gd"),
		"AirChessC": preload("res://game/state/ollie/ollieAirKnightState.gd"),
		
		"EXStarBall": preload("res://game/state/ollie/ollieQueenState.gd"),
		"AirEXStarBall": preload("res://game/state/ollie/ollieAirQueenState.gd"),
		"ProtonCannon" : preload("res://game/state/ollie/ollieProtonCannonState.gd"),
		"LandingRecovery": preload("res://game/state/ollie/ollieLandingRecovery.gd"),
		
		"Wakeup": preload("res://game/state/ollie/ollieWakeup.gd"),
		"HurtLaunch": preload("res://game/state/ollie/ollieHurtLaunch.gd"),
		"GroundBounce": preload("res://game/state/ollie/ollieGroundBounceState.gd"), 
		"KO":  preload("res://game/state/ollie/ollieKO.gd"),
	}
	
	merge_state_dictionary(new_states)


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
	elif (Global.level_2_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		return "ProtonCannon"
	elif (Global.level_1_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "EXStarBall"
	elif (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
		return "ChessA"
	elif (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "ChessB"
	elif (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		return "ChessC"
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
	elif (Global.level_1_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "AirEXStarBall"
	elif (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
		return "AirChessA"
	elif (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "AirChessB"
	elif (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		return "AirChessC"
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
