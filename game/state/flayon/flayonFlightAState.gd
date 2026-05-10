extends FlayonAirAttackState

class_name FlayonFlightAState

func _init():
	endFrame = 12
	
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
			Enums.StKey.attack_damage: 25,
			Enums.StKey.min_damage: 4,
			Enums.StKey.hitstop: 8,
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
	state[Enums.StKey.accel_y] = 0
	state[Enums.StKey.accel_x] = 0
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.velocity_x] = 0

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	state[Enums.StKey.super_meter] -= Util.FLIGHT_FAST_METER_DRAIN

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	super.handle_input(state, interpreter)
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

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand):
		pass
	else:
		super.reaction(state, interpreter, event_cause)
