extends AirState

class_name OgaAirIdleState

func _init():
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -8126464, Enums.StKey.Hurt1PosY : -6029311,
			Enums.StKey.Hurt1ScaleX : 498353, Enums.StKey.Hurt1ScaleY : 442051,
			Enums.StKey.Hurt2PosX : -1441792, Enums.StKey.Hurt2PosY : -43384832,
			Enums.StKey.Hurt2ScaleX : 896391, Enums.StKey.Hurt2ScaleY : -1190856,
			Enums.StKey.Hurt3PosX : -2293760, Enums.StKey.Hurt3PosY : -23658496,
			Enums.StKey.Hurt3ScaleX : 519088, Enums.StKey.Hurt3ScaleY : 1416473,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.kara_OK] = true

#func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	#if (interpreter.is_holding_a_direction(Enums.Numpad.N5, state[Enums.StKey.leftface]) and
		#not (interpreter.is_button_down(Enums.InputFlags.AHold) or
		#interpreter.is_button_down(Enums.InputFlags.BHold) or
		#interpreter.is_button_down(Enums.InputFlags.CHold) or
		#interpreter.is_button_down(Enums.InputFlags.DHold))):
		#pass
	#else:
		#common_idle_transitions(state, interpreter)
