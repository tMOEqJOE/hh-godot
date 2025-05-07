extends ProjectileStateFactory

class_name AirKnightStateFactory

func _init():
	
	states = {
		"Neutral": NeutralState,
		"Active": preload("res://game/state/projectiles/ollie/Knightactiveprojectilestate.gd"),
		"Travel": preload("res://game/state/projectiles/ollie/AirKnightTravelState.gd"),
		"Destroy": preload("res://game/state/projectiles/ollie/KnightdestroyState.gd"),
	}
