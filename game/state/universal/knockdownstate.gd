extends HurtState

class_name KnockdownState

const KnockdownSound = preload("res://game/assets/sfx/HitLvl1.wav")

func _init():
	endFrame = 20
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,
			Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt3Disable : true,
			# Enums.StKey.Hit1PosX : 2025, Enums.StKey.Hit1PosY : -13828096,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("Knockdown")
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = 0
	SyncManager.play_sound("knockdown", KnockdownSound, {"bus": "Sound"})

func physics_tick(state: Dictionary) -> void:
	state[Enums.StKey.comboTime] += 1
	if (state[Enums.StKey.hitStopFrame] == 1):
		# last frame and transition out of hitstop
		if (not state[Enums.StKey.cancelState].is_empty()):
			change_state.call(state[Enums.StKey.cancelState])
	elif (state[Enums.StKey.hitStopFrame] <= 0):
		# business as usual
		pass

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == endFrame):
		change_state.call("Wakeup")

	if (state[Enums.StKey.hitStopFrame] == 0 and not state[Enums.StKey.cancelState].is_empty()):
		# is out of hitstop, and cancellable
		# delay cancel state
		anim.stop(true)
		change_state.call(state[Enums.StKey.cancelState])
	
	meter_cancel(state, interpreter)
