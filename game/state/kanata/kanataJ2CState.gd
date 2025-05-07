extends "res://game/state/kanata/mainstates/kanataAirAttackState.gd"

class_name Kanataj2CState

var voice = preload("res://game/assets/voice/kanata/amk_Ei!.wav")

func _init():
	endFrame = 91
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true, Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 3604480, Enums.StKey.Hurt1PosY : -18743296,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : 9568256, Enums.StKey.Hurt2PosY : -27328514,
			Enums.StKey.Hurt2ScaleX : 809242, Enums.StKey.Hurt2ScaleY : 718928,
			Enums.StKey.Hurt3PosX : -2686974, Enums.StKey.Hurt3PosY : -15597570,
			Enums.StKey.Hurt3ScaleX : 1097339, Enums.StKey.Hurt3ScaleY : 589522,
			},
		7 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.Hit1PosX : 655360, Enums.StKey.Hit1PosY : -14614529,
			Enums.StKey.Hit1ScaleX : 1663367, Enums.StKey.Hit1ScaleY : 535591,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 3604480, Enums.StKey.Hurt1PosY : -18743296,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : 9568256, Enums.StKey.Hurt2PosY : -27328514,
			Enums.StKey.Hurt2ScaleX : 809242, Enums.StKey.Hurt2ScaleY : 718928,
			Enums.StKey.Hurt3PosX : -2686974, Enums.StKey.Hurt3PosY : -15597570,
			Enums.StKey.Hurt3ScaleX : 1097339, Enums.StKey.Hurt3ScaleY : 589522,
			Enums.StKey.hitstun: 18,
			Enums.StKey.hitstop : 10,
			Enums.StKey.attack_type : Enums.AttackType.Strike,
			Enums.StKey.guard: Enums.GuardType.Mid,
			Enums.StKey.attack_damage: 60,
			Enums.StKey.min_damage:5,
			Enums.StKey.chip_damage:5,
			Enums.StKey.counter_hit: Enums.AttackType.Strike,
#			Enums.StKey.counter_hitstun: 60,
#			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*40,
#			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*20,
			},
		90 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 3604480, Enums.StKey.Hurt1PosY : -18743296,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : 9568256, Enums.StKey.Hurt2PosY : -27328514,
			Enums.StKey.Hurt2ScaleX : 809242, Enums.StKey.Hurt2ScaleY : 718928,
			Enums.StKey.Hurt3PosX : -2686974, Enums.StKey.Hurt3PosY : -15597570,
			Enums.StKey.Hurt3ScaleX : 1097339, Enums.StKey.Hurt3ScaleY : 589522,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("j2C")
#
func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
#	if (state[Enums.StKey.frame] == 1):
#		SyncManager.play_sound("KanataVoice", voice, {"bus": "Voice"})

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface])
				and interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Jump6C"
#
