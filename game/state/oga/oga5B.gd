extends OgaAttackState

class_name Oga5BState

func _init():
	endFrame = 27
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -4063232, Enums.StKey.Hurt1PosY : -23068670,
			Enums.StKey.Hurt1ScaleX : 1104947, Enums.StKey.Hurt1ScaleY : -429356,
			Enums.StKey.Hurt2PosX : -7077888, Enums.StKey.Hurt2PosY : -14024705,
			Enums.StKey.Hurt2ScaleX : 1637428, Enums.StKey.Hurt2ScaleY : -554919,
			Enums.StKey.Hurt3PosX : -655360, Enums.StKey.Hurt3PosY : -3735552,
			Enums.StKey.Hurt3ScaleX : 1735847, Enums.StKey.Hurt3ScaleY : -495494,
			},
		9 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 1048576, Enums.StKey.Hurt1PosY : -21233662,
			Enums.StKey.Hurt1ScaleX : 1104947, Enums.StKey.Hurt1ScaleY : -429356,
			Enums.StKey.Hurt2PosX : 23855104, Enums.StKey.Hurt2PosY : -13107199,
			Enums.StKey.Hurt2ScaleX : 1637428, Enums.StKey.Hurt2ScaleY : -554919,
			Enums.StKey.Hurt3PosX : 5439488, Enums.StKey.Hurt3PosY : -4718593,
			Enums.StKey.Hurt3ScaleX : 1735847, Enums.StKey.Hurt3ScaleY : -495494,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 12320768, Enums.StKey.Hit1PosY : -12451841,
			Enums.StKey.Hit1ScaleX : 2578953, Enums.StKey.Hit1ScaleY : 367072,
			Enums.StKey.attack_damage: 47,
			},
		13 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 1048576, Enums.StKey.Hurt1PosY : -21233662,
			Enums.StKey.Hurt1ScaleX : 1104947, Enums.StKey.Hurt1ScaleY : -429356,
			Enums.StKey.Hurt2PosX : 14614528, Enums.StKey.Hurt2PosY : -13697024,
			Enums.StKey.Hurt2ScaleX : 1637428, Enums.StKey.Hurt2ScaleY : -554919,
			Enums.StKey.Hurt3PosX : 5439488, Enums.StKey.Hurt3PosY : -4718593,
			Enums.StKey.Hurt3ScaleX : 1735847, Enums.StKey.Hurt3ScaleY : -495494,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("5B")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) and 
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

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
