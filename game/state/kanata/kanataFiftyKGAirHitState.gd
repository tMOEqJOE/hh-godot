extends "res://game/state/kanata/mainstates/kanataAirAttackState.gd"

class_name KanataFiftyKGAirHitState

var CallSound = preload("res://game/assets/voice/kanata/amk_ Squish You.wav")

func _init():
	endFrame = 600
	
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
			Enums.StKey.launch_dir_x : -SGFixed.ONE*5,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*80,
			Enums.StKey.attack_damage: 0,
			Enums.StKey.min_damage: 0,
			Enums.StKey.hitstun : 100,
			Enums.StKey.hitstop : 4,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_hitstun: 60,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*5,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*80,
			},
		13 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			},
		20 : {
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
			Enums.StKey.counter_launch_dir_x: 0,
			Enums.StKey.counter_launch_dir_y: 0,
			Enums.StKey.hitstun : 150,
			Enums.StKey.hitstop: 0,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("KanataFiftyHit")
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.accel_y] = 0

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 18):
		state[Enums.StKey.velocity_x] = SGFixed.ONE*2
		state[Enums.StKey.velocity_y] = -SGFixed.ONE*200
		state[Enums.StKey.accel_y] = SGFixed.ONE*8
	elif (state[Enums.StKey.frame] == 30):
		SyncManager.play_sound("KanataVoice", CallSound, {"bus": "Voice"})

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	super.handle_input(state, interpreter)
	if (state[Enums.StKey.frame] > 20):
		if (state[Enums.StKey.velocity_x] > -SGFixed.ONE*10 and interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface])):
			state[Enums.StKey.accel_x] = -SGFixed.ONE*1
		elif (state[Enums.StKey.velocity_x] < SGFixed.ONE*20 and interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface])):
			state[Enums.StKey.accel_x] = SGFixed.ONE*1
		else:
			state[Enums.StKey.accel_x] = 0

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	# only kara cancel into followups before 51KG hits
	if (state[Enums.StKey.frame] == 17):
		if (interpreter.is_button_down(Enums.InputFlags.AHold)):
			change_state.call("JumpFall")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func meter_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand and state[Enums.StKey.frame] >= 13):
		state[Enums.StKey.doubleJump] = 1
		state[Enums.StKey.airDash] = 1
		state[Enums.StKey.leftfaceOK] = true
		change_state.call("KanataAirFiftyRekkaA")
	else:
		super.reaction(state, interpreter, event_cause)
