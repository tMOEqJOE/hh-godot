extends IdleState

class_name OgaIdleState

func _init():
	anim_data = {
		0 : {
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true, Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1PosX : -1900544, Enums.StKey.Hurt1PosY : -18284544,
			Enums.StKey.Hurt1ScaleX : 976069, Enums.StKey.Hurt1ScaleY : -1832198,
			},
	}

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (not interpreter.is_holding_a_direction(Enums.Numpad.N5, state[Enums.StKey.leftface]) or
			(
				interpreter.is_button_down(Enums.InputFlags.ADown) or
				interpreter.is_button_down(Enums.InputFlags.BDown) or
				interpreter.is_button_down(Enums.InputFlags.CDown) or
				interpreter.is_button_down(Enums.InputFlags.DDown)
			)
		):
		common_idle_transitions(state, interpreter)
