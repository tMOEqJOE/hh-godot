extends SuiseiYoruMatsuyoState

class_name SuiseiLightYoruMatsuyoState

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 4):
		state[Enums.StKey.velocity_y] = -SGFixed.ONE * 70
		state[Enums.StKey.accel_y] = Util.GRAVITY+65536
		state[Enums.StKey.velocity_x] = Util.fixed_max(SGFixed.ONE*3, SGFixed.mul(state[Enums.StKey.velocity_x], 30536))
