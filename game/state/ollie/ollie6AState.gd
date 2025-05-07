extends "res://game/state/ollie/mainstates/ollieAttackState.gd"

class_name Ollie6AState

func _init():
	endFrame = 49
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 4849664, Enums.StKey.Hurt1PosY : -6225920,
			Enums.StKey.Hurt1ScaleX : 1302091, Enums.StKey.Hurt1ScaleY : 593568,
			Enums.StKey.Hurt2PosX : -2555904, Enums.StKey.Hurt2PosY : -14811136,
			Enums.StKey.Hurt2ScaleX : 1180219, Enums.StKey.Hurt2ScaleY : -551149,
			},
		4 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 4849664, Enums.StKey.Hurt1PosY : -6225920,
			Enums.StKey.Hurt1ScaleX : 1302091, Enums.StKey.Hurt1ScaleY : 593568,
			Enums.StKey.Hurt2PosX : -2555904, Enums.StKey.Hurt2PosY : -14811136,
			Enums.StKey.Hurt2ScaleX : 1180219, Enums.StKey.Hurt2ScaleY : -551149,
			},
		10 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit1PosX : 77463552, Enums.StKey.Hit1PosY : -29687808,
			Enums.StKey.Hit1ScaleX : 1982209, Enums.StKey.Hit1ScaleY : 288752,
			Enums.StKey.Hit2PosX : 53805052, Enums.StKey.Hit2PosY : -24772608,
			Enums.StKey.Hit2ScaleX : 1915232, Enums.StKey.Hit2ScaleY : -290274,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 5177342, Enums.StKey.Hurt1PosY : -9240575,
			Enums.StKey.Hurt1ScaleX : 1274141, Enums.StKey.Hurt1ScaleY : 998169,
			Enums.StKey.Hurt2PosX : 37158912, Enums.StKey.Hurt2PosY : -21299200,
			Enums.StKey.Hurt2ScaleX : 2162742, Enums.StKey.Hurt2ScaleY : -507786,
			Enums.StKey.Hurt3PosX : 72417288, Enums.StKey.Hurt3PosY : -27262978,
			Enums.StKey.Hurt3ScaleX : 1567722, Enums.StKey.Hurt3ScaleY : -461032,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.attack_damage: 50,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.hitstun: 20,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*10,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*30,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_hitstun: 30,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*20,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*50,
			},
		18 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 5177342, Enums.StKey.Hurt1PosY : -9240575,
			Enums.StKey.Hurt1ScaleX : 1274141, Enums.StKey.Hurt1ScaleY : 998169,
			Enums.StKey.Hurt2PosX : 37158912, Enums.StKey.Hurt2PosY : -21299200,
			Enums.StKey.Hurt2ScaleX : 2162742, Enums.StKey.Hurt2ScaleY : -507786,
			Enums.StKey.Hurt3PosX : 72417288, Enums.StKey.Hurt3PosY : -27262978,
			Enums.StKey.Hurt3ScaleX : 1567722, Enums.StKey.Hurt3ScaleY : -461032,
			},
		27 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hit1PosX : 73662456, Enums.StKey.Hit1PosY : -28114946,
			Enums.StKey.Hit1ScaleX : 1704464, Enums.StKey.Hit1ScaleY : 675527,
			Enums.StKey.Hit2PosX : 78118920, Enums.StKey.Hit2PosY : -34799616,
			Enums.StKey.Hit2ScaleX : 938505, Enums.StKey.Hit2ScaleY : 1351744,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 2097152, Enums.StKey.Hurt1PosY : -2555901,
			Enums.StKey.Hurt1ScaleX : 1244010, Enums.StKey.Hurt1ScaleY : 402320,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.attack_damage: 40,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.hitstun: 28,
			Enums.StKey.launch_dir_x : SGFixed.ONE*25,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*55,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 45,
			Enums.StKey.counter_launch_dir_x: SGFixed.ONE*35,
			Enums.StKey.counter_launch_dir_y: SGFixed.ONE*60,
			},
		33 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 4849664, Enums.StKey.Hurt1PosY : -6225920,
			Enums.StKey.Hurt1ScaleX : 1302091, Enums.StKey.Hurt1ScaleY : 593568,
			Enums.StKey.Hurt2PosX : 2621440, Enums.StKey.Hurt2PosY : -14417920,
			Enums.StKey.Hurt2ScaleX : 385519, Enums.StKey.Hurt2ScaleY : -610578,
			},
	}


# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("6A")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Stand6C"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Crouch3C"
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Crouch2C"
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "Crouch2B"
		elif (interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Stand5C"
		elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "Stand5B"
