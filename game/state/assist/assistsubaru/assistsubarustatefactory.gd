extends AssistStateFactory

class_name AssistSubaruStateFactory

func _init():
	super._init()
	
	var new_states : Dictionary = {
		"AssistAttack" : preload("res://game/state/assist/assistsubaru/AssistSubaruAssistAttackState.gd"),
		"AssistAirAttack" : preload("res://game/state/assist/assistsubaru/AssistSubaruAssistAirAttackState.gd"),
		"AssistAttack2" : preload("res://game/state/assist/assistsubaru/AssistSubaruAssistAttack2State.gd"),
		"AssistAirAttack2" : preload("res://game/state/assist/assistsubaru/AssistSubaruAssistAirAttack2State.gd"),
		"AssistSuper" : preload("res://game/state/assist/assistsubaru/AssistSubaruAssistSuperState.gd"),
		"AssistAirSuper" : preload("res://game/state/assist/assistsubaru/AssistSubaruAssistAirSuperState.gd"),
		"AssistExit": preload("res://game/state/assist/assistsubaru/AssistSubaruAssistExitState.gd"),
		"AssistAirExit": preload("res://game/state/assist/assistsubaru/AssistSubaruAssistAirExitState.gd"),
		"AssistGuardCancelAttack" : preload("res://game/state/assist/assistsubaru/AssistSubaruAssistGuardCancelAttackState.gd"),
		"AssistAirGuardCancelAttack" : preload("res://game/state/assist/assistsubaru/AssistSubaruAssistAirGuardCancelAttackState.gd"),
		"AssistWeakGuardCancelAttack" : preload("res://game/state/assist/assistsubaru/AssistSubaruAssistWeakGuardCancelAttackState.gd"),
		"AssistAirWeakGuardCancelAttack" : preload("res://game/state/assist/assistsubaru/AssistSubaruAssistAirWeakGuardCancelAttackState.gd"),
	}
	
	merge_state_dictionary(new_states)
