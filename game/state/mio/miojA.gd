extends MioAirAttackState

class_name MiojAState

func _init():
	endFrame = 15
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -458752, Enums.StKey.Hurt1PosY : -22282238,
			Enums.StKey.Hurt1ScaleX : 339834, Enums.StKey.Hurt1ScaleY : 629832,
			Enums.StKey.Hurt2PosX : -655360, Enums.StKey.Hurt2PosY : -18219008,
			Enums.StKey.Hurt2ScaleX : 548413, Enums.StKey.Hurt2ScaleY : -906915,
			Enums.StKey.Hurt3PosX : 6094848, Enums.StKey.Hurt3PosY : -4784128,
			Enums.StKey.Hurt3ScaleX : 1171400, Enums.StKey.Hurt3ScaleY : -464723,
			},
		4 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit1PosX : 8060928, Enums.StKey.Hit1PosY : -11927552,
			Enums.StKey.Hit1ScaleX : 578622, Enums.StKey.Hit1ScaleY : -570412,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 1310720, Enums.StKey.Hurt1PosY : -18743296,
			Enums.StKey.Hurt1ScaleX : 305194, Enums.StKey.Hurt1ScaleY : 951940,
			Enums.StKey.Hurt2PosX : -393216, Enums.StKey.Hurt2PosY : -18546690,
			Enums.StKey.Hurt2ScaleX : 496415, Enums.StKey.Hurt2ScaleY : -807327,
			Enums.StKey.Hurt3PosX : 7012352, Enums.StKey.Hurt3PosY : -13303806,
			Enums.StKey.Hurt3ScaleX : 681744, Enums.StKey.Hurt3ScaleY : -281756,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.hitstop: 8,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.attack_damage: 20,
			Enums.StKey.min_damage: 3,
			Enums.StKey.counter_hit: Enums.AttackType.Strike,
			Enums.StKey.hitstun: Util.DEFAULT_LIGHT_HITSTUN,
			Enums.StKey.blockstun: Util.DEFAULT_LIGHT_BLOCKSTUN,
#			Enums.StKey.counter_hitstun: 5,
			},
		5 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 1310720, Enums.StKey.Hurt1PosY : -18743296,
			Enums.StKey.Hurt1ScaleX : 305194, Enums.StKey.Hurt1ScaleY : 951940,
			Enums.StKey.Hurt2PosX : -393216, Enums.StKey.Hurt2PosY : -18546690,
			Enums.StKey.Hurt2ScaleX : 496415, Enums.StKey.Hurt2ScaleY : -807327,
			Enums.StKey.Hurt3PosX : 7012352, Enums.StKey.Hurt3PosY : -13303806,
			Enums.StKey.Hurt3ScaleX : 681744, Enums.StKey.Hurt3ScaleY : -281756,
			},
	}


# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("jA")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Jump2C"
		elif (interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Jump5C"
		elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "Jump5B"
		elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "Jump5A"
