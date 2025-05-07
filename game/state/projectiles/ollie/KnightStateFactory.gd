extends ProjectileStateFactory

class_name KnightStateFactory

func _init():
	
	states = {
		"Neutral": NeutralState,
		"Active": preload("res://game/state/projectiles/ollie/Knightactiveprojectilestate.gd"),
		"Travel": preload("res://game/state/projectiles/ollie/KnightTravelState.gd"),
		"Destroy": preload("res://game/state/projectiles/ollie/KnightdestroyState.gd"),
	}
