extends SuicopathAirIdleState

class_name SuicopathJumpFallState

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 2031616, Enums.StKey.Hurt1PosY : -18153472,
			Enums.StKey.Hurt1ScaleX : 1142691, Enums.StKey.Hurt1ScaleY : 1549402,
			Enums.StKey.Hurt2PosX : -655360, Enums.StKey.Hurt2PosY : -18219008,
			Enums.StKey.Hurt2ScaleX : 548413, Enums.StKey.Hurt2ScaleY : -906915,
			Enums.StKey.Hurt3PosX : 6094848, Enums.StKey.Hurt3PosY : -4784128,
			Enums.StKey.Hurt3ScaleX : 1171400, Enums.StKey.Hurt3ScaleY : -464723,
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
	state[Enums.StKey.leftfaceOK] = true # false considered super jump state
	anim.speed_scale = 1
	anim.stop(true)
	anim.play("AngelJumpFall")


func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	common_jump_transitions_default(state, interpreter)

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.BlockingOK:
			return true
		Enums.StateProperty.GroundThrowOK:
			return false
		_:
			return super.has_property(state,property)


func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	var speed = Util.fixed_abs(state[Enums.StKey.velocity_x])
	if (positive_bonus(state)):
		state[Enums.StKey.sync_rate] += SGFixed.mul(speed, 536)
	elif (negative_penalty(state)):
		state[Enums.StKey.sync_rate] -= SGFixed.mul(speed, 1536)
