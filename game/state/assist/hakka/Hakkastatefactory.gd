extends AssistStateFactory

class_name HakkaStateFactory

func _init():
	super._init()
	
	var new_states : Dictionary = {
		"Dormant" : preload("res://game/state/assist/hakka/HakkaDormantState.gd"),
		"AssistAttack" : preload("res://game/state/assist/hakka/HakkaAssistAttackState.gd"),
		"AssistAirAttack" : preload("res://game/state/assist/hakka/HakkaAssistAirAttackState.gd"),
		"AssistAttack2" : preload("res://game/state/assist/hakka/HakkaAssistAirAttack2State.gd"),
		"AssistAirAttack2" : preload("res://game/state/assist/hakka/HakkaAssistAirAttack2State.gd"),
		"AssistSuper" : preload("res://game/state/assist/hakka/HakkaAssistAirSuperState.gd"),
		"AssistAirSuper" : preload("res://game/state/assist/hakka/HakkaAssistAirSuperState.gd"),
		"AirSuperCharge1" : preload("res://game/state/assist/hakka/HakkaAirSuperCharge1.gd"),
		"AirSuperCharge2" : preload("res://game/state/assist/hakka/HakkaAirSuperCharge2.gd"),
		"AirSuperCharge3" : preload("res://game/state/assist/hakka/HakkaAirSuperCharge3.gd"),
		"LandAttackRecovery" : preload("res://game/state/assist/hakka/HakkaLandingRecovery.gd"),
		"AssistExit": preload("res://game/state/assist/hakka/HakkaAssistExitState.gd"),
		"AssistAirExit": preload("res://game/state/assist/hakka/HakkaAssistAirExitState.gd"),
		"AssistGuardCancelAttack" : preload("res://game/state/assist/hakka/HakkaAssistGuardCancelAttackState.gd"),
		"AssistAirGuardCancelAttack" : preload("res://game/state/assist/hakka/HakkaAssistAirGuardCancelAttackState.gd"),
		"AssistWeakGuardCancelAttack" : preload("res://game/state/assist/hakka/HakkaAssistWeakGuardCancelAttackState.gd"),
		"AssistAirWeakGuardCancelAttack" : preload("res://game/state/assist/hakka/HakkaAssistAirWeakGuardCancelAttackState.gd"),
	}
	
	merge_state_dictionary(new_states)
