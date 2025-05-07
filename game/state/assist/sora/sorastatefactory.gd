extends AssistStateFactory

class_name SoraStateFactory

func _init():
	super._init()
	
	var new_states : Dictionary = {
		"Dormant" : SoraDormantState,
		"AssistAttack" : SoraAssistAttackState,
		"AssistAirAttack" : SoraAssistAirAttackState,
		"AssistSuper" : SoraSuperState,
		"AssistAirSuper" : SoraAirSuperState,
		"AssistAttack2" : SoraPaintState,
		"AssistAirAttack2" : SoraAirPaintState,
		"LandAttackRecovery" : SoraLandingRecoveryState,
		"AssistExit": SoraAssistExitState,
		"AssistAirExit": SoraAssistAirExitState,
		"AssistGuardCancelAttack" : SoraAssistGuardCancelAttackState,
		"AssistAirGuardCancelAttack" : SoraAssistAirGuardCancelAttackState,
		"AssistWeakGuardCancelAttack" : SoraAssistWeakGuardCancelAttackState,
		"AssistAirWeakGuardCancelAttack" : SoraAssistAirWeakGuardCancelAttackState,
		"AssistBurst": SoraBurstState,
	}
	
	merge_state_dictionary(new_states)
