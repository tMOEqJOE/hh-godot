extends SuicopathIdleState

class_name SuicopathBackDashState

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
		10 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 2031616, Enums.StKey.Hurt1PosY : -18153472,
			Enums.StKey.Hurt1ScaleX : 803879, Enums.StKey.Hurt1ScaleY : 1926445,
			},
	}
	
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.leftfaceOK] = true
	state[Enums.StKey.drag_x] = SGFixed.ONE
	anim.play("AngelBackDash")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	state[Enums.StKey.sync_rate] -= SGFixed.mul(Util.fixed_abs(state[Enums.StKey.velocity_x]), 5536)
	state[Enums.StKey.assist_meter] -= SGFixed.ONE*220

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == 0):
		state[Enums.StKey.leftfaceOK] = false
	if (state[Enums.StKey.frame] == endFrame):
		common_idle_transitions(state, interpreter)
	
	if (boost_OK(state, interpreter)):
		change_state.call("AngelBoostCancel")

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.BlockingOK:
			return false
		Enums.StateProperty.GroundThrowOK:
			return false
		Enums.StateProperty.AirThrowOK:
			return false
		_:
			return super.has_property(state,property)
