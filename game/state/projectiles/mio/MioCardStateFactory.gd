extends ProjectileStateFactory

class_name MioCardStateFactory

func _init():
	states = {
		"Neutral": NeutralState,
		"Active": preload("res://game/state/projectiles/mio/MioCardactiveprojectilestate.gd"),
		"Destroy": preload("res://game/state/projectiles/mio/MioCarddestroyState.gd"),
	}
