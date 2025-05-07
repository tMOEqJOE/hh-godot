extends StateFactory

class_name ProjectileStateFactory

func _init():
	
	states = {
		"Neutral": NeutralState,
		"Active": ActiveProjectileState,
		"Destroy": DestroyProjectileState,
	}
