extends ProjectileStateFactory

class_name BishopStateFactory

func _init():
	
	states = {
		"Neutral": NeutralState,
		"Active": preload("res://game/state/projectiles/ollie/Bishopactiveprojectilestate.gd"),
		"Travel": preload("res://game/state/projectiles/ollie/BishopTravelState.gd"),
		"Destroy": preload("res://game/state/projectiles/ollie/BishopdestroyState.gd"),
	}
