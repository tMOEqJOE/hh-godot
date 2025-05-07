extends "res://game/state/kanata/mainstates/kanataAirIdleState.gd"

class_name KanataRunState

func _init():
	endFrame = 50
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 483040, Enums.StKey.Hurt1PosY : -10842752,
			Enums.StKey.Hurt1ScaleX : 1270505, Enums.StKey.Hurt1ScaleY : 1034158,
			},
		2 : {
			Enums.StKey.Summon : "rundust",
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 483040, Enums.StKey.Hurt1PosY : -13842752,
			Enums.StKey.Hurt1ScaleX : 1270505, Enums.StKey.Hurt1ScaleY : 834158,
		},
	}
	
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("Run")
	state[Enums.StKey.accel_y] = 105536

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 1):
		state[Enums.StKey.velocity_x] = Util.fixed_max(SGFixed.ONE*12, state[Enums.StKey.velocity_x])
		state[Enums.StKey.velocity_y] = -SGFixed.ONE*17

	if (positive_bonus(state)):
		state[Enums.StKey.sync_rate] += SGFixed.mul(state[Enums.StKey.velocity_x], 936)
	elif (negative_penalty(state)):
		state[Enums.StKey.sync_rate] -= SGFixed.mul(Util.fixed_abs(state[Enums.StKey.velocity_x]), 1036)

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == 0):
		state[Enums.StKey.leftfaceOK] = false
	if (state[Enums.StKey.frame] == endFrame):
		common_jump_transitions(state, interpreter)
	
	if (boost_OK(state, interpreter)):
		change_state.call("AirBoostCancel")

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.BlockingOK:
			return false
		_:
			return super.has_property(state,property)

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand):
		if (state[Enums.StKey.frame] >= 4):
			state[Enums.StKey.doubleJump] = 1
			state[Enums.StKey.airDash] = 1
			state[Enums.StKey.leftfaceOK] = true
			change_state.call("Stand")
	else:
		super.reaction(state, interpreter, event_cause)
