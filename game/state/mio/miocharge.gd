extends MioAttackState

class_name MioChargeState

func _init():
	anim_data = {
		0 : {
			Enums.StKey.counterOK: true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -655359, Enums.StKey.Hurt1PosY : -28114944,
			Enums.StKey.Hurt1ScaleX : 276315, Enums.StKey.Hurt1ScaleY : 303423,
			Enums.StKey.Hurt2PosX : 65536, Enums.StKey.Hurt2PosY : -18284544,
			Enums.StKey.Hurt2ScaleX : 430035, Enums.StKey.Hurt2ScaleY : -705015,
			Enums.StKey.Hurt3PosX : 327680, Enums.StKey.Hurt3PosY : -5963776,
			Enums.StKey.Hurt3ScaleX : 430035, Enums.StKey.Hurt3ScaleY : -599184,
			},
		7 : {
			Enums.StKey.counterOK : true,
#			Enums.StKey.Summon : "hatoCharge",
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -655359, Enums.StKey.Hurt1PosY : -28114944,
			Enums.StKey.Hurt1ScaleX : 276315, Enums.StKey.Hurt1ScaleY : 303423,
			Enums.StKey.Hurt2PosX : 65536, Enums.StKey.Hurt2PosY : -18284544,
			Enums.StKey.Hurt2ScaleX : 430035, Enums.StKey.Hurt2ScaleY : -705015,
			Enums.StKey.Hurt3PosX : 327680, Enums.StKey.Hurt3PosY : -5963776,
			Enums.StKey.Hurt3ScaleX : 430035, Enums.StKey.Hurt3ScaleY : -599184,
		},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.hitStopFrame] = 0
	anim.play("Charge")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	state[Enums.StKey.sync_rate] += 20536
	if (state[Enums.StKey.frame] == 8):
		state[Enums.StKey.frame] = 7

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == 0):
		if (state[Enums.StKey.kara_OK]):
			# Kara Cancel section
			state[Enums.StKey.kara_OK] = false
			if (boost_OK(state, interpreter)):
				change_state.call("BoostCancel")
			elif (interpreter.is_button_down(Enums.InputFlags.ADown | Enums.InputFlags.DDown)):
				if ((interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface]) or
						interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or 
						interpreter.is_holding_a_direction(Enums.Numpad.N7, state[Enums.StKey.leftface]))):
					change_state.call("GroundBackThrowWhiff")
				else:
					change_state.call("GroundThrowWhiff")
			elif (interpreter.is_blocking(state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BHold | Enums.InputFlags.CHold)):
				if (interpreter.is_low_blocking(state[Enums.StKey.leftface])):
					change_state.call("CrouchFDStance")
				else:
					change_state.call("StandFDStance")
		if (burst_OK(state, interpreter)):
			change_state.call("Burst")
	
	if (state[Enums.StKey.hitStopFrame] == 0 and not state[Enums.StKey.cancelState].is_empty()):
		# is out of hitstop, and cancellable
		# delay cancel state
		anim.stop(true)
		change_state.call(state[Enums.StKey.cancelState])
	
	if (not interpreter.is_button_down(Enums.InputFlags.AHold)
			and not interpreter.is_button_down(Enums.InputFlags.BHold)
			and not interpreter.is_button_down(Enums.InputFlags.CHold)):
		change_state.call("Summon")
	
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
