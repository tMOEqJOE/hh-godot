extends AirBlockState

class_name AirJustBlockState


# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("AirBlock")
	state[Enums.StKey.doubleJump] = 1
	state[Enums.StKey.airDash] = 1
	state[Enums.StKey.hitstun] -= Util.IB_REDUCED_AIR_BLOCKSTUN
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = -SGFixed.ONE*2
	state[Enums.StKey.sync_rate] += SGFixed.ONE*5
