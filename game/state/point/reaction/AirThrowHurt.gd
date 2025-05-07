extends HurtAirState

class_name AirThrowHurtState

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("ThrowHurt")
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.accel_y] = 0

func meter_cancel(_state: Dictionary, _interpreter: InputInterpreter):
	pass

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.Capture:
			return true
		_:
			return super.has_property(state, property)
