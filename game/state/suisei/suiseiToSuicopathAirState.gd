extends SuicopathAirAttackState

class_name SuiseiToSuicopathAirState

var SoundFX = Global.AirTechSound

func _init():
	endFrame = 15
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -720896, Enums.StKey.Hurt1PosY : -16908286,
			Enums.StKey.Hurt1ScaleX : 800336, Enums.StKey.Hurt1ScaleY : 1642558,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	#disable karas off of stance
#	state[Enums.StKey.kara_OK] = true
	
	state[Enums.StKey.velocity_x] = SGFixed.mul(state[Enums.StKey.velocity_x], 48536)
	state[Enums.StKey.velocity_y] = SGFixed.mul(state[Enums.StKey.velocity_y], 47536)
	state[Enums.StKey.accel_y] = 101072
	state[Enums.StKey.leftfaceOK] = true # false
	state[Enums.StKey.hitStopFrame] = 0
	anim.play("SuiseiToSuicopath")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 0):
		SyncManager.play_sound("SuiseiStanceChange", SoundFX, {"bus": "Voice"})

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == endFrame):
		common_jump_transitions(state, interpreter)
	if (state[Enums.StKey.frame] == 0):
		if (state[Enums.StKey.kara_OK]):
			# Kara Cancel section
			state[Enums.StKey.kara_OK] = false
			if (boost_OK(state, interpreter)):
				change_state.call("AirBoostCancel")
			elif (interpreter.is_button_down(Enums.InputFlags.ADown | Enums.InputFlags.DDown)):
				if ((interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface]) or
						interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or 
						interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]))):
					change_state.call("AirBackThrowWhiff")
				else:
					change_state.call("AirThrowWhiff")
			elif ((interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
					interpreter.is_holding_a_direction(Enums.Numpad.N5, state[Enums.StKey.leftface]) or 
					interpreter.is_holding_a_direction(Enums.Numpad.N8, state[Enums.StKey.leftface])) 
					and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
				change_state.call("AirParryWhiff")
			elif (interpreter.is_blocking(state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
				change_state.call("AirFDStance")
			elif (state[Enums.StKey.airDash] > -1 and interpreter.is_button_dashing(true, state[Enums.StKey.leftface])):
				change_state.call("ForwardAirDash")
			elif (state[Enums.StKey.airDash] > -1 and interpreter.is_button_dashing(false, state[Enums.StKey.leftface])):
				change_state.call("BackwardAirDash")
		if (burst_OK(state, interpreter)):
			change_state.call("Burst")
	if (state[Enums.StKey.hitStopFrame] == 0 and not state[Enums.StKey.cancelState].is_empty()):
		# is out of hitstop, and cancellable
		# delay cancel state
		anim.stop(true)
		change_state.call(state[Enums.StKey.cancelState])

	gatling_cancel(state, interpreter)
	special_cancel(state, interpreter)
	jump_cancel(state, interpreter)
	meter_cancel(state, interpreter)

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
