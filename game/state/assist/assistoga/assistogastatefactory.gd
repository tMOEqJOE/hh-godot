extends AssistStateFactory

class_name AssistOgaStateFactory

func _init():
	super._init()
	
	var new_states : Dictionary = {
		"Dormant" : preload("res://game/state/assist/assistoga/AssistOgaDormantState.gd"),
		"AssistAttack" : preload("res://game/state/assist/assistoga/AssistOga5DState.gd"),
		"AssistAirAttack" : preload("res://game/state/assist/assistoga/AssistOgaAssistAirAttackState.gd"),
		"AssistSuper" : preload("res://game/state/assist/assistoga/AssistOgaAssistSuperState.gd"),
		"AssistAirSuper" : preload("res://game/state/assist/assistoga/AssistOgaAssistAirSuperState.gd"),
		"AssistSuperFollowup" : preload("res://game/state/assist/assistoga/AssistOgaAssistSuperFollowupState.gd"),
		"AssistAirSuperFollowup" : preload("res://game/state/assist/assistoga/AssistOgaAssistAirSuperFollowupState.gd"),
		"AssistAttack2" : preload("res://game/state/assist/assistoga/AssistOgaDPState.gd"),
		"AssistAirAttack2" : preload("res://game/state/assist/assistoga/AssistOgaFastFallState.gd"),
		"LandAttackRecovery" : preload("res://game/state/assist/assistoga/AssistOgaLandingRecovery.gd"),
		"AssistExit": preload("res://game/state/assist/assistoga/AssistOgaAssistExitState.gd"),
		"AssistAirExit": preload("res://game/state/assist/assistoga/AssistOgaAssistAirExitState.gd"),
		"AssistGuardCancelAttack" : preload("res://game/state/assist/assistoga/AssistOgaAssistGuardCancelAttackState.gd"),
		"AssistAirGuardCancelAttack" : preload("res://game/state/assist/assistoga/AssistOgaAssistAirGuardCancelAttackState.gd"),
		"AssistWeakGuardCancelAttack" : preload("res://game/state/assist/assistoga/AssistOgaAssistWeakGuardCancelAttackState.gd"),
		"AssistAirWeakGuardCancelAttack" : preload("res://game/state/assist/assistoga/AssistOgaAssistAirWeakGuardCancelAttackState.gd"),
	}
	
	merge_state_dictionary(new_states)
