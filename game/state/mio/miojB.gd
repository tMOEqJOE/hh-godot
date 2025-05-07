extends MioAirAttackState

class_name MiojBState

func _init():
	endFrame = 40
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 3276800, Enums.StKey.Hurt1PosY : -26476544,
			Enums.StKey.Hurt1ScaleX : 716858, Enums.StKey.Hurt1ScaleY : 294602,
			Enums.StKey.Hurt2PosX : 2097148, Enums.StKey.Hurt2PosY : -23592958,
			Enums.StKey.Hurt2ScaleX : 510595, Enums.StKey.Hurt2ScaleY : -912293,
			Enums.StKey.Hurt3PosX : -327681, Enums.StKey.Hurt3PosY : -27459584,
			Enums.StKey.Hurt3ScaleX : 681744, Enums.StKey.Hurt3ScaleY : -281756,
			},
		8 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.Hit1PosX : -1245183, Enums.StKey.Hit1PosY : -13238272,
			Enums.StKey.Hit1ScaleX : 1543519, Enums.StKey.Hit1ScaleY : 346855,
			Enums.StKey.Hit2PosX : 1543519, Enums.StKey.Hit2PosY : -19595264,
			Enums.StKey.Hit2ScaleX : 632386, Enums.StKey.Hit2ScaleY : -440451,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 15204352, Enums.StKey.Hurt1PosY : -22216704,
			Enums.StKey.Hurt1ScaleX : 925690, Enums.StKey.Hurt1ScaleY : 528060,
			Enums.StKey.Hurt2PosX : 2752511, Enums.StKey.Hurt2PosY : -21561346,
			Enums.StKey.Hurt2ScaleX : 510595, Enums.StKey.Hurt2ScaleY : -912293,
			Enums.StKey.Hurt3PosX : -1048575, Enums.StKey.Hurt3PosY : -15335425,
			Enums.StKey.Hurt3ScaleX : 1663220, Enums.StKey.Hurt3ScaleY : -352195,
			Enums.StKey.counter_hitstun: 7,
			Enums.StKey.hitstop: 8,
			Enums.StKey.attack_damage: 35,
			Enums.StKey.min_damage: 4,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.counter_hit: Enums.AttackType.Strike,
			},
		9 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 3735552, Enums.StKey.Hurt1PosY : -16449532,
			Enums.StKey.Hurt1ScaleX : 868657, Enums.StKey.Hurt1ScaleY : 885109,
			Enums.StKey.Hurt2PosX : 196607, Enums.StKey.Hurt2PosY : -16908290,
			Enums.StKey.Hurt2ScaleX : 1310325, Enums.StKey.Hurt2ScaleY : -514394,
			},
		10 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.Hit1PosX : 3276799, Enums.StKey.Hit1PosY : -11206656,
			Enums.StKey.Hit1ScaleX : 1616680, Enums.StKey.Hit1ScaleY : 166092,
			Enums.StKey.Hit2PosX : 24576000, Enums.StKey.Hit2PosY : -27394048,
			Enums.StKey.Hit2ScaleX : 494779, Enums.StKey.Hit2ScaleY : -756933,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 24772606, Enums.StKey.Hurt1PosY : -30867456,
			Enums.StKey.Hurt1ScaleX : 555414, Enums.StKey.Hurt1ScaleY : 748084,
			Enums.StKey.Hurt2PosX : 2752511, Enums.StKey.Hurt2PosY : -21561346,
			Enums.StKey.Hurt2ScaleX : 510595, Enums.StKey.Hurt2ScaleY : -912293,
			Enums.StKey.Hurt3PosX : 3342336, Enums.StKey.Hurt3PosY : -14417919,
			Enums.StKey.Hurt3ScaleX : 1663220, Enums.StKey.Hurt3ScaleY : -352195,
			Enums.StKey.hitstop: 8,
			Enums.StKey.attack_damage: 35,
			Enums.StKey.min_damage: 4,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.counter_hit: Enums.AttackType.Strike,
			},
		12 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 3735552, Enums.StKey.Hurt1PosY : -16449532,
			Enums.StKey.Hurt1ScaleX : 868657, Enums.StKey.Hurt1ScaleY : 885109,
			Enums.StKey.Hurt2PosX : 196607, Enums.StKey.Hurt2PosY : -16908290,
			Enums.StKey.Hurt2ScaleX : 1310325, Enums.StKey.Hurt2ScaleY : -514394,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("jB")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
			interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and
			interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Jump2C"
		elif (interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Jump5C"
		elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "Jump5A"
