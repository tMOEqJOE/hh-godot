extends HatoIdleState

class_name HatoStandState

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hurt1Disable : false,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1PosX : -327680, Enums.StKey.Hurt1PosY : -20447234,
			Enums.StKey.Hurt1ScaleX : 841262, Enums.StKey.Hurt1ScaleY : 1777410,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("Idle")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (not interpreter.is_holding_a_direction(Enums.Numpad.N5, state[Enums.StKey.leftface]) or
			(
				interpreter.is_button_down(Enums.InputFlags.AUp) or
				interpreter.is_button_down(Enums.InputFlags.BUp) or
				interpreter.is_button_down(Enums.InputFlags.CUp) or
				interpreter.is_button_down(Enums.InputFlags.DUp)
			)
		):
		common_idle_transitions(state, interpreter)
