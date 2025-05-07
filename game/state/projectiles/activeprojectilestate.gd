extends State

class_name ActiveProjectileState

func _init():
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			#
			Enums.StKey.Hurt1Disable : true,
			Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt3Disable : true,
			},
		5 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hurt1Disable : true,
			Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt3Disable : true,
			},
		20 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			#
			Enums.StKey.Hurt1Disable : true,
			Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Destroy : true,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("Active")

# Writing _delta instead of delta here prevents the unused variable warning.
func physics_tick(state: Dictionary) -> void:
	# NOTE: hitStopFrame == 0 is the "I was in hitstop, and can delay cancel"
	if (state[Enums.StKey.hitStopFrame] == 1):
		# last frame and transition out of hitstop
		anim.speed_scale = 1
#		if (not state[Enums.StKey.cancelState].empty()):
#			change_state.call(state[Enums.StKey.cancelState])
	elif (state[Enums.StKey.hitStopFrame] <= 0):
		# business as usual
		anim.speed_scale = 1
		pass
	elif (state[Enums.StKey.hitStopFrame] > 0):
		# During hitstop
		anim.speed_scale = 0

func reaction(_state: Dictionary, _interpreter: InputInterpreter, _event_cause: int) -> void:
	pass

func handle_input(_state: Dictionary, _interpreter: InputInterpreter) -> void:
	pass

func combo_pushback(_comboTime: int) -> int:
	return 0
