extends OgaJumpState

class_name OgaJumpFallState

func _init():
	anim_data = {
		0 : {
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -8126464, Enums.StKey.Hurt1PosY : -6029311,
			Enums.StKey.Hurt1ScaleX : 498353, Enums.StKey.Hurt1ScaleY : 442051,
			Enums.StKey.Hurt2PosX : -1441792, Enums.StKey.Hurt2PosY : -43384832,
			Enums.StKey.Hurt2ScaleX : 896391, Enums.StKey.Hurt2ScaleY : -1190856,
			Enums.StKey.Hurt3PosX : -2293760, Enums.StKey.Hurt3PosY : -23658496,
			Enums.StKey.Hurt3ScaleX : 519088, Enums.StKey.Hurt3ScaleY : 1416473,
			},
	}

func enter(state: Dictionary) -> void:
	state[Enums.StKey.accel_x] = 0
	state[Enums.StKey.accel_y] = Util.GRAVITY
	state[Enums.StKey.drag_x] = 0
	state[Enums.StKey.cancelState] = ""
	state[Enums.StKey.hitCount] = 0
	state[Enums.StKey.comboTime] = 0
	state[Enums.StKey.burst_OK] = true
	state[Enums.StKey.kara_OK] = true
	state[Enums.StKey.ground_bounce] = 0
	state[Enums.StKey.wall_bounce] = 0
	state[Enums.StKey.counterOK] = false
	state[Enums.StKey.hitStopFrame] = -1
	state[Enums.StKey.leftfaceOK] = false
	anim.speed_scale = 1
	anim.stop(true)
	anim.play("JumpFall")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	var speed = Util.fixed_abs(state[Enums.StKey.velocity_x])
	if (positive_bonus(state)):
		state[Enums.StKey.sync_rate] += SGFixed.mul(speed, 536)
	elif (negative_penalty(state)):
		state[Enums.StKey.sync_rate] -= SGFixed.mul(speed, 1536)
