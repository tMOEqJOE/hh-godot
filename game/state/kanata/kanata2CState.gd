extends "res://game/state/kanata/mainstates/kanataCrouchAttackState.gd"

class_name Kanata2CState

func _init():
	endFrame = 40
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 3670016, Enums.StKey.Hurt1PosY : -9240576,
			Enums.StKey.Hurt1ScaleX : 1124662, Enums.StKey.Hurt1ScaleY : 1008076,
			Enums.StKey.Hurt2PosX : 12845056, Enums.StKey.Hurt2PosY : -12517376,
			Enums.StKey.Hurt2ScaleX : 845584, Enums.StKey.Hurt2ScaleY : -455324,
			},
		10 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hit1PosX : 19988480, Enums.StKey.Hit1PosY : -3932160,
			Enums.StKey.Hit1ScaleX : 2236383, Enums.StKey.Hit1ScaleY : 682901,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX :3670016, Enums.StKey.Hurt1PosY : -8978432,
			Enums.StKey.Hurt1ScaleX : 1169978, Enums.StKey.Hurt1ScaleY : 859614,
			Enums.StKey.Hurt2PosX : -7405567, Enums.StKey.Hurt2PosY : -19660802,
			Enums.StKey.Hurt2ScaleX : 1410875, Enums.StKey.Hurt2ScaleY : 686123,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.hitstop : 10,
			Enums.StKey.guard: Enums.GuardType.Low,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.launch_dir_x: -SGFixed.ONE*20,
			Enums.StKey.launch_dir_y: -SGFixed.ONE*40,
			Enums.StKey.attack_damage: 75,
			Enums.StKey.min_damage: 10,
			Enums.StKey.hitstun: 60,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 60,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*5,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*30,
			},
		14 : { 
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hit1PosX : -18546690, Enums.StKey.Hit1PosY : -4915200,
			Enums.StKey.Hit1ScaleX : 1900968, Enums.StKey.Hit1ScaleY : 655407,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 3670016, Enums.StKey.Hurt1PosY : -9240576,
			Enums.StKey.Hurt1ScaleX : 1124662, Enums.StKey.Hurt1ScaleY : 1008076,
			Enums.StKey.Hurt2PosX : 12845056, Enums.StKey.Hurt2PosY : -12517376,
			Enums.StKey.Hurt2ScaleX : 845584, Enums.StKey.Hurt2ScaleY : -455324,
			Enums.StKey.hitstop : 10,
			Enums.StKey.guard: Enums.GuardType.Low,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.launch_dir_x: SGFixed.ONE*10,
			Enums.StKey.launch_dir_y: -SGFixed.ONE*30,
			Enums.StKey.attack_damage: 80,
			Enums.StKey.min_damage: 12,
			Enums.StKey.hitstun: 60,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 60,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*5,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*30,
			},
		24 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 3670016, Enums.StKey.Hurt1PosY : -9240576,
			Enums.StKey.Hurt1ScaleX : 1124662, Enums.StKey.Hurt1ScaleY : 1008076,
			Enums.StKey.Hurt2PosX : -1179647, Enums.StKey.Hurt2PosY : -23855102,
			Enums.StKey.Hurt2ScaleX : 1410875, Enums.StKey.Hurt2ScaleY : 686123,
			Enums.StKey.Hurt3PosX : 7471104, Enums.StKey.Hurt3PosY : -31719424,
			Enums.StKey.Hurt3ScaleX : 845584, Enums.StKey.Hurt3ScaleY : -455324,
			},
		30 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 3670016, Enums.StKey.Hurt1PosY : -9240576,
			Enums.StKey.Hurt1ScaleX : 1124662, Enums.StKey.Hurt1ScaleY : 1008076,
			Enums.StKey.Hurt2PosX : 12845056, Enums.StKey.Hurt2PosY : -12517376,
			Enums.StKey.Hurt2ScaleX : 845584, Enums.StKey.Hurt2ScaleY : -455324,
			},
		
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("2C")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
#		if (interpreter.is_dashing(true, state[Enums.StKey.leftface])):
#			state[Enums.StKey.cancelState] = "Run"
#		elif (interpreter.is_dashing(false, state[Enums.StKey.leftface])):
#			state[Enums.StKey.cancelState] = "BackDash"
		if (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Stand6C"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Crouch3C"
