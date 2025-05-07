extends IdleState

class_name DormantState

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			#
			Enums.StKey.Hurt1Disable : true,
			Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt3Disable : true,
			Enums.StKey.WarpOffScreen : true,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("Idle")
	state[Enums.StKey.hitstun] = 0
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = 0

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
#	state[Enums.StKey.velocity_x] = 0
#	state[Enums.StKey.velocity_y] = 0

func handle_input(_state: Dictionary, _interpreter: InputInterpreter) -> void:
	pass

func reaction(_state: Dictionary, _interpreter: InputInterpreter, _event_cause: int) -> void:
	pass
