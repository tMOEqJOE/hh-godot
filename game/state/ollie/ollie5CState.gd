extends "res://game/state/ollie/mainstates/ollieAttackState.gd"

class_name Ollie5CState

func _init():
	endFrame = 55
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -12255233,
			Enums.StKey.Hurt1ScaleX : 746005, Enums.StKey.Hurt1ScaleY : 1063088,
			Enums.StKey.Hurt2PosX : -983040, Enums.StKey.Hurt2PosY : -3997696,
			Enums.StKey.Hurt2ScaleX : 1180219, Enums.StKey.Hurt2ScaleY : -551149,
			Enums.StKey.Hurt3PosX : 8060928, Enums.StKey.Hurt3PosY : -23855100,
			Enums.StKey.Hurt3ScaleX : 479471, Enums.StKey.Hurt3ScaleY : -875661,
			},
		8 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hit1PosX : 9437185, Enums.StKey.Hit1PosY : -24182786,
			Enums.StKey.Hit1ScaleX : 883938, Enums.StKey.Hit1ScaleY : 1410856,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -12255233,
			Enums.StKey.Hurt1ScaleX : 746005, Enums.StKey.Hurt1ScaleY : 1063088,
			Enums.StKey.Hurt2PosX : -983040, Enums.StKey.Hurt2PosY : -3997696,
			Enums.StKey.Hurt2ScaleX : 1180219, Enums.StKey.Hurt2ScaleY : -551149,
			Enums.StKey.Hurt3PosX : 8060928, Enums.StKey.Hurt3PosY : -23855100,
			Enums.StKey.Hurt3ScaleX : 479471, Enums.StKey.Hurt3ScaleY : -875661,
			Enums.StKey.hit_box_colliding_frame : 3,
			Enums.StKey.hitstop : 3,
			Enums.StKey.hitstun: 21,
			Enums.StKey.attack_damage: 45,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_hitstun: 10,
			},
		16 : {
			Enums.StKey.counterOK : true, 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -12255233,
			Enums.StKey.Hurt1ScaleX : 746005, Enums.StKey.Hurt1ScaleY : 1063088,
			Enums.StKey.Hurt2PosX : -983040, Enums.StKey.Hurt2PosY : -3997696,
			Enums.StKey.Hurt2ScaleX : 1180219, Enums.StKey.Hurt2ScaleY : -551149,
			Enums.StKey.Hurt3PosX : -6946816, Enums.StKey.Hurt3PosY : -30408706,
			Enums.StKey.Hurt3ScaleX : 479471, Enums.StKey.Hurt3ScaleY : -875661,
			},
		29 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hit1PosX : 22675452, Enums.StKey.Hit1PosY : -18677760,
			Enums.StKey.Hit1ScaleX : 1219257, Enums.StKey.Hit1ScaleY : 1879208,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 851968, Enums.StKey.Hurt1PosY : -13107200,
			Enums.StKey.Hurt1ScaleX : 815917, Enums.StKey.Hurt1ScaleY : 1266850,
			Enums.StKey.Hurt2PosX : -983040, Enums.StKey.Hurt2PosY : -3997696,
			Enums.StKey.Hurt2ScaleX : 1180219, Enums.StKey.Hurt2ScaleY : -551149,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.attack_damage: 30,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.attack_type : Enums.AttackType.GroundBouncer,
			Enums.StKey.hitstun: 40,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*20,
			Enums.StKey.launch_dir_y : SGFixed.ONE*40,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 110,
			Enums.StKey.counter_launch_dir_x: SGFixed.ONE*10,
			Enums.StKey.counter_launch_dir_y: SGFixed.ONE*75,
			},
		32 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -12255233,
			Enums.StKey.Hurt1ScaleX : 746005, Enums.StKey.Hurt1ScaleY : 1063088,
			Enums.StKey.Hurt2PosX : -983040, Enums.StKey.Hurt2PosY : -3997696,
			Enums.StKey.Hurt2ScaleX : 1180219, Enums.StKey.Hurt2ScaleY : -551149,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("5C")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Stand6C"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "Stand6A"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Crouch3C"
#		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
#				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
#				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
#				interpreter.is_button_down(Enums.InputFlags.CDown)):
#			state[Enums.StKey.cancelState] = "Crouch2C"
