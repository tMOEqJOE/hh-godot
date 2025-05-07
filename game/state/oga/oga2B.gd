extends OgaCrouchAttackState

class_name Oga2BState

func _init():
	endFrame = 25
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -786432, Enums.StKey.Hurt1PosY : -7929856,
			Enums.StKey.Hurt1ScaleX : 862361, Enums.StKey.Hurt1ScaleY : -1618700,
			},
		8 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 17367040, Enums.StKey.Hurt1PosY : -3145728,
			Enums.StKey.Hurt1ScaleX : 1657215, Enums.StKey.Hurt1ScaleY : -450676,
			Enums.StKey.Hurt2PosX : -1900544, Enums.StKey.Hurt2PosY : -9895936,
			Enums.StKey.Hurt2ScaleX : 843346, Enums.StKey.Hurt2ScaleY : -1101378,
			Enums.StKey.Hurt3PosX : 3211264, Enums.StKey.Hurt3PosY : -15532031,
			Enums.StKey.Hurt3ScaleX : 763297, Enums.StKey.Hurt3ScaleY : -326121,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 15990782, Enums.StKey.Hit1PosY : 589824,
			Enums.StKey.Hit1ScaleX : 2001259, Enums.StKey.Hit1ScaleY : 439648,
			Enums.StKey.attack_damage: 50,
			Enums.StKey.guard: Enums.GuardType.Low,
			},
		12 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 17367040, Enums.StKey.Hurt1PosY : -3145728,
			Enums.StKey.Hurt1ScaleX : 1657215, Enums.StKey.Hurt1ScaleY : -450676,
			Enums.StKey.Hurt2PosX : -1900544, Enums.StKey.Hurt2PosY : -9895936,
			Enums.StKey.Hurt2ScaleX : 843346, Enums.StKey.Hurt2ScaleY : -1101378,
			Enums.StKey.Hurt3PosX : 3211264, Enums.StKey.Hurt3PosY : -15532031,
			Enums.StKey.Hurt3ScaleX : 763297, Enums.StKey.Hurt3ScaleY : -326121,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("2B")

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
		elif (interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Stand5C"

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
