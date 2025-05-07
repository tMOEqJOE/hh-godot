extends HurtState

class_name WakeupState

func _init():
	endFrame = 20
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,
			Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 196607, Enums.StKey.Hurt1PosY : -9830400,
			Enums.StKey.Hurt1ScaleX : 995833, Enums.StKey.Hurt1ScaleY : 994631,
			Enums.StKey.Hurt2PosX : 196607, Enums.StKey.Hurt2PosY : -9830400,
			Enums.StKey.Hurt2ScaleX : 995833, Enums.StKey.Hurt2ScaleY : 994631,
			Enums.StKey.Hurt3PosX : 196607, Enums.StKey.Hurt3PosY : -9830400,
			Enums.StKey.Hurt3ScaleX : 995833, Enums.StKey.Hurt3ScaleY : 994631,
			# Enums.StKey.Hit1PosX : 2025, Enums.StKey.Hit1PosY : -13828096,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("Wakeup")
	state[Enums.StKey.leftfaceOK] = true
	state[Enums.StKey.cancelState] = ""
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = 0
	

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == endFrame):
		state[Enums.StKey.throw_protect] = Util.THROW_PROTECT_FRAME
		state[Enums.StKey.hitstun] = 0
		state[Enums.StKey.blockstun] = 0
		if (not state[Enums.StKey.cancelState].is_empty()):
			change_state.call(state[Enums.StKey.cancelState])
		else:
			common_idle_transitions(state, interpreter)
	elif (state[Enums.StKey.frame] >= endFrame - 2): # Extra buffer frames on wakeup
		wakeup_buffer(state, interpreter)
	elif (state[Enums.StKey.hitStopFrame] == 0 and not state[Enums.StKey.cancelState].is_empty()):
		# is out of hitstop, and cancellable
		# delay cancel state
		anim.stop(true)
		change_state.call(state[Enums.StKey.cancelState])
	
	meter_cancel(state, interpreter)

func physics_tick(state: Dictionary) -> void:
	state[Enums.StKey.comboTime] += 1

func wakeup_buffer(state: Dictionary, interpreter: InputInterpreter) -> void:
	state[Enums.StKey.cancelState] = self.persistent_state.state_factory.common_idle_transitions(state, interpreter)
