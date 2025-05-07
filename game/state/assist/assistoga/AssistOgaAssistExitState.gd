extends "res://game/state/assist/assistoga/AssistOgaAssistAttackState.gd"

class_name AssistOgaAssistExitState

func _init():
	endFrame = Util.ASSIST_EXIT_RECOVERY
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -23842752,
			Enums.StKey.Hurt1ScaleX : 1070460, Enums.StKey.Hurt1ScaleY : 2443505,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.drag_x] = Util.SLIPPERY_FRICTION
	anim.play("Exit")

func physics_tick(state: Dictionary) -> void:
	pass

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == endFrame):
		change_state.call("Dormant")
	if (state[Enums.StKey.hitStopFrame] == 0 and not state[Enums.StKey.cancelState].is_empty()):
		# is out of hitstop, and cancellable
		# delay cancel state
		anim.stop(true)
		change_state.call(state[Enums.StKey.cancelState])
	
	gatling_cancel(state, interpreter)
