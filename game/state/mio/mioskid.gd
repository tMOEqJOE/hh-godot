extends MioIdleState

class_name MioSkidState

func _init():
	endFrame = 10
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 524288, Enums.StKey.Hurt1PosY : -15532031,
			Enums.StKey.Hurt1ScaleX : 555414, Enums.StKey.Hurt1ScaleY : 748084,
			Enums.StKey.Hurt2PosX : 6422528, Enums.StKey.Hurt2PosY : -15597570,
			Enums.StKey.Hurt2ScaleX : 510595, Enums.StKey.Hurt2ScaleY : -912293,
			Enums.StKey.Hurt3PosX : -65535, Enums.StKey.Hurt3PosY : -7995392,
			Enums.StKey.Hurt3ScaleX : 1279494, Enums.StKey.Hurt3ScaleY : -793638,
			},
	}
	
func enter(state: Dictionary) -> void:
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.accel_x] = 0
	state[Enums.StKey.accel_y] = 0
	state[Enums.StKey.drag_x] = Util.SKID_FRICTION
	state[Enums.StKey.cancelState] = ""
	state[Enums.StKey.hitCount] = 0
	state[Enums.StKey.comboTime] = 0
	state[Enums.StKey.burst_OK] = true
	state[Enums.StKey.kara_OK] = true
	state[Enums.StKey.ground_bounce] = 0
	state[Enums.StKey.wall_bounce] = 0
	state[Enums.StKey.counterOK] = false
	state[Enums.StKey.hitStopFrame] = -1
	state[Enums.StKey.leftfaceOK] = true
	anim.stop(true)
	anim.play("Skid")
	
func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if ((interpreter.is_holding_a_direction(Enums.Numpad.N5, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N4, state[Enums.StKey.leftface])) and
			not (interpreter.is_button_down(Enums.InputFlags.ADown) or
			interpreter.is_button_down(Enums.InputFlags.BDown) or
			interpreter.is_button_down(Enums.InputFlags.CDown) or
			interpreter.is_button_down(Enums.InputFlags.DDown))):
		if (state[Enums.StKey.frame] == endFrame):
			change_state.call("Stand")
	else:
		common_idle_transitions(state, interpreter)
