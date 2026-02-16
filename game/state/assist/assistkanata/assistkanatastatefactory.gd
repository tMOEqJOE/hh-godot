extends AssistStateFactory

class_name AssistKanataStateFactory

func _init():
	super._init()
	
	var new_states : Dictionary = {
		"AssistAttack" : preload("res://game/state/assist/assistkanata/AssistKanataAssistAttackState.gd"),
		"AssistAttackFollowup" : preload("res://game/state/assist/assistkanata/AssistKanataAssistAttackFollowupState.gd"),
		"AssistAirAttack" : preload("res://game/state/assist/assistkanata/AssistKanataAssistAirAttackState.gd"),
		"AssistAirAttackFollowup" : preload("res://game/state/assist/assistkanata/AssistKanataAssistAirAttackFollowupState.gd"),
		"AssistAttack2" : preload("res://game/state/assist/assistkanata/AssistKanataAssistAttack2State.gd"),
		"AssistAirAttack2" : preload("res://game/state/assist/assistkanata/AssistKanataAssistAirAttack2State.gd"),
		"AssistSuper" : preload("res://game/state/assist/assistkanata/AssistKanataAssistSuperState.gd"),
		"AssistAirSuper" : preload("res://game/state/assist/assistkanata/AssistKanataAssistAirSuperState.gd"),
		"AssistExit": preload("res://game/state/assist/assistkanata/AssistKanataAssistExitState.gd"),
		"AssistAirExit": preload("res://game/state/assist/assistkanata/AssistKanataAssistAirExitState.gd"),
		"AssistGuardCancelAttack" : preload("res://game/state/assist/assistkanata/AssistKanataAssistGuardCancelAttackState.gd"),
		"AssistAirGuardCancelAttack" : preload("res://game/state/assist/assistkanata/AssistKanataAssistAirGuardCancelAttackState.gd"),
		"AssistWeakGuardCancelAttack" : preload("res://game/state/assist/assistkanata/AssistKanataAssistWeakGuardCancelAttackState.gd"),
		"AssistAirWeakGuardCancelAttack" : preload("res://game/state/assist/assistkanata/AssistKanataAssistAirWeakGuardCancelAttackState.gd"),
	}
	
	merge_state_dictionary(new_states)
