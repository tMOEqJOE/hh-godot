extends PointStateFactory

class_name KanataStateFactory

func _init():
	super._init()
	
	var new_states : Dictionary = {
		"Intro": preload("res://game/state/kanata/kanataIntroState.gd"),
		
		"Stand": preload("res://game/state/kanata/kanataStandState.gd"),
		"Crouch": preload("res://game/state/kanata/mainstates/kanataCrouchState.gd"),
		"ForwardWalk": preload("res://game/state/kanata/kanataforwardwalk.gd"),
		"BackwardWalk": preload("res://game/state/kanata/kanatabackwalk.gd"),
		"Run": preload("res://game/state/kanata/kanataRun.gd"),
		"Skid": preload("res://game/state/kanata/kanataSkid.gd"),
		"BackDash": preload("res://game/state/kanata/kanataBackDash.gd"),
		
#		"GroundThrowWhiff": preload("res://game/state/kanata/kanata5AState.gd"),
#		"GroundBackThrowWhiff": preload("res://game/state/kanata/kanata5AState.gd"),
		
		"StandBlock": preload("res://game/state/kanata/kanataStandBlockState.gd"),
		"CrouchBlock": preload("res://game/state/kanata/kanataCrouchBlockState.gd"),
		"AirBlock": preload("res://game/state/kanata/kanataAirBlockState.gd"),
		"JustStandBlock": preload("res://game/state/kanata/kanataStandJustBlockState.gd"),
		"JustCrouchBlock": preload("res://game/state/kanata/kanataCrouchJustBlockState.gd"),
		"JustAirBlock": preload("res://game/state/kanata/kanataAirJustBlockState.gd"),
#		"StandFDStance": StandFDStanceState,
#		"CrouchFDStance": CrouchFDStanceState,
#		"AirFDStance": AirFDStanceState,
#		"StandParryWhiff": StandParryWhiffState,
#		"CrouchParryWhiff": CrouchParryWhiffState,
#		"AirParryWhiff": AirParryWhiffState,
#		"RedStandParryWhiff": RedStandParryWhiffState,
#		"RedCrouchParryWhiff": RedCrouchParryWhiffState,
#		"RedAirParryWhiff": RedAirParryWhiffState,
		"StandParryCatch": preload("res://game/state/kanata/kanataStandParryCatchState.gd"),
		"CrouchParryCatch": preload("res://game/state/kanata/kanataCrouchParryCatchState.gd"),
		"AirParryCatch": preload("res://game/state/kanata/kanataAirParryCatchState.gd"),
		
		"Jump": preload("res://game/state/kanata/kanataJump.gd"),
		"ForwardJump": preload("res://game/state/kanata/kanataForwardJump.gd"),
		"BackwardJump": preload("res://game/state/kanata/kanataBackJump.gd"),
		"MidAirJump": preload("res://game/state/kanata/kanataMidAirJump.gd"),
		"ForwardMidAirJump": preload("res://game/state/kanata/kanataMidAirForwardJump.gd"),
		"BackwardMidAirJump": preload("res://game/state/kanata/kanataMidAirBackJump.gd"),
		"SuperJump": preload("res://game/state/kanata/kanataSuperJump.gd"),
		"ForwardSuperJump": preload("res://game/state/kanata/kanataForwardSuperJump.gd"),
		"BackwardSuperJump": preload("res://game/state/kanata/kanataBackwardSuperJump.gd"),
		
		"AirTech": preload("res://game/state/kanata/kanataAirTech.gd"),
		"ForwardAirTech": preload("res://game/state/kanata/kanataForwardAirTech.gd"),
		"BackAirTech": preload("res://game/state/kanata/kanataBackwardAirTech.gd"),
		
		"JumpFall": preload("res://game/state/kanata/kanataJumpFall.gd"),
		
		"ForwardAirDash": preload("res://game/state/kanata/kanataFairDash.gd"),
		"BackwardAirDash": preload("res://game/state/kanata/kanataBairDash.gd"),
		
		"Stand5A": preload("res://game/state/kanata/kanata5AState.gd"),
		"Stand5B": preload("res://game/state/kanata/kanata5BState.gd"),
		"Stand5C": preload("res://game/state/kanata/kanata5CState.gd"),
		"Crouch2A": preload("res://game/state/kanata/kanata2AState.gd"),
		"Crouch2B": preload("res://game/state/kanata/kanata2BState.gd"),
		"Crouch2C": preload("res://game/state/kanata/kanata2CState.gd"),
		"StandcB": preload("res://game/state/kanata/kanataCBState.gd"),
		"Stand6A": preload("res://game/state/kanata/kanata6AState.gd"),
		"Stand6C": preload("res://game/state/kanata/kanata6CState.gd"),
		"Crouch3C": preload("res://game/state/kanata/kanata3CState.gd"),
		"Jump5A": preload("res://game/state/kanata/kanataJAState.gd"),
		"Jump5B": preload("res://game/state/kanata/kanataJBState.gd"),
		"Jump5C": preload("res://game/state/kanata/kanataJCState.gd"),
		"Jump2C": preload("res://game/state/kanata/kanataJ2CState.gd"),
		"Jump6C": preload("res://game/state/kanata/kanataJ6CState.gd"),
		
		"GroundAssistCall2": preload("res://game/state/kanata/kanataGroundAssistCall2.gd"),
		"GroundAssistCallSuper": preload("res://game/state/kanata/kanataGroundAssistCallSuper.gd"),
		"GroundAssistCall": preload("res://game/state/kanata/kanataGroundAssistCall.gd"),
		"AirAssistCall": preload("res://game/state/kanata/kanataAirAssistCall.gd"),
		"AirAssistCall2": preload("res://game/state/kanata/kanataAirAssistCall2.gd"),
		"AirAssistCallSuper": preload("res://game/state/kanata/kanataAirAssistCallSuper.gd"),

		"KanataWingStance" : preload("res://game/state/kanata/kanataWingStanceState.gd"),
		"KanataWingStanceA" : preload("res://game/state/kanata/kanataWingStanceAState.gd"),
		"KanataWingStanceAA" : preload("res://game/state/kanata/kanataWingStanceAAState.gd"),
		"KanataWingStanceB" : preload("res://game/state/kanata/kanataWingStanceBState.gd"),
		"KanataWingStanceC" : preload("res://game/state/kanata/kanataWingStanceCState.gd"),
		"KanataWingStanceExit" : preload("res://game/state/kanata/kanataWingStanceExitState.gd"),
		
		"AirKanataWingStance" : preload("res://game/state/kanata/kanataAirWingStanceState.gd"),
		"KanataAirWingStanceA" : preload("res://game/state/kanata/kanataAirWingStanceAState.gd"),
		"KanataAirWingStanceAA" : preload("res://game/state/kanata/kanataAirWingStanceAAState.gd"),
		"KanataAirWingStanceB" : preload("res://game/state/kanata/kanataAirWingStanceBState.gd"),
		"KanataAirWingStanceC" : preload("res://game/state/kanata/kanataAirWingStanceCState.gd"),
		"KanataAirWingStanceExit" : preload("res://game/state/kanata/kanataAirWingStanceExitState.gd"),
		
		"KanataFiftyKGWhiff" : preload("res://game/state/kanata/kanataFiftyKGWhiff.gd"),
		"KanataFiftyRekkaA" : preload("res://game/state/kanata/kanataFiftyKGRekkaAState.gd"),
		"KanataFiftyKGHit" : preload("res://game/state/kanata/kanataFiftyKGHitState.gd"),
		"KanataAirFiftyKGWhiff" : preload("res://game/state/kanata/kanataFiftyKGAirWhiff.gd"),
		"KanataAirFiftyRekkaA" : preload("res://game/state/kanata/kanataFiftyKGAirRekkaAState.gd"),
		"KanataAirFiftyKGHit" : preload("res://game/state/kanata/kanataFiftyKGAirHitState.gd"),
		"KanataSuperFiftyKGWhiff" : preload("res://game/state/kanata/kanataSuperFiftyKGWhiff.gd"),
		"KanataSuperFiftyRekkaA" : preload("res://game/state/kanata/kanataSuperFiftyKGRekkaAState.gd"),
		"KanataSuperFiftyKGHit" : preload("res://game/state/kanata/kanataSuperFiftyKGHitState.gd"),
		
		"KanataAirWingHazard" : preload("res://game/state/kanata/kanataAirWingHazard.gd"),
		"LandingRecovery": preload("res://game/state/kanata/kanataLandingRecovery.gd"),
		
		"AirThrowHit": preload("res://game/state/kanata/kanataAirThrowHitState.gd"),
		"AirBackThrowHit": preload("res://game/state/kanata/kanataBackAirThrowHitState.gd"),
		
		"Wakeup": preload("res://game/state/kanata/kanataWakeup.gd"),
		"HurtLaunch": preload("res://game/state/kanata/kanataHurtLaunch.gd"),
		"GroundBounce": preload("res://game/state/kanata/kanataGroundBounceState.gd"),
		"KO":  preload("res://game/state/kanata/kanataKO.gd"),
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
	elif (Global.level_3_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M63214, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		return "KanataSuperFiftyKGWhiff"
	elif (interpreter.special_input_button(Enums.SpecialInput.M63214, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
		return "KanataFiftyKGWhiff"
	elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		return "KanataWingStance"
	elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "KanataWingStance"
	elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
		return "KanataWingStance"
	elif (interpreter.is_dashing(true, state[Enums.StKey.leftface])):
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
	elif (Global.level_2_OK(state) and interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "KanataAirWingHazard"
	elif (interpreter.special_input_button(Enums.SpecialInput.M63214, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
		return "KanataAirFiftyKGWhiff"
	elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
		return "AirKanataWingStance"
	elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
		return "AirKanataWingStance"
	elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
		return "AirKanataWingStance"
	elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface])
				and interpreter.is_button_down(Enums.InputFlags.CDown)):
			return "Jump6C"
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
