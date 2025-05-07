extends "res://game/state/kanata/mainstates/kanataAirAttackState.gd"

class_name KanatajAState

func _init():
	endFrame = 20
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -589824, Enums.StKey.Hurt1PosY : -17760256,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : -7274496, Enums.StKey.Hurt2PosY : -20185088,
			Enums.StKey.Hurt2ScaleX : 809242, Enums.StKey.Hurt2ScaleY : 718928,
			Enums.StKey.Hurt3PosX : 1900543, Enums.StKey.Hurt3PosY : -14876676,
			Enums.StKey.Hurt3ScaleX : 1097339, Enums.StKey.Hurt3ScaleY : 589522,
			},
		4 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit1PosX : 6094848, Enums.StKey.Hit1PosY : -15990783,
			Enums.StKey.Hit1ScaleX : 470768, Enums.StKey.Hit1ScaleY : 689719,
			Enums.StKey.Hit2PosX : 12255232, Enums.StKey.Hit2PosY : -25559038,
			Enums.StKey.Hit2ScaleX : 512521, Enums.StKey.Hit2ScaleY : 833886,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -1245184, Enums.StKey.Hurt1PosY : -17825792,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : 10223615, Enums.StKey.Hurt2PosY : -26017796,
			Enums.StKey.Hurt2ScaleX : 809242, Enums.StKey.Hurt2ScaleY : 718928,
			Enums.StKey.Hurt3PosX : -12124158, Enums.StKey.Hurt3PosY : -23592964,
			Enums.StKey.Hurt3ScaleX : 1097339, Enums.StKey.Hurt3ScaleY : 589522,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.attack_damage: 30,
			Enums.StKey.counter_hit: Enums.AttackType.Strike,
			},
		22 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -589824, Enums.StKey.Hurt1PosY : -17760256,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : -7274496, Enums.StKey.Hurt2PosY : -20185088,
			Enums.StKey.Hurt2ScaleX : 809242, Enums.StKey.Hurt2ScaleY : 718928,
			Enums.StKey.Hurt3PosX : 1900543, Enums.StKey.Hurt3PosY : -14876676,
			Enums.StKey.Hurt3ScaleX : 1097339, Enums.StKey.Hurt3ScaleY : 589522,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("jA")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
#		if (state[Enums.StKey.airDash] > 0 and interpreter.is_air_dashing(true, state[Enums.StKey.leftface])):
#			state[Enums.StKey.cancelState] = "ForwardAirDash"
#		elif (state[Enums.StKey.airDash] > 0 and interpreter.is_air_dashing(false, state[Enums.StKey.leftface])):
#			state[Enums.StKey.cancelState] = "BackwardAirDash"
		if ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Jump2C"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface])
				and interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Jump6C"
		elif (interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Jump5C"
		elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "Jump5B"
		elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "Jump5A"
