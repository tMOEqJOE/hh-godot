extends "res://game/state/kanata/kanataJump.gd"

class_name KanataBackwardJumpState

const X_JUMP_SPEED := SGFixed.ONE*-7

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_x] = X_JUMP_SPEED
	state[Enums.StKey.sync_rate] -= 30000
