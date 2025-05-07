extends ProjectileStateFactory

class_name ProtonCannonStateFactory

func _init():
	
	states = {
		"Neutral": NeutralState,
		"Active": preload("res://game/state/projectiles/ollie/ProtonCannonActiveState.gd"),
		"Destroy": preload("res://game/state/projectiles/ollie/ProtonCannondestroyState.gd"),
	}
