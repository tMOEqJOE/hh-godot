extends ProjectileStateFactory

class_name SubaruBatterSetBallStateFactory

func _init():
	
	states = {
		"Neutral": NeutralState,
		"Active": preload("res://game/state/projectiles/subaru/BatterSetBallactiveprojectilestate.gd"),
		"EnhancedActive": preload("res://game/state/projectiles/subaru/BatterSetBallenhancedprojectilestate.gd"),
		"Destroy": SubaruStarBallDestroyState,
	}
