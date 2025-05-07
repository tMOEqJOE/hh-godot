extends "res://game/state/kanata/mainstates/kanataAirAttackState.gd"

class_name Kanataj6CState

var voice = preload("res://game/assets/voice/kanata/amk_Ei!.wav")

func _init():
	endFrame = 35
	
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
			Enums.StKey.Hit1PosX : 5377342, Enums.StKey.Hit1PosY : -24920640,
			Enums.StKey.Hit1ScaleX : 1315584, Enums.StKey.Hit1ScaleY : 572323,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 2359296, Enums.StKey.Hurt1PosY : -18415614,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : 655360, Enums.StKey.Hurt2PosY : -27983872,
			Enums.StKey.Hurt2ScaleX : 809242, Enums.StKey.Hurt2ScaleY : 718928,
			Enums.StKey.guard: Enums.GuardType.Mid,
			Enums.StKey.attack_damage: 90,
			Enums.StKey.min_damage: 12,
			Enums.StKey.counter_hitstun: 30,
			#Enums.StKey.hitstun: 30,
			Enums.StKey.hitstop : 10,
#			Enums.StKey.block_dir_x : -SGFixed.ONE*5,
#			Enums.StKey.block_dir_y : SGFixed.ONE*5,
			Enums.StKey.attack_type : Enums.AttackType.WallBouncer,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*25,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*40,
			Enums.StKey.counter_hit: Enums.AttackType.WallBouncer,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*10,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*40,
			},
		15 : {
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
	state[Enums.StKey.accel_y] = 95536
	anim.play("j6C")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 1):
		SyncManager.play_sound("SubaruVoice", voice, {"bus": "Voice"})

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		pass

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand):
		if (state[Enums.StKey.hitStopFrame] <= 0):
			state[Enums.StKey.doubleJump] = 1
			state[Enums.StKey.airDash] = 1
			change_state.call("LandingRecovery")
	else:
		super.reaction(state, interpreter, event_cause)
