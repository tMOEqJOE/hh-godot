extends ProjectileStateFactory

class_name SubaruStarBallStateFactory

func _init():
	
	states = {
		"Neutral": NeutralState,
		"Active": SubaruStarBallActiveProjectileState,
		"Destroy": SubaruStarBallDestroyState,
	}
