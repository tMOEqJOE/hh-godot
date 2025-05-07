extends AngelStandBlockState

class_name AngelStandJustBlockState

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.hitstun] -= Util.IB_REDUCED_BLOCKSTUN
	state[Enums.StKey.doubleJump] = 1
	state[Enums.StKey.airDash] = 1
	state[Enums.StKey.velocity_x] = SGFixed.mul(state[Enums.StKey.velocity_x], Util.STAND_IB_PUSHBACK_MULT)
	state[Enums.StKey.sync_rate] += SGFixed.ONE*5
