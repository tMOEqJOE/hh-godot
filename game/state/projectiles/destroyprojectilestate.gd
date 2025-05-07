extends State

class_name DestroyProjectileState

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
		20 : {
			Enums.StKey.Destroy : true,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("Destroy")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)

func handle_input(_state: Dictionary, _interpreter: InputInterpreter) -> void:
	pass

func reaction(_state: Dictionary, _interpreter: InputInterpreter, _event_cause: int) -> void:
	pass

func combo_pushback(_comboTime: int) -> int:
	return 0
