extends AssistAirAttackState

class_name HakkaAirSuperCharge3

var CallSound = preload("res://game/assets/voice/hakka/bzn_MetalScream1.wav")

func _init():
	endFrame = 200
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hit1PosX : 0, Enums.StKey.Hit1PosY : -11337728,
			Enums.StKey.Hit1ScaleX : 686985, Enums.StKey.Hit1ScaleY : 1074037,
			},
		6 : {
			Enums.StKey.Summon : "superFlash",
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit1PosX : 0, Enums.StKey.Hit1PosY : 0,
			Enums.StKey.Hit1ScaleX : 18338272, Enums.StKey.Hit1ScaleY : 18338272,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.hitstop: 0,
			Enums.StKey.meter_build: 0,
			Enums.StKey.attack_type : Enums.AttackType.BurstLock,
			Enums.StKey.counter_hit : Enums.AttackType.BurstLock,
			},
		12 : { 
			Enums.StKey.Hit1Disable : false, Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hit1PosX: -2555904, Enums.StKey.Hit1PosY : -16515072,
			Enums.StKey.Hit1ScaleX : 3386729, Enums.StKey.Hit1ScaleY : 832895,
			Enums.StKey.hit_box_colliding_frame : 1,
			Enums.StKey.burst_OK: false,
			Enums.StKey.attack_type : Enums.AttackType.WallBouncer,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*50,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*40,
			Enums.StKey.hitstun : 80,
			Enums.StKey.attack_damage:100,
			Enums.StKey.min_damage:30,
			Enums.StKey.chip_damage:15,
			Enums.StKey.hitstop: 20,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.counter_hit: Enums.AttackType.WallBouncer,
			Enums.StKey.counter_hitstun: 100,
			Enums.StKey.meter_build: 0,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*90,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*70,
			},
		15 : { 
			Enums.StKey.Hit1Disable : false, Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hit1PosX: -2555904, Enums.StKey.Hit1PosY : -16515072,
			Enums.StKey.Hit1ScaleX : 3386729, Enums.StKey.Hit1ScaleY : 832895,
			Enums.StKey.hit_box_colliding_frame : 1,
			Enums.StKey.burst_OK: false,
			Enums.StKey.attack_type : Enums.AttackType.WallBouncer,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*50,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*40,
			Enums.StKey.hitstun : 80,
			Enums.StKey.attack_damage:40,
			Enums.StKey.min_damage: 5,
			Enums.StKey.chip_damage: 5,
			Enums.StKey.hitstop: 1,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.counter_hit: Enums.AttackType.WallBouncer,
			Enums.StKey.counter_hitstun: 100,
			Enums.StKey.meter_build: 0,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*90,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*70,
			},
		16 : { 
			Enums.StKey.Hit1Disable : false, Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hit1PosX: -2555904, Enums.StKey.Hit1PosY : -16515072,
			Enums.StKey.Hit1ScaleX : 3386729, Enums.StKey.Hit1ScaleY : 832895,
			Enums.StKey.hit_box_colliding_frame : 1,
			Enums.StKey.burst_OK: false,
			Enums.StKey.attack_type : Enums.AttackType.WallBouncer,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*50,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*40,
			Enums.StKey.hitstun : 80,
			Enums.StKey.attack_damage:80,
			Enums.StKey.min_damage: 10,
			Enums.StKey.chip_damage: 10,
			Enums.StKey.hitstop: 1,
			Enums.StKey.guard: Enums.GuardType.Low,
			Enums.StKey.counter_hit: Enums.AttackType.WallBouncer,
			Enums.StKey.counter_hitstun: 100,
			Enums.StKey.meter_build: 0,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*90,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*70,
			},
		17 : { 
			Enums.StKey.Hit1Disable : false, Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hit1PosX: -2555904, Enums.StKey.Hit1PosY : -16515072,
			Enums.StKey.Hit1ScaleX : 3386729, Enums.StKey.Hit1ScaleY : 832895,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.burst_OK: false,
			Enums.StKey.attack_type : Enums.AttackType.WallBouncer,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*120,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*120,
			Enums.StKey.hitstun : 300,
			Enums.StKey.attack_damage:100,
			Enums.StKey.min_damage: 20,
			Enums.StKey.chip_damage: 20,
			Enums.StKey.hitstop: 20,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.counter_hit: Enums.AttackType.WallBouncer,
			Enums.StKey.counter_hitstun: 100,
			Enums.StKey.meter_build: 0,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*120,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*150,
			},
		30 : { 
			Enums.StKey.Hit1Disable : false, Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hit1PosX: 0, Enums.StKey.Hit1PosY : -16515072,
			Enums.StKey.Hit1ScaleX : 686729, Enums.StKey.Hit1ScaleY : 832895,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.burst_OK: false,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*30,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*40,
			Enums.StKey.attack_damage: 20,
			Enums.StKey.min_damage: 2,
			Enums.StKey.chip_damage: 0,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 100,
			Enums.StKey.meter_build: 0,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*10,
			Enums.StKey.counter_launch_dir_y: SGFixed.ONE*70,
			},
	}


# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.leftfaceOK] = false
	state[Enums.StKey.drag_x] = Util.FRICTION
	state[Enums.StKey.accel_y] = 0
	anim.stop(true)
	anim.play("AssistSuperFollowup")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] >= 7 and state[Enums.StKey.frame] < 25):
		state[Enums.StKey.velocity_x] = SGFixed.ONE*100
	elif (state[Enums.StKey.frame] == 6):
		SyncManager.play_sound("HakkaVoice", CallSound, {"bus": "Voice"})
		SyncManager.play_sound("HakkaVoiceReverb", CallSound, {"bus": "ReverbVoice"})
	elif (state[Enums.StKey.frame] == 25):
		state[Enums.StKey.accel_y] = Util.GRAVITY

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand):
		if (state[Enums.StKey.hitStopFrame] <= 0):
			change_state.call("Knockdown")
	elif (event_cause == Enums.Reaction.StrikeHurt):
		state[Enums.StKey.hitStopFrame] = 20
		state[Enums.StKey.velocity_y] = 0
	elif (event_cause == Enums.Reaction.LaunchHurt):
		state[Enums.StKey.hitStopFrame] = 20
		state[Enums.StKey.velocity_y] = 0
	else:
		super.reaction(state, interpreter, event_cause)
