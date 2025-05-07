extends AssistStateFactory

class_name SanaStateFactory

func _init():
	super._init()
	
	var new_states : Dictionary = {
		"Dormant" : preload("res://game/state/assist/sana/SanaDormantState.gd"),
		"AssistAttack" : preload("res://game/state/assist/sana/SanaAssistAirAttackState.gd"),
		"AssistAirAttack" : preload("res://game/state/assist/sana/SanaAssistAirAttackState.gd"),
		"AssistSuper" : preload("res://game/state/assist/sana/SanaAssistAirSuperState.gd"),
		"AssistAirSuper" : preload("res://game/state/assist/sana/SanaAssistAirSuperState.gd"),
		"AssistAttack2" : preload("res://game/state/assist/sana/SanaAirPilotState.gd"),
		"AssistAirAttack2" : preload("res://game/state/assist/sana/SanaAirPilotState.gd"),
		"LandAttackRecovery" : preload("res://game/state/assist/sana/SanaLandingRecovery.gd"),
		"AssistExit": preload("res://game/state/assist/sana/SanaAssistAirExitState.gd"),
		"AssistAirExit": preload("res://game/state/assist/sana/SanaAssistAirExitState.gd"),
		"AssistGuardCancelAttack" : preload("res://game/state/assist/sana/SanaAssistAirGuardCancelAttackState.gd"),
		"AssistAirGuardCancelAttack" : preload("res://game/state/assist/sana/SanaAssistAirGuardCancelAttackState.gd"),
		"AssistWeakGuardCancelAttack" : preload("res://game/state/assist/sana/SanaAssistAirWeakGuardCancelAttackState.gd"),
		"AssistAirWeakGuardCancelAttack" : preload("res://game/state/assist/sana/SanaAssistAirWeakGuardCancelAttackState.gd"),
	}
	
	merge_state_dictionary(new_states)
