extends MioCrouchAttackState

class_name Mio2BState

func _init():
	endFrame = 30
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true, Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 7798785, Enums.StKey.Hurt1PosY : -11206656,
			Enums.StKey.Hurt1ScaleX : 371401, Enums.StKey.Hurt1ScaleY : 601618,
			Enums.StKey.Hurt2PosX : 1638400, Enums.StKey.Hurt2PosY : -7143424,
			Enums.StKey.Hurt2ScaleX : 430035, Enums.StKey.Hurt2ScaleY : -705015,
			Enums.StKey.Hurt3PosX : 16187392, Enums.StKey.Hurt3PosY : -2949120,
			Enums.StKey.Hurt3ScaleX : 1065516, Enums.StKey.Hurt3ScaleY : -284798,
			},
		10 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 7798785, Enums.StKey.Hurt1PosY : -11206656,
			Enums.StKey.Hurt1ScaleX : 371401, Enums.StKey.Hurt1ScaleY : 601618,
			Enums.StKey.Hurt2PosX : 1638400, Enums.StKey.Hurt2PosY : -7143424,
			Enums.StKey.Hurt2ScaleX : 430035, Enums.StKey.Hurt2ScaleY : -705015,
			Enums.StKey.Hurt3PosX : 16187392, Enums.StKey.Hurt3PosY : -2949120,
			Enums.StKey.Hurt3ScaleX : 1065516, Enums.StKey.Hurt3ScaleY : -284798,
			Enums.StKey.Hit1Disable : false, Enums.StKey.Hit2Disable : true,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.Hit1PosX : 19660798, Enums.StKey.Hit1PosY : -2883584,
			Enums.StKey.Hit1ScaleX : 1702706, Enums.StKey.Hit1ScaleY : 196200,
			Enums.StKey.attack_damage: 38,
			Enums.StKey.guard: Enums.GuardType.Low,
			Enums.StKey.counter_hit: Enums.AttackType.Strike,
			},
		12 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 7798785, Enums.StKey.Hurt1PosY : -11206656,
			Enums.StKey.Hurt1ScaleX : 371401, Enums.StKey.Hurt1ScaleY : 601618,
			Enums.StKey.Hurt2PosX : 1638400, Enums.StKey.Hurt2PosY : -7143424,
			Enums.StKey.Hurt2ScaleX : 430035, Enums.StKey.Hurt2ScaleY : -705015,
			Enums.StKey.Hurt3PosX : 16187392, Enums.StKey.Hurt3PosY : -2949120,
			Enums.StKey.Hurt3ScaleX : 1065516, Enums.StKey.Hurt3ScaleY : -284798,
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
