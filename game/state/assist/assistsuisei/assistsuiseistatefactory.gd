extends AssistStateFactory

class_name AssistSuiseiStateFactory

func _init():
	super._init()
	
	var new_states : Dictionary = {
		"AssistAttack" : preload("res://game/state/assist/assistsuisei/AssistSuiseiAssistAttackState.gd"),
		"AssistAirAttack" : preload("res://game/state/assist/assistsuisei/AssistSuiseiAssistAirAttackState.gd"),
		"AssistAttack2" : preload("res://game/state/assist/assistsuisei/AssistSuiseiAssistAttack2State.gd"),
		"AssistAirAttack2" : preload("res://game/state/assist/assistsuisei/AssistSuiseiAssistAirAttack2State.gd"),
		"AssistSuper" : preload("res://game/state/assist/assistsuisei/AssistSuiseiAssistSuperState.gd"),
		"AssistAirSuper" : preload("res://game/state/assist/assistsuisei/AssistSuiseiAssistAirSuperState.gd"),
		"AssistExit": preload("res://game/state/assist/assistsuisei/AssistSuiseiAssistExitState.gd"),
		"AssistAirExit": preload("res://game/state/assist/assistsuisei/AssistSuiseiAssistAirExitState.gd"),
		"AssistGuardCancelAttack" : preload("res://game/state/assist/assistsuisei/AssistSuiseiAssistGuardCancelAttackState.gd"),
		"AssistAirGuardCancelAttack" : preload("res://game/state/assist/assistsuisei/AssistSuiseiAssistAirGuardCancelAttackState.gd"),
		"AssistWeakGuardCancelAttack" : preload("res://game/state/assist/assistsuisei/AssistSuiseiAssistWeakGuardCancelAttackState.gd"),
		"AssistAirWeakGuardCancelAttack" : preload("res://game/state/assist/assistsuisei/AssistSuiseiAssistAirWeakGuardCancelAttackState.gd"),
	
		"ASuicoDormant" : preload("res://game/state/assist/assistsuisei/AssistASuicoDormantState.gd"),
		"ASuicoAssistAttack" : preload("res://game/state/assist/assistsuisei/AssistASuicoAssistAttackState.gd"),
		"ASuicoAssistAirAttack" : preload("res://game/state/assist/assistsuisei/AssistASuicoAssistAirAttackState.gd"),
		"ASuicoAssistAttack2" : preload("res://game/state/assist/assistsuisei/AssistASuicoAssistAttack2State.gd"),
		"ASuicoAssistAttackFollowup" : preload("res://game/state/assist/assistsuisei/AssistASuicoAssistAirAttackFollowupState.gd"),
		"ASuicoAssistAirAttack2" : preload("res://game/state/assist/assistsuisei/AssistASuicoAssistAirAttack2State.gd"),
		"ASuicoAssistSuper" : preload("res://game/state/assist/assistsuisei/AssistASuicoAssistSuperState.gd"),
		"ASuicoAssistAirSuper" : preload("res://game/state/assist/assistsuisei/AssistASuicoAssistAirSuperState.gd"),
		"ASuicoAssistGuardCancelAttack" : preload("res://game/state/assist/assistsuisei/AssistASuicoAssistGuardCancelAttackState.gd"),
		"ASuicoAssistAirGuardCancelAttack" : preload("res://game/state/assist/assistsuisei/AssistASuicoAssistAirGuardCancelAttackState.gd"),
		"ASuicoAssistWeakGuardCancelAttack" : preload("res://game/state/assist/assistsuisei/AssistASuicoAssistWeakGuardCancelAttackState.gd"),
		"ASuicoAssistAirWeakGuardCancelAttack" : preload("res://game/state/assist/assistsuisei/AssistASuicoAssistAirWeakGuardCancelAttackState.gd"),
		"ASuicoAssistBurst" : preload("res://game/state/assist/assistsuisei/AssistASuicoAssistBurstState.gd"),
		"ASuicoAssistExit": preload("res://game/state/assist/assistsuisei/AssistASuicoAssistExitState.gd"),
		"ASuicoAssistAirExit": preload("res://game/state/assist/assistsuisei/AssistASuicoAssistAirExitState.gd"),
		"ASuicoLandAttackRecovery" : preload("res://game/state/assist/assistsuisei/AssistASuicoAssistLandingRecoveryState.gd"),

		"ASuicoHurtStand": preload("res://game/state/assist/assistsuisei/AssistASuicoAssistHurtGroundState.gd"),
		"ASuicoHurtCrouch": preload("res://game/state/assist/assistsuisei/AssistASuicoAssistHurtGroundState.gd"),
		"ASuicoHurtAir": preload("res://game/state/assist/assistsuisei/AssistASuicoAssistHurtAirState.gd"),
		"ASuicoHurtThrow": preload("res://game/state/assist/assistsuisei/AssistASuicoAssistHurtGroundState.gd"),
		"ASuicoHurtAirThrow": preload("res://game/state/assist/assistsuisei/AssistASuicoAssistHurtGroundState.gd"),
		"ASuicoHurtLaunch": preload("res://game/state/assist/assistsuisei/AssistASuicoAssistHurtLaunchState.gd"),
		"ASuicoGroundBounce": preload("res://game/state/assist/assistsuisei/AssistASuicoAssistHurtGroundBounceState.gd"),
		"ASuicoWallBounce": preload("res://game/state/assist/assistsuisei/AssistASuicoAssistHurtWallBounceState.gd"),
		"ASuicoKnockdown": preload("res://game/state/assist/assistsuisei/AssistASuicoAssistKnockdownState.gd"),
	}
	
	merge_state_dictionary(new_states)
