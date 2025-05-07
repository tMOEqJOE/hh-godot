extends AirState

class_name MioAirIdleState

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.kara_OK] = true
