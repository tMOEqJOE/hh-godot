extends ProjectileStateFactory

class_name AssistSubaruStarBallStateFactory

func _init():
	
	states = {
		"Neutral": NeutralState,
		"Active": preload("res://game/state/projectiles/subaru/AssistStarBallactiveprojectilestate.gd"),
		"Enhance": preload("res://game/state/projectiles/subaru/AssistStarBallenhanceprojectilestate.gd"),
		"Destroy": SubaruStarBallDestroyState,
	}
