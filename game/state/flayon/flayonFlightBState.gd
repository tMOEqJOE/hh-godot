extends FlayonAirAttackState

class_name FlayonFlightBState

func _init():
	endFrame = 22
	
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
		7 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit1PosX : 1629186, Enums.StKey.Hit1PosY : -20760254,
			Enums.StKey.Hit1ScaleX : 1326496, Enums.StKey.Hit1ScaleY : 1026496,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit2PosX : 1629186, Enums.StKey.Hit2PosY : -20760254,
			Enums.StKey.Hit2ScaleX : 1026496, Enums.StKey.Hit2ScaleY : 1326496,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -16471104,
			Enums.StKey.Hurt1ScaleX : 1535050, Enums.StKey.Hurt1ScaleY : 1036934,
			Enums.StKey.Hurt2PosX : 12976128, Enums.StKey.Hurt2PosY : -20774912,
			Enums.StKey.Hurt2ScaleX : 1535050, Enums.StKey.Hurt2ScaleY : 643629,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.attack_damage: 45,
			Enums.StKey.min_damage: 4,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.hitstun: 25,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*5,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*45,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 20,
			Enums.StKey.counter_launch_dir_x: 0,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*45,
			},
		16 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -4849664, Enums.StKey.Hurt1PosY : -12058623,
			Enums.StKey.Hurt1ScaleX : 536711, Enums.StKey.Hurt1ScaleY : 244563,
			Enums.StKey.Hurt2PosX : 1310719, Enums.StKey.Hurt2PosY : -19660802,
			Enums.StKey.Hurt2ScaleX : 924253, Enums.StKey.Hurt2ScaleY : -367041,
			Enums.StKey.Hurt3PosX : 5439488, Enums.StKey.Hurt3PosY : -12976129,
			Enums.StKey.Hurt3ScaleX : 1090539, Enums.StKey.Hurt3ScaleY : 321771,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("FlightB")
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
