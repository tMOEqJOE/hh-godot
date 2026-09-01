extends AssistStateFactory

class_name RikkaStateFactory

func _init():
	super._init()
	
	var new_states : Dictionary = {
		"AssistAttack" : preload("res://game/state/assist/Rikka/RikkaAssistAttackState.gd"),
		"AssistAirAttack" : preload("res://game/state/assist/Rikka/RikkaAssistAirAttackState.gd"),
		"AssistAttack2" : preload("res://game/state/assist/Rikka/RikkaAssistAttack2State.gd"),
		"AssistAirAttack2" : preload("res://game/state/assist/Rikka/RikkaAssistAirAttack2State.gd"),
		"AssistSuper" : preload("res://game/state/assist/Rikka/RikkaAssistSuperState.gd"),
		"AssistAirSuper" : preload("res://game/state/assist/Rikka/RikkaAssistAirSuperState.gd"),
		"AssistExit": preload("res://game/state/assist/Rikka/RikkaAssistExitState.gd"),
		"AssistAirExit": preload("res://game/state/assist/Rikka/RikkaAssistAirExitState.gd"),
		"AssistGuardCancelAttack" : preload("res://game/state/assist/Rikka/RikkaAssistGuardCancelAttackState.gd"),
		"AssistAirGuardCancelAttack" : preload("res://game/state/assist/Rikka/RikkaAssistAirGuardCancelAttackState.gd"),
		"AssistWeakGuardCancelAttack" : preload("res://game/state/assist/Rikka/RikkaAssistWeakGuardCancelAttackState.gd"),
		"AssistAirWeakGuardCancelAttack" : preload("res://game/state/assist/Rikka/RikkaAssistAirWeakGuardCancelAttackState.gd"),
	}
	
	merge_state_dictionary(new_states)
