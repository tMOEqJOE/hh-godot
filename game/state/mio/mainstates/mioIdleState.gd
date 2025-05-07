extends IdleState

class_name MioIdleState

func _init():
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -655359, Enums.StKey.Hurt1PosY : -28114944,
			Enums.StKey.Hurt1ScaleX : 276315, Enums.StKey.Hurt1ScaleY : 303423,
			Enums.StKey.Hurt2PosX : 65536, Enums.StKey.Hurt2PosY : -18284544,
			Enums.StKey.Hurt2ScaleX : 430035, Enums.StKey.Hurt2ScaleY : -705015,
			Enums.StKey.Hurt3PosX : 327680, Enums.StKey.Hurt3PosY : -5963776,
			Enums.StKey.Hurt3ScaleX : 430035, Enums.StKey.Hurt3ScaleY : -705015,
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
