extends AssistStateFactory

class_name AssistOllieStateFactory

func _init():
	super._init()
	
	var new_states : Dictionary = {
		"AssistAttack" : preload("res://game/state/assist/assistollie/AssistOllieAssistAttackState.gd"),
		"AssistAirAttack" : preload("res://game/state/assist/assistollie/AssistOllieAssistAirAttackState.gd"),
		"AssistAttack2" : preload("res://game/state/assist/assistollie/AssistOllieAssistAttack2State.gd"),
		"AssistAirAttack2" : preload("res://game/state/assist/assistollie/AssistOllieAssistAirAttack2State.gd"),
		"AssistSuper" : preload("res://game/state/assist/assistollie/AssistOllieAssistSuperState.gd"),
		"AssistAirSuper" : preload("res://game/state/assist/assistollie/AssistOllieAssistAirSuperState.gd"),
		"AssistExit": preload("res://game/state/assist/assistollie/AssistOllieAssistExitState.gd"),
		"AssistAirExit": preload("res://game/state/assist/assistollie/AssistOllieAssistAirExitState.gd"),
		"AssistGuardCancelAttack" : preload("res://game/state/assist/assistollie/AssistOllieAssistGuardCancelAttackState.gd"),
		"AssistAirGuardCancelAttack" : preload("res://game/state/assist/assistollie/AssistOllieAssistAirGuardCancelAttackState.gd"),
		"AssistWeakGuardCancelAttack" : preload("res://game/state/assist/assistollie/AssistOllieAssistWeakGuardCancelAttackState.gd"),
		"AssistAirWeakGuardCancelAttack" : preload("res://game/state/assist/assistollie/AssistOllieAssistAirWeakGuardCancelAttackState.gd"),
	}
	
	merge_state_dictionary(new_states)
