extends HatoIdleState

class_name HatoDormantState

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
	state[Enums.StKey.drag_x] = 0
#	state[Enums.StKey.velocity_x] = 0
#	state[Enums.StKey.velocity_y] = 0

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
#	state[Enums.StKey.velocity_x] = 0
#	state[Enums.StKey.velocity_y] = 0

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.DormantAssist:
			return true
		_:
			return false

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	pass

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	pass
