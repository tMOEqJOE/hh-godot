extends OgaAirIdleState

class_name OgaForwardAirDashState

func _init():
	endFrame = 18
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt2PosX : 1048576, Enums.StKey.Hurt2PosY : -24248320,
			Enums.StKey.Hurt2ScaleX : 1318610, Enums.StKey.Hurt2ScaleY : 694300,
			Enums.StKey.Hurt3PosX : -7995392, Enums.StKey.Hurt3PosY : -16842750,
			Enums.StKey.Hurt3ScaleX : 1376776, Enums.StKey.Hurt3ScaleY : 534814,
			},
		4 : {
			Enums.StKey.Summon : "fairdash",
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt2PosX : 1048576, Enums.StKey.Hurt2PosY : -24248320,
			Enums.StKey.Hurt2ScaleX : 1318610, Enums.StKey.Hurt2ScaleY : 694300,
			Enums.StKey.Hurt3PosX : -7995392, Enums.StKey.Hurt3PosY : -16842750,
			Enums.StKey.Hurt3ScaleX : 1376776, Enums.StKey.Hurt3ScaleY : 534814,
		},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.accel_y] = 0
	state[Enums.StKey.airDash] -= 1
	anim.stop(true)
	anim.play("ForwardAirDash")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	
	if (state[Enums.StKey.frame] == 2):
		state[Enums.StKey.velocity_x] = Util.fixed_max(SGFixed.ONE * 22, state[Enums.StKey.velocity_x])
		state[Enums.StKey.velocity_y] = SGFixed.ONE*20
		SyncManager.play_sound("airdash", Global.AirdashSound, {"bus": "Sound"})
	if (positive_bonus(state)):
		state[Enums.StKey.sync_rate] += SGFixed.mul(state[Enums.StKey.velocity_x], 436)
	elif (negative_penalty(state)):
		state[Enums.StKey.sync_rate] -= SGFixed.mul(state[Enums.StKey.velocity_x], 1536)

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
