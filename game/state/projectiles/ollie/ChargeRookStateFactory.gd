extends ProjectileStateFactory

class_name ChargeRookStateFactory

func _init():
	
	states = {
		"Neutral": NeutralState,
		"Active": preload("res://game/state/projectiles/ollie/Rookactiveprojectilestate.gd"),
		"Travel": preload("res://game/state/projectiles/ollie/ChargeRookTravelState.gd"),
		"Destroy": preload("res://game/state/projectiles/ollie/RookdestroyState.gd"),
	}
