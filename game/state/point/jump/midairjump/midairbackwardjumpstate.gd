extends MidAirJumpState

class_name BackwardMidAirJumpState

const X_JUMP_SPEED := SGFixed.ONE*-10

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_x] = X_JUMP_SPEED
	state[Enums.StKey.sync_rate] -= 50000
