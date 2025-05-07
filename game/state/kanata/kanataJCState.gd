extends "res://game/state/kanata/mainstates/kanataAirAttackState.gd"

class_name KanatajCState

var voice = preload("res://game/assets/voice/kanata/amk_ZUOH.wav")

func _init():
	endFrame = 45
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 2359296, Enums.StKey.Hurt1PosY : -18415614,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : 655360, Enums.StKey.Hurt2PosY : -27983872,
			Enums.StKey.Hurt2ScaleX : 809242, Enums.StKey.Hurt2ScaleY : 718928,
			},
		8 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 13565952, Enums.StKey.Hit1PosY : -22347776,
			Enums.StKey.Hit1ScaleX : 864907, Enums.StKey.Hit1ScaleY : 2057292,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 9502720, Enums.StKey.Hurt1PosY : -32702464,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : -6029312, Enums.StKey.Hurt2PosY : -19857408,
			Enums.StKey.Hurt2ScaleX : 809242, Enums.StKey.Hurt2ScaleY : 718928,
			Enums.StKey.Hurt3PosX : 10354688, Enums.StKey.Hurt3PosY : -14876672,
			Enums.StKey.Hurt3ScaleX : 966438, Enums.StKey.Hurt3ScaleY : 1415276,
			Enums.StKey.guard: Enums.GuardType.Mid,
			Enums.StKey.attack_damage: 75,
			Enums.StKey.counter_hitstun: 30,
			Enums.StKey.hitstun: 35,
			Enums.StKey.hitstop : 10,
			Enums.StKey.block_dir_x : -SGFixed.ONE*5,
			Enums.StKey.block_dir_y : SGFixed.ONE*5,
			Enums.StKey.attack_type : Enums.AttackType.GroundBouncer,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*10,
			Enums.StKey.launch_dir_y : SGFixed.ONE*50,
			Enums.StKey.min_damage:5,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*10,
			Enums.StKey.counter_launch_dir_y: SGFixed.ONE*50,
			},
		14 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 3211264, Enums.StKey.Hurt1PosY : -17170432,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : -4521984, Enums.StKey.Hurt2PosY : -13762562,
			Enums.StKey.Hurt2ScaleX : 809242, Enums.StKey.Hurt2ScaleY : 718928,
			Enums.StKey.Hurt3PosX : 12648447, Enums.StKey.Hurt3PosY : -11993092,
			Enums.StKey.Hurt3ScaleX : 1060306, Enums.StKey.Hurt3ScaleY : 671768,
			},
		28 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 2359296, Enums.StKey.Hurt1PosY : -18415614,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : 655360, Enums.StKey.Hurt2PosY : -27983872,
			Enums.StKey.Hurt2ScaleX : 809242, Enums.StKey.Hurt2ScaleY : 718928,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("jC")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 6):
		SyncManager.play_sound("KanataVoice", voice, {"bus": "Voice"})
	elif (state[Enums.StKey.frame] == 9):
		state[Enums.StKey.velocity_y] = -SGFixed.ONE*20

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	super.handle_input(state, interpreter)
	if (state[Enums.StKey.velocity_x] > -SGFixed.ONE*10 and interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface])):
		state[Enums.StKey.accel_x] = -SGFixed.ONE*2
	elif (state[Enums.StKey.velocity_x] < SGFixed.ONE*10 and interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface])):
		state[Enums.StKey.accel_x] = SGFixed.ONE*2
	else:
		state[Enums.StKey.accel_x] = 0


func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
#		if (state[Enums.StKey.airDash] > 0 and interpreter.is_air_dashing(true, state[Enums.StKey.leftface])):
#			state[Enums.StKey.cancelState] = "ForwardAirDash"
#		elif (state[Enums.StKey.airDash] > 0 and interpreter.is_air_dashing(false, state[Enums.StKey.leftface])):
#			state[Enums.StKey.cancelState] = "BackwardAirDash"
		if ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Jump2C"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface])
				and interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Jump6C"
