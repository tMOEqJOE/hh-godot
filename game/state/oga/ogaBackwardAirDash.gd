extends OgaAirIdleState

class_name OgaBackwardAirDashState

func _init():
	endFrame = 18
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -3997695, Enums.StKey.Hurt1PosY : -20185088,
			Enums.StKey.Hurt1ScaleX : 1708691, Enums.StKey.Hurt1ScaleY : -683026,
			},
		4 : {
			Enums.StKey.Summon : "bairdash",
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
		},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.accel_y] = 0
	state[Enums.StKey.airDash] -= 1
	anim.stop(true)
	anim.play("BackwardAirDash")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	
	if (state[Enums.StKey.frame] == 2):
		state[Enums.StKey.velocity_x] = -SGFixed.ONE*20
		state[Enums.StKey.velocity_y] = SGFixed.ONE*20
		SyncManager.play_sound("airdash", Global.AirdashSound, {"bus": "Sound"})

	if (positive_bonus(state)):
		state[Enums.StKey.sync_rate] += -SGFixed.mul(state[Enums.StKey.velocity_x], 536)
	elif (negative_penalty(state)):
		state[Enums.StKey.sync_rate] += SGFixed.mul(state[Enums.StKey.velocity_x], 2836)

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == endFrame):
		change_state.call("JumpFall")
		state[Enums.StKey.velocity_x] = SGFixed.mul(state[Enums.StKey.velocity_x], 45536)
	elif (state[Enums.StKey.frame] == endFrame - 1):
		state[Enums.StKey.leftfaceOK] = true
	elif (boost_OK(state, interpreter)):
		change_state.call("AirBoostCancel")
	elif (state[Enums.StKey.frame] >= 4):
		if (common_jump_transitions_default(state, interpreter)):
			state[Enums.StKey.velocity_y] = SGFixed.ONE*5
			state[Enums.StKey.velocity_x] = SGFixed.mul(state[Enums.StKey.velocity_x], 45536)

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.BlockingOK:
			return false
		_:
			return super.has_property(state,property)
