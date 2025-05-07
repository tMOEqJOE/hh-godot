extends ProjectileStateFactory

class_name ChargeBishopStateFactory

func _init():
	
	states = {
		"Neutral": NeutralState,
		"Active": preload("res://game/state/projectiles/ollie/Bishopactiveprojectilestate.gd"),
		"Travel": preload("res://game/state/projectiles/ollie/ChargeBishopTravelState.gd"),
		"Destroy": preload("res://game/state/projectiles/ollie/BishopdestroyState.gd"),
	}
