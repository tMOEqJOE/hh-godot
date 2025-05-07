extends AssistAirAttackState

class_name SoraSuperState

var voice = preload("res://game/assets/voice/sora/sor_heh2.wav")

func _init():
	endFrame = 120
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hit1PosX : 0, Enums.StKey.Hit1PosY : -11337728,
			Enums.StKey.Hit1ScaleX : 686985, Enums.StKey.Hit1ScaleY : 1074037,
			Enums.StKey.Summon : "meterDump",
			},
		5 : {
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
		6 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.hit_box_colliding_frame : 10, 
			Enums.StKey.Hit1PosX : 8060928, Enums.StKey.Hit1PosY : -12255232,
			Enums.StKey.Hit1ScaleX : 942229, Enums.StKey.Hit1ScaleY : -901102,
			Enums.StKey.burst_OK: false,
			Enums.StKey.meter_build: 0,
			Enums.StKey.min_damage:7,
			Enums.StKey.chip_damage:4,
			Enums.StKey.attack_damage: 40,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*25,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*25,
			Enums.StKey.hitstun: 25,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.block_dir_x : -SGFixed.ONE*45,
			Enums.StKey.block_dir_y : -SGFixed.ONE*10,
			Enums.StKey.counter_hit: Enums.AttackType.WallBouncer,
			Enums.StKey.counter_hitstun: 5,
			},
		119 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_x] = -SGFixed.ONE*80
	state[Enums.StKey.velocity_y] = -SGFixed.ONE*50
	state[Enums.StKey.drag_x] = Util.FRICTION
	state[Enums.StKey.accel_y] = 0
	anim.stop(true)
	anim.play("AssistSuper")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] >= 6 and state[Enums.StKey.frame] < 120):
		state[Enums.StKey.velocity_x] = SGFixed.ONE*30
		state[Enums.StKey.velocity_y] = SGFixed.ONE*25
	elif (state[Enums.StKey.frame] == 4):
		SyncManager.play_sound("SoraVoice", voice, {"bus": "Voice"})
		SyncManager.play_sound("SoraVoiceReverb", voice, {"bus": "ReverbVoice"})

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand):
		pass
#	elif (event_cause == Enums.Reaction.WallLand):
##		if (state[Enums.StKey.hitStopFrame] <= 0):
##			change_state.call("Dormant")
	else:
		super.reaction(state, interpreter, event_cause)
