extends "res://game/state/kanata/mainstates/kanataIdleState.gd"

class_name KanataForwardWalk

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("ForwardWalk")
	state[Enums.StKey.drag_x] = Util.SLIPPERY_FRICTION
	state[Enums.StKey.velocity_y] = 0

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	
	if (positive_bonus(state)):
		state[Enums.StKey.sync_rate] += SGFixed.mul(state[Enums.StKey.velocity_x], 1036)
	elif (negative_penalty(state)):
		state[Enums.StKey.sync_rate] -= SGFixed.mul(Util.fixed_abs(state[Enums.StKey.velocity_x]), 1036)
	
	if (state[Enums.StKey.frame] < 5):
		if (state[Enums.StKey.velocity_x] < SGFixed.ONE*2):
			state[Enums.StKey.velocity_x] = SGFixed.ONE*2
			state[Enums.StKey.drag_x] = 0
	else:
		if (state[Enums.StKey.velocity_x] < SGFixed.ONE*5):
			state[Enums.StKey.velocity_x] = SGFixed.ONE*5
			state[Enums.StKey.drag_x] = 0


func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (not interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) or
			(
				interpreter.is_button_down(Enums.InputFlags.ADown) or
				interpreter.is_button_down(Enums.InputFlags.BDown) or
				interpreter.is_button_down(Enums.InputFlags.CDown) or
				interpreter.is_button_down(Enums.InputFlags.DDown)
			)
		):
		common_idle_transitions(state, interpreter)

