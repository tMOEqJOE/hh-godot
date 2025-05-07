extends ProjectileStateFactory

class_name AssistProtonCannonStateFactory

func _init():
	
	states = {
		"Neutral": NeutralState,
		"Active": preload("res://game/state/projectiles/ollie/AssistProtonCannonActiveState.gd"),
		"Destroy": preload("res://game/state/projectiles/ollie/ProtonCannondestroyState.gd"),
	}
