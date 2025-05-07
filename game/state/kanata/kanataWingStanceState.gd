extends "res://game/state/kanata/mainstates/kanataAttackState.gd"

class_name KanataWingStanceState

func _init():
	endFrame = 99
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -655360, Enums.StKey.Hurt1PosY : -23855102,
			Enums.StKey.Hurt1ScaleX : 497627, Enums.StKey.Hurt1ScaleY : 523538,
			Enums.StKey.Hurt2PosX : 3211265, Enums.StKey.Hurt2PosY : -15269887,
			Enums.StKey.Hurt2ScaleX : 964115, Enums.StKey.Hurt2ScaleY : 370909,
			Enums.StKey.Hurt3PosX : 65, Enums.StKey.Hurt3PosY : -10485760,
			Enums.StKey.Hurt3ScaleX : 871288, Enums.StKey.Hurt3ScaleY : 1034829,
			Enums.StKey.Summon: "knockdowndust",
			},
		25 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -655360, Enums.StKey.Hurt1PosY : -23855102,
			Enums.StKey.Hurt1ScaleX : 497627, Enums.StKey.Hurt1ScaleY : 523538,
			Enums.StKey.Hurt2PosX : 3211265, Enums.StKey.Hurt2PosY : -15269887,
			Enums.StKey.Hurt2ScaleX : 964115, Enums.StKey.Hurt2ScaleY : 370909,
			Enums.StKey.Hurt3PosX : 65, Enums.StKey.Hurt3PosY : -10485760,
			Enums.StKey.Hurt3ScaleX : 871288, Enums.StKey.Hurt3ScaleY : 1034829,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.drag_x] = Util.SLIPPERY_FRICTION
	state[Enums.StKey.super_meter] += SGFixed.ONE*2
	anim.play("WingStance")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 0):
		SyncManager.play_sound("KanataWingStanceEnter", Global.AirTechSound, {"bus": "Voice"})
	elif (state[Enums.StKey.frame] == 26):
		state[Enums.StKey.frame] = 3

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == endFrame):
		common_idle_transitions(state, interpreter)
	elif (state[Enums.StKey.frame] == endFrame - 1):
		state[Enums.StKey.leftfaceOK] = true
	if (state[Enums.StKey.frame] == 0):
		if (state[Enums.StKey.kara_OK]):
			# Kara Cancel section
			state[Enums.StKey.kara_OK] = false
			if (boost_OK(state, interpreter)):
				change_state.call("BoostCancel")
			elif (interpreter.is_blocking(state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BHold | Enums.InputFlags.CHold)):
				if (interpreter.is_low_blocking(state[Enums.StKey.leftface])):
					change_state.call("CrouchFDStance")
				else:
					change_state.call("StandFDStance")
			elif (interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
				change_state.call("CrouchParryWhiff")
			elif (interpreter.is_holding_a_direction(Enums.Numpad.N5, state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
				change_state.call("StandParryWhiff")
			elif (interpreter.is_button_dashing(true, state[Enums.StKey.leftface])):
				change_state.call("Run")
			elif (interpreter.is_dashing(false, state[Enums.StKey.leftface])):
				change_state.call("BackDash")
		if (burst_OK(state, interpreter)):
			change_state.call("Burst")
		state[Enums.StKey.leftfaceOK] = false
	
	if (state[Enums.StKey.hitStopFrame] == 0 and not state[Enums.StKey.cancelState].is_empty()):
		# is out of hitstop, and cancellable
		# delay cancel state
		anim.stop(true)
		change_state.call(state[Enums.StKey.cancelState])
	
	gatling_cancel(state, interpreter)
	special_cancel(state, interpreter)
	jump_cancel(state, interpreter)
	meter_cancel(state, interpreter)

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.frame] >= Util.INPUT_BUFFER_LENIANCY):
#		if (interpreter.is_dashing(true, state[Enums.StKey.leftface])):
#			change_state.call("Run")
#		elif (interpreter.is_dashing(false, state[Enums.StKey.leftface])):
#			change_state.call("BackDash")
		if (level_1_OK(state) and interpreter.is_button_down(Enums.InputFlags.CDown)):
			change_state.call("KanataWingStanceC")
		elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
			change_state.call("KanataWingStanceB")
		elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
			change_state.call("KanataWingStanceA")
		elif (interpreter.is_button_down(Enums.InputFlags.DDown)):
			change_state.call("KanataWingStanceExit")

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func meter_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (boost_OK(state, interpreter)):
		change_state.call("BoostCancel")

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
