extends HatoIdleState

class_name HatoHurtState

var voice = preload("res://game/assets/voice/mio/mio_sparkle barf.wav")

func _init():
	endFrame = 30
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : true,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("StandHighHit")
	state[Enums.StKey.drag_x] = Util.MOD_FRICTION
	state[Enums.StKey.leftfaceOK] = false

# Writing _delta instead of delta here prevents the unused variable warning.
func physics_tick(state: Dictionary) -> void:
	if (state[Enums.StKey.frame] == endFrame):
		change_state.call("Dormant")
	elif (state[Enums.StKey.frame] == 3):
		SyncManager.play_sound("HatoVoice", voice, {"bus": "Voice"})
		SyncManager.play_sound("HatoVoiceReverb", voice, {"bus": "ReverbVoice"})


func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	pass
