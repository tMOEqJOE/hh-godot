extends SubaruAirAttackState

class_name Subaruj6CState

var voice = preload("res://game/assets/voice/subaru/sbr_hayaku koi.wav")

func _init():
	endFrame = 60
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -8912897, Enums.StKey.Hurt1PosY : -5570560,
			Enums.StKey.Hurt1ScaleX : 339834, Enums.StKey.Hurt1ScaleY : 629832,
			Enums.StKey.Hurt2PosX : -9633792, Enums.StKey.Hurt2PosY : -19857408,
			Enums.StKey.Hurt2ScaleX : 548413, Enums.StKey.Hurt2ScaleY : -906915,
			Enums.StKey.Hurt3PosX : -3080192, Enums.StKey.Hurt3PosY : -24772608,
			Enums.StKey.Hurt3ScaleX : 484460, Enums.StKey.Hurt3ScaleY : -464723,
			},
		5 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 2883584, Enums.StKey.Hurt1PosY : -20185088,
			Enums.StKey.Hurt1ScaleX : 339834, Enums.StKey.Hurt1ScaleY : 629832,
			Enums.StKey.Hurt2PosX : 3407872, Enums.StKey.Hurt2PosY : -11075586,
			Enums.StKey.Hurt2ScaleX : 548413, Enums.StKey.Hurt2ScaleY : -906915,
			Enums.StKey.Hurt3PosX : 3473407, Enums.StKey.Hurt3PosY : -4063231,
			Enums.StKey.Hurt3ScaleX : 1171400, Enums.StKey.Hurt3ScaleY : -464723,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.Hit2PosX : 6225919, Enums.StKey.Hit2PosY : -11141120,
			Enums.StKey.Hit2ScaleX : 583304, Enums.StKey.Hit2ScaleY : 652648,
			Enums.StKey.attack_damage: 30,
			Enums.StKey.min_damage:6,
			Enums.StKey.chip_damage:4,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_hitstun: 10,
			},
		7 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit2PosX : 15007743, Enums.StKey.Hit2PosY : -11468802,
			Enums.StKey.Hit2ScaleX : 572388, Enums.StKey.Hit2ScaleY : 264530,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 2883584, Enums.StKey.Hurt1PosY : -20185088,
			Enums.StKey.Hurt1ScaleX : 339834, Enums.StKey.Hurt1ScaleY : 629832,
			Enums.StKey.Hurt2PosX : 3407872, Enums.StKey.Hurt2PosY : -11075586,
			Enums.StKey.Hurt2ScaleX : 548413, Enums.StKey.Hurt2ScaleY : -906915,
			Enums.StKey.Hurt3PosX : 3473407, Enums.StKey.Hurt3PosY : -4063231,
			Enums.StKey.Hurt3ScaleX : 1171400, Enums.StKey.Hurt3ScaleY : -464723,
			Enums.StKey.hitstun : 120,
			Enums.StKey.attack_damage: 90,
			Enums.StKey.attack_type : Enums.AttackType.WallBouncer,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*60,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*90,
			Enums.StKey.hitstop: 15,
			Enums.StKey.min_damage:25,
			Enums.StKey.chip_damage:15,
			Enums.StKey.counter_hit: Enums.AttackType.WallBouncer,
			Enums.StKey.counter_hitstun: 200,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*60,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*70,
			},
		8 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit2PosX : 15400964, Enums.StKey.Hit2PosY : -13238273,
			Enums.StKey.Hit2ScaleX : 2085443, Enums.StKey.Hit2ScaleY : -620408,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 2293760, Enums.StKey.Hurt1PosY : -16973826,
			Enums.StKey.Hurt1ScaleX : 339834, Enums.StKey.Hurt1ScaleY : 629832,
			Enums.StKey.Hurt2PosX : 3407872, Enums.StKey.Hurt2PosY : -11075586,
			Enums.StKey.Hurt2ScaleX : 548413, Enums.StKey.Hurt2ScaleY : -906915,
			Enums.StKey.Hurt3PosX : 6094848, Enums.StKey.Hurt3PosY : -4784128,
			Enums.StKey.Hurt3ScaleX : 1171400, Enums.StKey.Hurt3ScaleY : -464723,
			Enums.StKey.attack_damage: 20,
			Enums.StKey.min_damage:2,
			Enums.StKey.chip_damage:3,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_hitstun: 10,
			},
		10 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 2293760, Enums.StKey.Hurt1PosY : -16973826,
			Enums.StKey.Hurt1ScaleX : 339834, Enums.StKey.Hurt1ScaleY : 629832,
			Enums.StKey.Hurt2PosX : 3407872, Enums.StKey.Hurt2PosY : -11075586,
			Enums.StKey.Hurt2ScaleX : 548413, Enums.StKey.Hurt2ScaleY : -906915,
			Enums.StKey.Hurt3PosX : 6094848, Enums.StKey.Hurt3PosY : -4784128,
			Enums.StKey.Hurt3ScaleX : 1171400, Enums.StKey.Hurt3ScaleY : -464723,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("j6C")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 2):
		SyncManager.play_sound("SubaruVoice", voice, {"bus": "Voice"})

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand):
		if (state[Enums.StKey.hitStopFrame] <= 0):
			state[Enums.StKey.doubleJump] = 1
			state[Enums.StKey.airDash] = 1
			change_state.call("LandingRecovery")
	else:
		super.reaction(state, interpreter, event_cause)
