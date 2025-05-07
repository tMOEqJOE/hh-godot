extends StateFactory

class_name PuppetStateFactory

func _init():
	super._init()
	
	var new_states : Dictionary = {
		"Dormant" : preload("res://game/state/hato/HatoDormantState.gd"),
		Enums.StKey.Summon : DormantState, #TODO: is this OK?
		
		"HurtStand": HatoHurtState,
		
		"Stand" : HatoStandState,
		"ForwardWalk": HatoForwardWalkState,
		"BackwardWalk": HatoBackwardWalkState,
		
		"Stand5A": HatoStand5AState,
		"Stand5B": HatoStand5BState,
		"Stand5C": HatoStand5CState,
		
		"HatoCards": HatoCardsState,
		
		"Intro": HatoIntroState,
	}
	
	merge_state_dictionary(new_states)
