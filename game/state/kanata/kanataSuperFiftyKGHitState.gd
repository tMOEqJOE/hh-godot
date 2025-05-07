extends "res://game/state/kanata/mainstates/kanataAirAttackState.gd"

class_name KanataSuperFiftyKGHitState

var CallSound = preload("res://game/assets/voice/kanata/amk_KANATAAAAAAAAAAA.wav")

func _init():
	endFrame = 400
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			},
		10 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.Hit1PosX : 2359296, Enums.StKey.Hit1PosY : -12976128,
			Enums.StKey.Hit1ScaleX : 2503512, Enums.StKey.Hit1ScaleY : 2516269,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.burst_OK: false,
			Enums.StKey.launch_dir_x : 0,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*80,
			Enums.StKey.attack_damage: 0,
			Enums.StKey.min_damage: 0,
			Enums.StKey.meter_build : 0,
			Enums.StKey.hitstun : 300,
			Enums.StKey.hitstop : 2,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_hitstun: 60,
			Enums.StKey.counter_launch_dir_x: 0,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*80,
			},
		15 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			},
		22 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 2359296, Enums.StKey.Hit1PosY : -12976128,
			Enums.StKey.Hit1ScaleX : 2503512, Enums.StKey.Hit1ScaleY : 2516269,
			Enums.StKey.attack_type : Enums.AttackType.AirThrow,
			Enums.StKey.counter_hit: Enums.AttackType.AirThrow,
			Enums.StKey.burst_OK: false,
			Enums.StKey.launch_dir_x : 0,
			Enums.StKey.launch_dir_y : 0,
			Enums.StKey.meter_build : 0,
			Enums.StKey.counter_launch_dir_x: 0,
			Enums.StKey.counter_launch_dir_y: 0,
			Enums.StKey.hitstun : 300,
			Enums.StKey.hitstop: 0,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.accel_y] = 0
	anim.play("KanataFiftyHit")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] >= 30 and state[Enums.StKey.frame] <= 60):
		state[Enums.StKey.velocity_x] = 0
		state[Enums.StKey.velocity_y] = -SGFixed.ONE*300
		state[Enums.StKey.accel_y] = SGFixed.ONE*12
	elif (state[Enums.StKey.frame] == 62):
		SyncManager.play_sound("KanataVoice", CallSound, {"bus": "Voice"})
		SyncManager.play_sound("KanataVoiceReverb", CallSound, {"bus": "ReverbVoice"})
	elif (state[Enums.StKey.frame] >= 60 and state[Enums.StKey.frame] <= 79):
		state[Enums.StKey.velocity_y] = 0
	elif (state[Enums.StKey.frame] == 80):
		state[Enums.StKey.velocity_y] = SGFixed.ONE*300
		state[Enums.StKey.accel_y] = SGFixed.ONE*35
	
func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	super.handle_input(state, interpreter)
	if (state[Enums.StKey.frame] > 30):
		if (state[Enums.StKey.velocity_x] > -SGFixed.ONE*20 and interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface])):
			state[Enums.StKey.accel_x] = -SGFixed.ONE*1
		elif (state[Enums.StKey.velocity_x] < SGFixed.ONE*35 and interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface])):
			state[Enums.StKey.accel_x] = SGFixed.ONE*1
		else:
			state[Enums.StKey.accel_x] = 0


func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func meter_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand):
		state[Enums.StKey.doubleJump] = 1
		state[Enums.StKey.airDash] = 1
		state[Enums.StKey.leftfaceOK] = true
		change_state.call("KanataSuperFiftyRekkaA")
	else:
		super.reaction(state, interpreter, event_cause)

func combo_pushback(comboTime: int) -> int:
	return 0
