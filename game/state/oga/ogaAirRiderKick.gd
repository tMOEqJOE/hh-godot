extends OgaAirAttackState

class_name OgajAirRiderKickState

func _init():
	endFrame = 100
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 11206656, Enums.StKey.Hurt1PosY : -23920636,
			Enums.StKey.Hurt1ScaleX : 1475853, Enums.StKey.Hurt1ScaleY : 525360,
			Enums.StKey.Hurt2PosX : -2293760, Enums.StKey.Hurt2PosY : -23068672,
			Enums.StKey.Hurt2ScaleX : 841985, Enums.StKey.Hurt2ScaleY : -836808,
			Enums.StKey.Hurt3PosX : -7602173, Enums.StKey.Hurt3PosY : -10682367,
			Enums.StKey.Hurt3ScaleX : 838252, Enums.StKey.Hurt3ScaleY : 402529,
			},
		20 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -6815744, Enums.StKey.Hurt1PosY : -30539778,
			Enums.StKey.Hurt1ScaleX : 1324678, Enums.StKey.Hurt1ScaleY : -605995,
			Enums.StKey.Hurt2PosX : 3276800, Enums.StKey.Hurt2PosY : -14090241,
			Enums.StKey.Hurt2ScaleX : 1866963, Enums.StKey.Hurt2ScaleY : -437487,
			Enums.StKey.Hurt3PosX : 1703936, Enums.StKey.Hurt3PosY : -20971522,
			Enums.StKey.Hurt3ScaleX : 1687735, Enums.StKey.Hurt3ScaleY : -405641,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 5963777, Enums.StKey.Hit1PosY : -12189696,
			Enums.StKey.Hit1ScaleX : 1802455, Enums.StKey.Hit1ScaleY : 621218,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*20,
			Enums.StKey.launch_dir_y : SGFixed.ONE*75,
			Enums.StKey.attack_type : Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_launch_dir_x : -SGFixed.ONE*20,
			Enums.StKey.counter_launch_dir_y : SGFixed.ONE*95,
			Enums.StKey.hitstun: 30,
			Enums.StKey.hitstop: 10,
			Enums.StKey.counter_hitstun: 30,
			Enums.StKey.attack_damage: 35,
			Enums.StKey.min_damage: 4,
		},
		80 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 11206656, Enums.StKey.Hurt1PosY : -23920636,
			Enums.StKey.Hurt1ScaleX : 1475853, Enums.StKey.Hurt1ScaleY : 525360,
			Enums.StKey.Hurt2PosX : -2293760, Enums.StKey.Hurt2PosY : -23068672,
			Enums.StKey.Hurt2ScaleX : 841985, Enums.StKey.Hurt2ScaleY : -836808,
			Enums.StKey.Hurt3PosX : -7602173, Enums.StKey.Hurt3PosY : -10682367,
			Enums.StKey.Hurt3ScaleX : 838252, Enums.StKey.Hurt3ScaleY : 402529,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.super_meter] += SGFixed.ONE*200
	anim.play("5C")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 1):
		state[Enums.StKey.velocity_x] = Util.fixed_max(SGFixed.ONE * 15, state[Enums.StKey.velocity_x])
		state[Enums.StKey.velocity_y] = -SGFixed.ONE * 50

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.ADown, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "AirTurnKickLight"
		elif (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.BDown, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "AirTurnKick"
		elif (interpreter.special_input_button(Enums.SpecialInput.M214, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "AirTurnKickHeavy"
		elif (interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.CDown, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "AirRiderKickHeavy"
