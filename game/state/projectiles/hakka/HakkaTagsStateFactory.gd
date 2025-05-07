extends ProjectileStateFactory

class_name HakkaTagsStateFactory

func _init():
	
	states = {
		"Neutral": NeutralState,
		"Active": preload("res://game/state/projectiles/hakka/HakkaTagsactiveprojectilestate.gd"),
		"Destroy": preload("res://game/state/projectiles/hakka/HakkaTagsdestroyState.gd"),
	}
