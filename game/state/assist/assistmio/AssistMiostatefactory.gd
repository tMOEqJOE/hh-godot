extends AssistStateFactory

class_name AssistMioStateFactory

func _init():
	super._init()
	
	var new_states : Dictionary = {
		"Dormant" : preload("res://game/state/assist/assistmio/AssistMioDormantState.gd"),
		"AssistAttack" : preload("res://game/state/assist/assistmio/AssistMioAssistAttackState.gd"),
		"AssistAirAttack" : preload("res://game/state/assist/assistmio/AssistMioAssistAirAttackState.gd"),
		"AssistSuper" : preload("res://game/state/assist/assistmio/AssistMioAssistSuperState.gd"),
		"AssistAirSuper" : preload("res://game/state/assist/assistmio/AssistMioAssistAirSuperState.gd"),
		"AssistAttack2" : preload("res://game/state/assist/assistmio/AssistMioUnsummonState.gd"),
		"AssistAirAttack2" : preload("res://game/state/assist/assistmio/AssistMioUnsummonState.gd"),
		"LandAttackRecovery" : preload("res://game/state/assist/assistmio/AssistMioLandingRecovery.gd"),
		"AssistExit": preload("res://game/state/assist/assistmio/AssistMioAssistExitState.gd"),
		"AssistAirExit": preload("res://game/state/assist/assistmio/AssistMioAssistAirExitState.gd"),
		"AssistjA": preload("res://game/state/assist/assistmio/AssistMioAssistjAState.gd"),
		"AssistjB": preload("res://game/state/assist/assistmio/AssistMioAssistjBState.gd"),
		"AssistjC": preload("res://game/state/assist/assistmio/AssistMioAssistjCState.gd"),
		"Assist5A": preload("res://game/state/assist/assistmio/AssistMioAssist5AState.gd"),
		"Assist5B": preload("res://game/state/assist/assistmio/AssistMioAssist5BState.gd"),
		"Assist5C": preload("res://game/state/assist/assistmio/AssistMioAssist5CState.gd"),
		"AssistGuardCancelAttack" : preload("res://game/state/assist/assistmio/AssistMioAssistGuardCancelAttackState.gd"),
		"AssistAirGuardCancelAttack" : preload("res://game/state/assist/assistmio/AssistMioAssistAirGuardCancelAttackState.gd"),
		"AssistWeakGuardCancelAttack" : preload("res://game/state/assist/assistmio/AssistMioAssistWeakGuardCancelAttackState.gd"),
		"AssistAirWeakGuardCancelAttack" : preload("res://game/state/assist/assistmio/AssistMioAssistAirWeakGuardCancelAttackState.gd"),
	}
	
	merge_state_dictionary(new_states)
