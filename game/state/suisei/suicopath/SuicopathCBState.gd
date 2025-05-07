extends SuicopathAttackState

class_name SuicopathCBState

func _init():
	endFrame = 43
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -196608, Enums.StKey.Hurt1PosY : -5505024,
			Enums.StKey.Hurt1ScaleX : 670493, Enums.StKey.Hurt1ScaleY : 534448,
			Enums.StKey.Hurt2PosX : -6422528, Enums.StKey.Hurt2PosY : -11534336,
			Enums.StKey.Hurt2ScaleX : 850444, Enums.StKey.Hurt2ScaleY : 1178130,
			},
		8 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.Hit1PosX : 15335424, Enums.StKey.Hit1PosY : -14483456,
			Enums.StKey.Hit1ScaleX : 1888999, Enums.StKey.Hit1ScaleY : 697790,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -196608, Enums.StKey.Hurt1PosY : -5505024,
			Enums.StKey.Hurt1ScaleX : 670493, Enums.StKey.Hurt1ScaleY : 534448,
			Enums.StKey.Hurt2PosX : -6422528, Enums.StKey.Hurt2PosY : -11534336,
			Enums.StKey.Hurt2ScaleX : 850444, Enums.StKey.Hurt2ScaleY : 1178130,
			Enums.StKey.hitstun : 60,
			Enums.StKey.attack_damage: 52,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*10,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*30,
			Enums.StKey.hitstop: 7,
			Enums.StKey.min_damage:4,
			Enums.StKey.chip_damage:4,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_hitstun: 60,
			Enums.StKey.meter_build: 0,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*20,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*38,
			},
		11 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -196608, Enums.StKey.Hurt1PosY : -5505024,
			Enums.StKey.Hurt1ScaleX : 670493, Enums.StKey.Hurt1ScaleY : 534448,
			Enums.StKey.Hurt2PosX : -6422528, Enums.StKey.Hurt2PosY : -11534336,
			Enums.StKey.Hurt2ScaleX : 850444, Enums.StKey.Hurt2ScaleY : 1178130,
			},
		19 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.Hit1PosX : 15335424, Enums.StKey.Hit1PosY : -14483456,
			Enums.StKey.Hit1ScaleX : 1888999, Enums.StKey.Hit1ScaleY : 697790,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -196608, Enums.StKey.Hurt1PosY : -5505024,
			Enums.StKey.Hurt1ScaleX : 670493, Enums.StKey.Hurt1ScaleY : 534448,
			Enums.StKey.Hurt2PosX : -6422528, Enums.StKey.Hurt2PosY : -11534336,
			Enums.StKey.Hurt2ScaleX : 850444, Enums.StKey.Hurt2ScaleY : 1178130,
			Enums.StKey.hitstun : 60,
			Enums.StKey.attack_damage: 40,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*15,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*30,
			Enums.StKey.min_damage: 6,
			Enums.StKey.chip_damage: 6,
			Enums.StKey.meter_build: 0,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_hitstun: 60,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*20,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*38,
			},
		22 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -196608, Enums.StKey.Hurt1PosY : -5505024,
			Enums.StKey.Hurt1ScaleX : 670493, Enums.StKey.Hurt1ScaleY : 534448,
			Enums.StKey.Hurt2PosX : -6422528, Enums.StKey.Hurt2PosY : -11534336,
			Enums.StKey.Hurt2ScaleX : 850444, Enums.StKey.Hurt2ScaleY : 1178130,
			},
		30 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.Hit1PosX : 15335424, Enums.StKey.Hit1PosY : -14483456,
			Enums.StKey.Hit1ScaleX : 1888999, Enums.StKey.Hit1ScaleY : 697790,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -196608, Enums.StKey.Hurt1PosY : -5505024,
			Enums.StKey.Hurt1ScaleX : 670493, Enums.StKey.Hurt1ScaleY : 534448,
			Enums.StKey.Hurt2PosX : -6422528, Enums.StKey.Hurt2PosY : -11534336,
			Enums.StKey.Hurt2ScaleX : 850444, Enums.StKey.Hurt2ScaleY : 1178130,
			Enums.StKey.hitstun : 60,
			Enums.StKey.attack_damage: 70,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*30,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*30,
			Enums.StKey.hitstop: 10,
			Enums.StKey.min_damage:8,
			Enums.StKey.chip_damage:8,
			Enums.StKey.meter_build: 0,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_hitstun: 60,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*20,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*38,
			},
		33 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -196608, Enums.StKey.Hurt1PosY : -5505024,
			Enums.StKey.Hurt1ScaleX : 670493, Enums.StKey.Hurt1ScaleY : 534448,
			Enums.StKey.Hurt2PosX : -6422528, Enums.StKey.Hurt2PosY : -11534336,
			Enums.StKey.Hurt2ScaleX : 850444, Enums.StKey.Hurt2ScaleY : 1178130,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("SuicopathcB")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "AngelStand6A"
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "AngelCrouch2B"
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "AngelCrouch2A"
		elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "AngelStand5B"
		elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "AngelStand5A"
		
