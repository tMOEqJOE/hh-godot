extends AngelAirAttackState

class_name Angelj2CState

var voice = preload("res://game/assets/voice/subaru/sbr_Bread.wav")

func _init():
	endFrame = 15
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true, Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -4128768, Enums.StKey.Hurt1PosY : -10223617,
			Enums.StKey.Hurt1ScaleX : 257090, Enums.StKey.Hurt1ScaleY : 604574,
			Enums.StKey.Hurt2PosX : 1048575, Enums.StKey.Hurt2PosY : -18874368,
			Enums.StKey.Hurt2ScaleX : 401098, Enums.StKey.Hurt2ScaleY : -853100,
			Enums.StKey.Hurt3PosX : -65535, Enums.StKey.Hurt3PosY : -21757954,
			Enums.StKey.Hurt3ScaleX : 1090539, Enums.StKey.Hurt3ScaleY : -321771,
			},
		7 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.Hit1PosX : 12910592, Enums.StKey.Hit1PosY : -21889028,
			Enums.StKey.Hit1ScaleX : 855747, Enums.StKey.Hit1ScaleY : 582177,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -4128768, Enums.StKey.Hurt1PosY : -10223617,
			Enums.StKey.Hurt1ScaleX : 257090, Enums.StKey.Hurt1ScaleY : 604574,
			Enums.StKey.Hurt2PosX : 1048575, Enums.StKey.Hurt2PosY : -18874368,
			Enums.StKey.Hurt2ScaleX : 401098, Enums.StKey.Hurt2ScaleY : -853100,
			Enums.StKey.Hurt3PosX : -65535, Enums.StKey.Hurt3PosY : -21757954,
			Enums.StKey.Hurt3ScaleX : 1090539, Enums.StKey.Hurt3ScaleY : -321771,
			Enums.StKey.hitstun: 40,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.attack_damage: 40,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*35,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*42,
			Enums.StKey.min_damage:5,
			Enums.StKey.chip_damage:4,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_hitstun: 60,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*40,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*55,
			},
		14 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -4128768, Enums.StKey.Hurt1PosY : -10223617,
			Enums.StKey.Hurt1ScaleX : 257090, Enums.StKey.Hurt1ScaleY : 604574,
			Enums.StKey.Hurt2PosX : 1048575, Enums.StKey.Hurt2PosY : -18874368,
			Enums.StKey.Hurt2ScaleX : 401098, Enums.StKey.Hurt2ScaleY : -853100,
			Enums.StKey.Hurt3PosX : -65535, Enums.StKey.Hurt3PosY : -21757954,
			Enums.StKey.Hurt3ScaleX : 1090539, Enums.StKey.Hurt3ScaleY : -321771,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("Angelj2C")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 1):
		SyncManager.play_sound("SubaruVoice", voice, {"bus": "Voice"})


func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
