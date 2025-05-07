extends ProjectileStateFactory

class_name QueenStateFactory

func _init():
	
	states = {
		"Neutral": NeutralState,
		"Travel": preload("res://game/state/projectiles/ollie/QueenTravelState.gd"),
		"Active": preload("res://game/state/projectiles/ollie/Queenactiveprojectilestate.gd"),
		"Destroy": preload("res://game/state/projectiles/ollie/QueendestroyState.gd"),
	}
