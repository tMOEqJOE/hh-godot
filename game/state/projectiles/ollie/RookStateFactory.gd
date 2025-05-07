extends ProjectileStateFactory

class_name RookStateFactory

func _init():
	
	states = {
		"Neutral": NeutralState,
		"Active": preload("res://game/state/projectiles/ollie/Rookactiveprojectilestate.gd"),
		"Travel": preload("res://game/state/projectiles/ollie/RookTravelState.gd"),
		"Destroy": preload("res://game/state/projectiles/ollie/RookdestroyState.gd"),
	}
