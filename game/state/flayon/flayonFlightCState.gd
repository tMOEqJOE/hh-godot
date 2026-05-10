extends FlayonAirAttackState

class_name FlayonFlightCState

func _init():
	endFrame = 30
	
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
		8 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 14629186, Enums.StKey.Hit1PosY : -18760254,
			Enums.StKey.Hit1ScaleX : 1426496, Enums.StKey.Hit1ScaleY : 850290,
			Enums.StKey.Hit2PosX : 12155775, Enums.StKey.Hit2PosY : -17468801,
			Enums.StKey.Hit2ScaleX : 997940, Enums.StKey.Hit2ScaleY : 947094,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -16471104,
			Enums.StKey.Hurt1ScaleX : 1535050, Enums.StKey.Hurt1ScaleY : 1036934,
			Enums.StKey.Hurt2PosX : 12976128, Enums.StKey.Hurt2PosY : -20774912,
			Enums.StKey.Hurt2ScaleX : 1535050, Enums.StKey.Hurt2ScaleY : 643629,
			Enums.StKey.attack_damage: 39,
			Enums.StKey.min_damage: 8,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.attack_type : Enums.AttackType.WallBouncer,
			Enums.StKey.hitstun: Util.DEFAULT_HITSTUN + 13,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*25,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*35,
			Enums.StKey.counter_hit: Enums.AttackType.WallBouncer,
			Enums.StKey.counter_hitstun: 30,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*15,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*45,
			},
		11 : {
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
	anim.play("FlightC")
	state[Enums.StKey.drag_x] = Util.FRICTION
	state[Enums.StKey.kara_OK] = true
	state[Enums.StKey.accel_y] = 0
	state[Enums.StKey.accel_x] = 0
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.velocity_x] = 0

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	state[Enums.StKey.super_meter] -= Util.FLIGHT_FAST_METER_DRAIN

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == 0):
		if (state[Enums.StKey.kara_OK]):
			# Kara Cancel section
			if (boost_OK(state, interpreter)):
				change_state.call("AirBoostCancel")
			elif (interpreter.is_button_dashing(Enums.Numpad.N6, state[Enums.StKey.leftface])):
				state[Enums.StKey.cancelState] = "FlightForwardAirdash"
			elif (interpreter.is_button_dashing(Enums.Numpad.N4, state[Enums.StKey.leftface])):
				state[Enums.StKey.cancelState] = "FlightBackwardAirdash"
			elif (interpreter.is_button_dashing(Enums.Numpad.N2, state[Enums.StKey.leftface])):
				state[Enums.StKey.cancelState] = "FlightDownwardAirdash"
			elif (interpreter.is_button_dashing(Enums.Numpad.N8, state[Enums.StKey.leftface])):
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
		if (interpreter.is_button_down(Enums.InputFlags.BDown)):
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


func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand):
		pass
	else:
		super.reaction(state, interpreter, event_cause)
