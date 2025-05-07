extends AirReactionState

class_name AirTechState

func _init():
	endFrame = 15
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,
			Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt3Disable : true,
			},
	}


# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	state[Enums.StKey.accel_x] = 0
	state[Enums.StKey.accel_y] = -Util.GRAVITY
	state[Enums.StKey.drag_x] = 0
	state[Enums.StKey.cancelState] = ""
	state[Enums.StKey.hitCount] = 0
	state[Enums.StKey.comboTime] = 0
	state[Enums.StKey.ground_bounce] = 0
	state[Enums.StKey.wall_bounce] = 0
	state[Enums.StKey.burst_OK] = true
	state[Enums.StKey.kara_OK] = true
	state[Enums.StKey.counterOK] = false
	state[Enums.StKey.hitStopFrame] = -1
	state[Enums.StKey.doubleJump] = 1
	state[Enums.StKey.airDash] = 1
	state[Enums.StKey.velocity_y] = SGFixed.mul(state[Enums.StKey.velocity_y], SGFixed.HALF)
	if (state[Enums.StKey.velocity_y] >= -SGFixed.ONE*5):
		state[Enums.StKey.velocity_y] = -SGFixed.ONE*5
	anim.stop(true)
	anim.play("AirTech")

func physics_tick(state: Dictionary) -> void:
	if (state[Enums.StKey.frame] == 2):
		state[Enums.StKey.accel_y] = Util.GRAVITY
	elif (state[Enums.StKey.frame] == 4):
		SyncManager.play_sound("airtech", Global.AirTechSound, {"bus": "Sound"})
	

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == endFrame):
		common_jump_transitions(state, interpreter)
