extends FlayonAirAttackState

class_name FlayonFlightAState

func _init():
	endFrame = 10
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -4849664, Enums.StKey.Hurt1PosY : -12058623,
			Enums.StKey.Hurt1ScaleX : 536711, Enums.StKey.Hurt1ScaleY : 244563,
			Enums.StKey.Hurt2PosX : 1310719, Enums.StKey.Hurt2PosY : -19660802,
			Enums.StKey.Hurt2ScaleX : 924253, Enums.StKey.Hurt2ScaleY : -367041,
			Enums.StKey.Hurt3PosX : 5439488, Enums.StKey.Hurt3PosY : -12976129,
			Enums.StKey.Hurt3ScaleX : 1090539, Enums.StKey.Hurt3ScaleY : -321771,
			},
		4 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit1PosX : 7405568, Enums.StKey.Hit1PosY : -16646144,
			Enums.StKey.Hit1ScaleX : 657665, Enums.StKey.Hit1ScaleY : 734906,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 6553600, Enums.StKey.Hurt1PosY : -21561344,
			Enums.StKey.Hurt1ScaleX : 334968, Enums.StKey.Hurt1ScaleY : 357786,
			Enums.StKey.Hurt2PosX : 7077888, Enums.StKey.Hurt2PosY : -15073280,
			Enums.StKey.Hurt2ScaleX : 446568, Enums.StKey.Hurt2ScaleY : -774072,
			Enums.StKey.Hurt3PosX : 851968, Enums.StKey.Hurt3PosY : -4521984,
			Enums.StKey.Hurt3ScaleX : 397190, Enums.StKey.Hurt3ScaleY : -382619,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.attack_damage: 26,
			Enums.StKey.min_damage: 6,
			Enums.StKey.hitstop: 8,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.hitstun: Util.DEFAULT_HITSTUN + 4,
			Enums.StKey.attack_type : Enums.AttackType.Strike,
			Enums.StKey.counter_hit: Enums.AttackType.Strike,
			Enums.StKey.counter_launch_dir_x: Util.BASE_SHORT_STRIKE_X_PUSHBACK,
			Enums.StKey.counter_launch_dir_y: Util.BASE_AIR_Y_PUSHBACK,
			Enums.StKey.block_dir_x : Util.BASE_STRIKE_X_PUSHBACK,
			Enums.StKey.block_dir_y : Util.BASE_AIR_Y_PUSHBACK,
			Enums.StKey.launch_dir_x: Util.BASE_STRIKE_X_PUSHBACK,
			Enums.StKey.launch_dir_y: Util.BASE_AIR_Y_PUSHBACK,
			},
		6 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -4849664, Enums.StKey.Hurt1PosY : -12058623,
			Enums.StKey.Hurt1ScaleX : 536711, Enums.StKey.Hurt1ScaleY : 244563,
			Enums.StKey.Hurt2PosX : 1310719, Enums.StKey.Hurt2PosY : -19660802,
			Enums.StKey.Hurt2ScaleX : 924253, Enums.StKey.Hurt2ScaleY : -367041,
			Enums.StKey.Hurt3PosX : 5439488, Enums.StKey.Hurt3PosY : -12976129,
			Enums.StKey.Hurt3ScaleX : 1090539, Enums.StKey.Hurt3ScaleY : -321771,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("FlightA")
	state[Enums.StKey.drag_x] = Util.FRICTION
	state[Enums.StKey.kara_OK] = true
	state[Enums.StKey.accel_y] = 0
	state[Enums.StKey.accel_x] = 0
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.velocity_x] = 0

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	state[Enums.StKey.super_meter] -= Util.FLIGHT_ATTACK_METER_DRAIN

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == 0):
		if (state[Enums.StKey.kara_OK]):
			# Kara Cancel section
			if (boost_OK(state, interpreter)):
				change_state.call("AirBoostCancel")
			elif (interpreter.button_dash_four_way(Enums.Numpad.N6, state[Enums.StKey.leftface])):
				state[Enums.StKey.cancelState] = "FlightForwardAirdash"
			elif (interpreter.button_dash_four_way(Enums.Numpad.N4, state[Enums.StKey.leftface])):
				state[Enums.StKey.cancelState] = "FlightBackwardAirdash"
			elif (interpreter.button_dash_four_way(Enums.Numpad.N2, state[Enums.StKey.leftface])):
				state[Enums.StKey.cancelState] = "FlightDownwardAirdash"
			elif (interpreter.button_dash_four_way(Enums.Numpad.N8, state[Enums.StKey.leftface])):
				state[Enums.StKey.cancelState] = "FlightUpwardAirdash"
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

	if (state[Enums.StKey.frame] >= endFrame-1):
		change_state.call("Flight")
	if (state[Enums.StKey.super_meter] <= 0):
		change_state.call("FlightNoFuel")
	

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Flight5C"
		elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "Flight5B"
		elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "Flight5A"

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	super.special_cancel(state,interpreter)
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.ADown, state[Enums.StKey.leftface]) or 
				interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.BDown, state[Enums.StKey.leftface]) or 
				interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "FlightExit"
		elif (interpreter.is_air_dashing_four_way(Enums.Numpad.N6, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "FlightForwardAirdash"
		elif (interpreter.is_air_dashing_four_way(Enums.Numpad.N4, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "FlightBackwardAirdash"
		elif (interpreter.is_air_dashing_four_way(Enums.Numpad.N2, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "FlightDownwardAirdash"
		elif (interpreter.is_air_dashing_four_way(Enums.Numpad.N8, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "FlightUpwardAirdash"

func meter_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (boost_OK(state, interpreter)):
			state[Enums.StKey.cancelState] = "AirBoostCancel"
		elif (assist_ok(state, interpreter) and state[Enums.StKey.cancelState] != "AirBoostCancel"):
			if (interpreter.is_low_blocking(state[Enums.StKey.leftface])):
				state[Enums.StKey.cancelState] = "AirAssistCall2"
			elif (level_1_OK(state) and super_assist_meter_ok(state)  and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.DDown, state[Enums.StKey.leftface])):
				state[Enums.StKey.cancelState] = "AirAssistCallSuper"
			else:
				state[Enums.StKey.cancelState] = "AirAssistCall"
	else:
		if (boost_OK(state, interpreter)):
			change_state.call("AirBoostCancel")


func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand):
		pass
	else:
		super.reaction(state, interpreter, event_cause)
