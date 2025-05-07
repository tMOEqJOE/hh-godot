extends AngelJumpState

class_name AngelMidAirJumpState

const MID_AIR_JUMP_SPEED := SGFixed.ONE*-45

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.leftfaceOK] = true
	state[Enums.StKey.velocity_y] = MID_AIR_JUMP_SPEED

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	
