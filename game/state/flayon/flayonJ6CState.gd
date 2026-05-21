extends FlayonAirAttackState

class_name Flayonj6CState

var voice = preload("res://game/assets/voice/flayon/mxf_grunt.wav")

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
		11 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.Hit2PosX : 8007743, Enums.StKey.Hit2PosY : -14468802,
			Enums.StKey.Hit2ScaleX : 1562388, Enums.StKey.Hit2ScaleY : 722388, #572388 #264530
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 2883584, Enums.StKey.Hurt1PosY : -20185088,
			Enums.StKey.Hurt1ScaleX : 339834, Enums.StKey.Hurt1ScaleY : 629832,
			Enums.StKey.Hurt2PosX : 3407872, Enums.StKey.Hurt2PosY : -11075586,
			Enums.StKey.Hurt2ScaleX : 548413, Enums.StKey.Hurt2ScaleY : 906915,
			Enums.StKey.Hurt3PosX : 3473407, Enums.StKey.Hurt3PosY : -4063231,
			Enums.StKey.Hurt3ScaleX : 1171400, Enums.StKey.Hurt3ScaleY : 464723,
			Enums.StKey.hitstun : 23,
			Enums.StKey.attack_damage: 40,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*25,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*55,
			Enums.StKey.hitstop: 10,
			Enums.StKey.min_damage:6,
			Enums.StKey.chip_damage:3,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_hitstun: 20,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*25,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*55,
			},
		15 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 2293760, Enums.StKey.Hurt1PosY : -16973826,
			Enums.StKey.Hurt1ScaleX : 339834, Enums.StKey.Hurt1ScaleY : 629832,
			Enums.StKey.Hurt2PosX : 3407872, Enums.StKey.Hurt2PosY : -11075586,
			Enums.StKey.Hurt2ScaleX : 548413, Enums.StKey.Hurt2ScaleY : 906915,
			Enums.StKey.Hurt3PosX : 6094848, Enums.StKey.Hurt3PosY : -4784128,
			Enums.StKey.Hurt3ScaleX : 1171400, Enums.StKey.Hurt3ScaleY : 464723,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("j6C")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 2):
		state[Enums.StKey.velocity_x] = Util.fixed_max(SGFixed.ONE*25, state[Enums.StKey.velocity_x])
		state[Enums.StKey.accel_y] = 0
		state[Enums.StKey.velocity_y] = -SGFixed.ONE*2
		SyncManager.play_sound("FlayonVoice", voice, {"bus": "Voice"})
	elif (state[Enums.StKey.frame] == 10):
		state[Enums.StKey.velocity_x] = SGFixed.mul(state[Enums.StKey.velocity_x], 30000)
		state[Enums.StKey.accel_y] = Util.GRAVITY
		state[Enums.StKey.velocity_y] = -SGFixed.ONE*20

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
	
