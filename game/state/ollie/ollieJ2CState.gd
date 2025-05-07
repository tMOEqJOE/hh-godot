extends "res://game/state/ollie/mainstates/ollieAirAttackState.gd"

class_name Olliej2CState

var voice = preload("res://game/assets/voice/ollie/oll_GILA (crazy).wav")

func _init():
	endFrame = 40
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true, Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 14483456, Enums.StKey.Hurt1PosY : -14352384,
			Enums.StKey.Hurt1ScaleX : 1267979, Enums.StKey.Hurt1ScaleY : -348575,
			Enums.StKey.Hurt2PosX : 1048575, Enums.StKey.Hurt2PosY : -18874368,
			Enums.StKey.Hurt2ScaleX : 401098, Enums.StKey.Hurt2ScaleY : -853100,
			Enums.StKey.Hurt3PosX : -65535, Enums.StKey.Hurt3PosY : -21757954,
			Enums.StKey.Hurt3ScaleX : 1090539, Enums.StKey.Hurt3ScaleY : -321771,
			},
		7 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.hit_box_colliding_frame : 3,
			Enums.StKey.Hit1PosX : 19774910, Enums.StKey.Hit1PosY : -15794177,
			Enums.StKey.Hit1ScaleX : 1195742, Enums.StKey.Hit1ScaleY : 475488,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 14483456, Enums.StKey.Hurt1PosY : -14352384,
			Enums.StKey.Hurt1ScaleX : 1267979, Enums.StKey.Hurt1ScaleY : -348575,
			Enums.StKey.Hurt2PosX : 1048575, Enums.StKey.Hurt2PosY : -18874368,
			Enums.StKey.Hurt2ScaleX : 401098, Enums.StKey.Hurt2ScaleY : -853100,
			Enums.StKey.Hurt3PosX : -65535, Enums.StKey.Hurt3PosY : -21757954,
			Enums.StKey.Hurt3ScaleX : 1090539, Enums.StKey.Hurt3ScaleY : -321771,
			Enums.StKey.hitstun: 22,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.guard: Enums.GuardType.Mid,
			Enums.StKey.attack_damage: 35,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*30,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*40,
			Enums.StKey.meter_build: SGFixed.ONE*400,
			Enums.StKey.min_damage:2,
			Enums.StKey.chip_damage:1,
			Enums.StKey.counter_hit: Enums.AttackType.Strike,
#			Enums.StKey.counter_hitstun: 60,
#			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*40,
#			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*20,
			},
		35 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 14483456, Enums.StKey.Hurt1PosY : -14352384,
			Enums.StKey.Hurt1ScaleX : 1267979, Enums.StKey.Hurt1ScaleY : -348575,
			Enums.StKey.Hurt2PosX : 1048575, Enums.StKey.Hurt2PosY : -18874368,
			Enums.StKey.Hurt2ScaleX : 401098, Enums.StKey.Hurt2ScaleY : -853100,
			Enums.StKey.Hurt3PosX : -65535, Enums.StKey.Hurt3PosY : -21757954,
			Enums.StKey.Hurt3ScaleX : 1090539, Enums.StKey.Hurt3ScaleY : -321771,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("j2C")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 0):
		state[Enums.StKey.velocity_x] = -SGFixed.ONE*5
		state[Enums.StKey.velocity_y] = -SGFixed.ONE*15
#	elif (state[Enums.StKey.frame] == ):
		SyncManager.play_sound("OllieVoice", voice, {"bus": "Voice"})
	elif (state[Enums.StKey.frame] == 10):
		state[Enums.StKey.velocity_x] = SGFixed.ONE*20
		state[Enums.StKey.velocity_y] = SGFixed.ONE*30
		state[Enums.StKey.accel_y] = -SGFixed.ONE*2
	if (state[Enums.StKey.frame] == 30):
		state[Enums.StKey.accel_y] = Util.GRAVITY


func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
