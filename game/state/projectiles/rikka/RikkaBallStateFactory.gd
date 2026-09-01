extends ProjectileStateFactory

class_name RikkaBallStateFactory

func _init():
	
	states = {
		"Neutral": NeutralState,
		"Active": preload("res://game/state/projectiles/rikka/RikkaTagsactiveprojectilestate.gd"),
		"Destroy": preload("res://game/state/projectiles/rikka/RikkaTagsdestroyState.gd"),
	}
