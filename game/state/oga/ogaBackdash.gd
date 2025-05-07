extends OgaIdleState

class_name OgaBackdashState

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt2PosX : -16842752, Enums.StKey.Hurt2PosY : -18153470,
			Enums.StKey.Hurt2ScaleX : 1318610, Enums.StKey.Hurt2ScaleY : 694300,
			Enums.StKey.Hurt3PosX : -2097152, Enums.StKey.Hurt3PosY : -6160384,
			Enums.StKey.Hurt3ScaleX : 1392639, Enums.StKey.Hurt3ScaleY : 657781,
			},
		3 : {
			Enums.StKey.Summon : "rundust",
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt2PosX : -16842752, Enums.StKey.Hurt2PosY : -18153470,
			Enums.StKey.Hurt2ScaleX : 1318610, Enums.StKey.Hurt2ScaleY : 694300,
			Enums.StKey.Hurt3PosX : -2097152, Enums.StKey.Hurt3PosY : -6160384,
			Enums.StKey.Hurt3ScaleX : 1392639, Enums.StKey.Hurt3ScaleY : 657781,
		},
	}
	
func enter(state: Dictionary) -> void:
	super.enter(state)
#	state[Enums.StKey.velocity_x] = -SGFixed.ONE*10
	state[Enums.StKey.leftfaceOK] = true
	anim.play("BackDash")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	state[Enums.StKey.sync_rate] += SGFixed.mul(state[Enums.StKey.velocity_x], 4536)
	if (state[Enums.StKey.frame] == 3):
		state[Enums.StKey.velocity_x] = -SGFixed.ONE*22
		state[Enums.StKey.drag_x] = SGFixed.ONE*1

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == 0):
		state[Enums.StKey.leftfaceOK] = false
	if (state[Enums.StKey.frame] == 20):
		common_idle_transitions(state, interpreter)
	elif (state[Enums.StKey.frame] >= 10): 
		if (not (interpreter.is_button_down(Enums.InputFlags.ADown) or
				interpreter.is_button_down(Enums.InputFlags.BDown) or
				interpreter.is_button_down(Enums.InputFlags.CDown) or
				interpreter.is_button_down(Enums.InputFlags.DDown))):
			if (interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface])):
				pass
			else:
				common_idle_transitions(state, interpreter)
		else:
			common_idle_transitions(state, interpreter)
	else:
		if (boost_OK(state, interpreter)):
			change_state.call("BoostCancel")

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.BlockingOK:
			return false
		_:
			return super.has_property(state,property)
