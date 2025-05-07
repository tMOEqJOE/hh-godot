extends MioAttackState

class_name Mio6CState

var voice = preload("res://game/assets/voice/mio/mio_pon2.wav")

func _init():
	endFrame = 42
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -17432576,
			Enums.StKey.Hurt1ScaleX : 692179, Enums.StKey.Hurt1ScaleY : 354035,
			Enums.StKey.Hurt2PosX : 0, Enums.StKey.Hurt2PosY : -7798785,
			Enums.StKey.Hurt2ScaleX : 685281, Enums.StKey.Hurt2ScaleY : -718583,
			Enums.StKey.Hurt3PosX : 851968, Enums.StKey.Hurt3PosY : -4325376,
			Enums.StKey.Hurt3ScaleX : 934301, Enums.StKey.Hurt3ScaleY : -449426,
			},
		12 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit1PosX : 22675458, Enums.StKey.Hit1PosY : -26148864,
			Enums.StKey.Hit1ScaleX : 1948257, Enums.StKey.Hit1ScaleY : -341914,
			Enums.StKey.Hit2PosX : 13697023, Enums.StKey.Hit2PosY : -25690114,
			Enums.StKey.Hit2ScaleX : 764307, Enums.StKey.Hit2ScaleY : -1575564,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 4456448, Enums.StKey.Hurt1PosY : -25034750,
			Enums.StKey.Hurt1ScaleX : 833219, Enums.StKey.Hurt1ScaleY : 256985,
			Enums.StKey.Hurt2PosX : -1245184, Enums.StKey.Hurt2PosY : -22151168,
			Enums.StKey.Hurt2ScaleX : 451781, Enums.StKey.Hurt2ScaleY : -1263010,
			Enums.StKey.Hurt3PosX : -1048576, Enums.StKey.Hurt3PosY : -6094847,
			Enums.StKey.Hurt3ScaleX : 302121, Enums.StKey.Hurt3ScaleY : -600552,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*28,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*38,
			Enums.StKey.hitstop: 10,
			Enums.StKey.hitstun : 60,
			Enums.StKey.attack_damage: 55,
			Enums.StKey.min_damage: 9,
			Enums.StKey.chip_damage: 4,
			Enums.StKey.counter_hit: Enums.AttackType.WallBouncer,
			Enums.StKey.counter_hitstun: 20,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*60,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*40,
			},
		16 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 4456448, Enums.StKey.Hurt1PosY : -25034750,
			Enums.StKey.Hurt1ScaleX : 833219, Enums.StKey.Hurt1ScaleY : 256985,
			Enums.StKey.Hurt2PosX : -1245184, Enums.StKey.Hurt2PosY : -22151168,
			Enums.StKey.Hurt2ScaleX : 451781, Enums.StKey.Hurt2ScaleY : -1263010,
			Enums.StKey.Hurt3PosX : -1048576, Enums.StKey.Hurt3PosY : -6094847,
			Enums.StKey.Hurt3ScaleX : 302121, Enums.StKey.Hurt3ScaleY : -600552,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("6C")
	state[Enums.StKey.super_meter] += SGFixed.ONE*200

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 2):
		SyncManager.play_sound("MioVoice", voice, {"bus": "Voice"})

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
