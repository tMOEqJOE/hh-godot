extends AssistStateFactory

class_name FubukiStateFactory

func _init():
	super._init()
	
	var new_states : Dictionary = {
		"Dormant" : FubukiDormantState,
		"AssistAttack" : FubukiAssistAttackState,
		"AssistAirAttack" : FubukiAssistAirAttackState,
		"AssistSuper" : FubukiSuperState,
		"AssistAirSuper" : FubukiAirSuperState,
		"AssistAttack2" : FubukiDPState,
		"AssistAirAttack2" : FubukiDPState,
		"LandAttackRecovery" : FubukiLandingRecoveryState,
		"AssistExit": FubukiAssistExitState,
		"AssistAirExit": FubukiAssistAirExitState,
		"AssistGuardCancelAttack" : FubukiAssistGuardCancelAttackState,
		"AssistAirGuardCancelAttack" : FubukiAssistAirGuardCancelAttackState,
		"AssistWeakGuardCancelAttack" : FubukiAssistWeakGuardCancelAttackState,
		"AssistAirWeakGuardCancelAttack" : FubukiAssistAirWeakGuardCancelAttackState,
		"AssistBurst" : FubukiBurstState,
	}
	
	merge_state_dictionary(new_states)
