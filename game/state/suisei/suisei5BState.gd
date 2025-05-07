extends SuiseiAirAttackState

class_name Suisei5BState

func _init():
	endFrame = 30
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 786431, Enums.StKey.Hurt1PosY : -7602178,
			Enums.StKey.Hurt1ScaleX : 744573, Enums.StKey.Hurt1ScaleY : 752267,
			Enums.StKey.Hurt2PosX : 1572864, Enums.StKey.Hurt2PosY : -16908288,
			Enums.StKey.Hurt2ScaleX : 394091, Enums.StKey.Hurt2ScaleY : 484535,
			Enums.StKey.Hurt3PosX : 10944512, Enums.StKey.Hurt3PosY : -16449538,
			Enums.StKey.Hurt3ScaleX : 670493, Enums.StKey.Hurt3ScaleY : 534448,
			},
		12 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit1PosX : 17104896, Enums.StKey.Hit1PosY : -8519680,
			Enums.StKey.Hit1ScaleX : 1400487, Enums.StKey.Hit1ScaleY : 707446,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 17563648, Enums.StKey.Hurt1PosY : -7471104,
			Enums.StKey.Hurt1ScaleX : 1424011, Enums.StKey.Hurt1ScaleY : 513145,
			Enums.StKey.Hurt2PosX : -589824, Enums.StKey.Hurt2PosY : -18219006,
			Enums.StKey.Hurt2ScaleX : 688733, Enums.StKey.Hurt2ScaleY : 1206950,
			Enums.StKey.Hurt3PosX : 10944512, Enums.StKey.Hurt3PosY : -16449538,
			Enums.StKey.Hurt3ScaleX : 670493, Enums.StKey.Hurt3ScaleY : 534448,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.guard: Enums.GuardType.Mid,
			Enums.StKey.attack_damage: 40,
			Enums.StKey.min_damage:3,
			Enums.StKey.hitstop: 9,
			Enums.StKey.blockstun: Util.DEFAULT_LIGHT_BLOCKSTUN - 2,
			Enums.StKey.hitstun: Util.DEFAULT_HITSTUN + 1,
			Enums.StKey.meter_build: SGFixed.ONE*1000,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_hitstun: 100,
			Enums.StKey.counter_launch_dir_x: SGFixed.ONE*20,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*40,
			},
		16 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 17563648, Enums.StKey.Hurt1PosY : -7471104,
			Enums.StKey.Hurt1ScaleX : 1424011, Enums.StKey.Hurt1ScaleY : 513145,
			Enums.StKey.Hurt2PosX : -589824, Enums.StKey.Hurt2PosY : -18219006,
			Enums.StKey.Hurt2ScaleX : 688733, Enums.StKey.Hurt2ScaleY : 1206950,
			Enums.StKey.Hurt3PosX : 10944512, Enums.StKey.Hurt3PosY : -16449538,
			Enums.StKey.Hurt3ScaleX : 670493, Enums.StKey.Hurt3ScaleY : 534448,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("5B")
	
func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 6):
		state[Enums.StKey.velocity_y] = -SGFixed.ONE*32
		state[Enums.StKey.velocity_x] = -SGFixed.ONE*12


func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == endFrame):
		common_jump_transitions(state, interpreter)
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
			elif (interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
				change_state.call("CrouchParryWhiff")
			elif (interpreter.is_holding_a_direction(Enums.Numpad.N5, state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BDown | Enums.InputFlags.CDown)):
				change_state.call("StandParryWhiff")
			elif (interpreter.is_dashing(true, state[Enums.StKey.leftface])):
				change_state.call("Run")
			elif (interpreter.is_dashing(false, state[Enums.StKey.leftface])):
				change_state.call("BackDash")
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

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (state[Enums.StKey.airDash] > -1 and interpreter.is_air_dashing(true, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "ForwardAirDash"
		elif (state[Enums.StKey.airDash] > -1 and interpreter.is_air_dashing(false, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "BackwardAirDash"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface])
				and interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "Jump6B"

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand and state[Enums.StKey.frame] <= 13):
		pass
	else:
		super.reaction(state, interpreter, event_cause)
