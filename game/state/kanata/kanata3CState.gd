extends "res://game/state/kanata/mainstates/kanataCrouchAttackState.gd"

class_name Kanata3CState

func _init():
	endFrame = 40
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 3866624, Enums.StKey.Hurt1PosY : -14417920,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : -6160384, Enums.StKey.Hurt2PosY : -13107201,
			Enums.StKey.Hurt2ScaleX : 809242, Enums.StKey.Hurt2ScaleY : 718928,
			Enums.StKey.Hurt3PosX : 2752512, Enums.StKey.Hurt3PosY : -5373952,
			Enums.StKey.Hurt3ScaleX : 1060306, Enums.StKey.Hurt3ScaleY : 671768,
			},
		10 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit1PosX : 11272191, Enums.StKey.Hit1PosY : -27394046,
			Enums.StKey.Hit1ScaleX : 997409, Enums.StKey.Hit1ScaleY : 1680399,
			Enums.StKey.Hit2PosX : 1703936, Enums.StKey.Hit2PosY : -30408702,
			Enums.StKey.Hit2ScaleX : 512521, Enums.StKey.Hit2ScaleY : 833886,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -786432, Enums.StKey.Hurt1PosY : -8716288,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : 4980736, Enums.StKey.Hurt2PosY : -6684672,
			Enums.StKey.Hurt2ScaleX : 809242, Enums.StKey.Hurt2ScaleY : 718928,
			Enums.StKey.Hurt3PosX : 6488064, Enums.StKey.Hurt3PosY : -14417920,
			Enums.StKey.Hurt3ScaleX : 1060306, Enums.StKey.Hurt3ScaleY : 671768,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.hitstop : 10,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.hitstun: 30,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*7,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*60,
			Enums.StKey.min_damage: 7,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_hitstun: 110,
			Enums.StKey.attack_damage: 75,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*5,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*100,
			},
		16 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 4587520, Enums.StKey.Hurt1PosY : -22544384,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : 2293760, Enums.StKey.Hurt2PosY : -5898242,
			Enums.StKey.Hurt2ScaleX : 954510, Enums.StKey.Hurt2ScaleY : 708881,
			Enums.StKey.Hurt3PosX : 9240577, Enums.StKey.Hurt3PosY : -34078720,
			Enums.StKey.Hurt3ScaleX : 1210947, Enums.StKey.Hurt3ScaleY : 937168,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("3C")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		pass
#		if (interpreter.is_dashing(true, state[Enums.StKey.leftface])):
#			state[Enums.StKey.cancelState] = "Run"
#		elif (interpreter.is_dashing(false, state[Enums.StKey.leftface])):
#				state[Enums.StKey.cancelState] = "BackDash"
#
