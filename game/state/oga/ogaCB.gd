extends OgaAttackState

class_name OgaCBState

func _init():
	endFrame = 15
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt2PosX : -1507328, Enums.StKey.Hurt2PosY : -14352385,
			Enums.StKey.Hurt2ScaleX : 883555, Enums.StKey.Hurt2ScaleY : -1246508,
			Enums.StKey.Hurt3PosX : -5308416, Enums.StKey.Hurt3PosY : -5439488,
			Enums.StKey.Hurt3ScaleX : 1058966, Enums.StKey.Hurt3ScaleY : 643717,
			},
		5 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt2PosX : -1507328, Enums.StKey.Hurt2PosY : -14352385,
			Enums.StKey.Hurt2ScaleX : 883555, Enums.StKey.Hurt2ScaleY : -1246508,
			Enums.StKey.Hurt3PosX : -5308416, Enums.StKey.Hurt3PosY : -5439488,
			Enums.StKey.Hurt3ScaleX : 1058966, Enums.StKey.Hurt3ScaleY : 643717,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.hitstop: 12,
			Enums.StKey.Hit1PosX : 7405567, Enums.StKey.Hit1PosY : -11730942,
			Enums.StKey.Hit1ScaleX : 1447154, Enums.StKey.Hit1ScaleY : 532102,
			Enums.StKey.attack_damage: 68,
			Enums.StKey.min_damage: 4,
			},
		10 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt2PosX : -1507328, Enums.StKey.Hurt2PosY : -14352385,
			Enums.StKey.Hurt2ScaleX : 883555, Enums.StKey.Hurt2ScaleY : -1246508,
			Enums.StKey.Hurt3PosX : -5308416, Enums.StKey.Hurt3PosY : -5439488,
			Enums.StKey.Hurt3ScaleX : 1058966, Enums.StKey.Hurt3ScaleY : 643717,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("cB")

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
		elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "Stand5B"
		elif (interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Stand5C"
