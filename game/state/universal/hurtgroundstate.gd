extends HurtState

class_name HurtGroundState

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("StandHighHit")
	state[Enums.StKey.drag_x] = Util.MOD_FRICTION
	state[Enums.StKey.velocity_y] = 0

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.GroundThrowOK:
			return true
		_:
			return super.has_property(state, property)
