extends ProjectileStateFactory

class_name SuicopathChainsawStateFactory

func _init():
	states = {
		"Neutral": NeutralState,
		"Active": preload("res://game/state/projectiles/suisei/Chainsawactiveprojectilestate.gd"),
		"Destroy": preload("res://game/state/projectiles/suisei/ChainsawdestroyState.gd"),
	}
