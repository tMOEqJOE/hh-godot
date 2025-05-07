extends AssistHurtAirState

class_name AssistHurtLaunchState

func pushback_multiplier(state: Dictionary):
	# launch_dir_x is usually a high magnitude for grounded pushback, so tone it down for air pushback
	# launches aren't affected tho
	pass

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.AirThrowOK:
			return false
		_:
			return super.has_property(state,property)
