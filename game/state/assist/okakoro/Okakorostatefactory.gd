extends AssistStateFactory

class_name OkakoroStateFactory

func _init():
	super._init()
	
	var new_states : Dictionary = {
		"Dormant" : preload("res://game/state/assist/okakoro/OkakoroDormantState.gd"),
		"AssistAttack" : preload("res://game/state/assist/okakoro/OkakoroAssistAttackState.gd"),
		"HammerFollowup" : preload("res://game/state/assist/okakoro/OkakoroHammerFollowupState.gd"),
		"HammerJustFollowup" : preload("res://game/state/assist/okakoro/OkakoroHammerJustFollowupState.gd"),
		"AirHammerFollowup" : preload("res://game/state/assist/okakoro/OkakoroAirHammerFollowupState.gd"),
		"AirHammerJustFollowup" : preload("res://game/state/assist/okakoro/OkakoroAirHammerJustFollowupState.gd"),
		"JumpFollowup" : preload("res://game/state/assist/okakoro/OkakoroJumpState.gd"),
		"JumpJustFollowup" : preload("res://game/state/assist/okakoro/OkakoroJustJumpState.gd"),
		"AssistAirAttack" : preload("res://game/state/assist/okakoro/OkakoroAssistAirAttackState.gd"),
		"AssistSuper" : preload("res://game/state/assist/okakoro/OkakoroAirSuperFirstPowerBounceState.gd"),
		"AssistAirSuper" : preload("res://game/state/assist/okakoro/OkakoroAirSuperFirstPowerBounceState.gd"),
		"AssistAirSuperAttack" : preload("res://game/state/assist/okakoro/OkakoroAirSuperPowerBounceAttackState.gd"),
		"AssistAirSuperFall" : preload("res://game/state/assist/okakoro/OkakoroAirSuperPowerBounceRollingFallState.gd"),
		"AssistAttack2" : preload("res://game/state/assist/okakoro/OkakoroAssistAttack2State.gd"),
		"AssistAirAttack2" : preload("res://game/state/assist/okakoro/OkakoroAssistAirAttack2State.gd"),
		"LandAttackRecovery" : SoraLandingRecoveryState,
		"AssistExit": SoraAssistExitState,
		"AssistAirExit": SoraAssistAirExitState,
		"AssistGuardCancelAttack" : SoraAssistGuardCancelAttackState,
		"AssistAirGuardCancelAttack" : SoraAssistAirGuardCancelAttackState,
		"AssistWeakGuardCancelAttack" : SoraAssistWeakGuardCancelAttackState,
		"AssistAirWeakGuardCancelAttack" : SoraAssistAirWeakGuardCancelAttackState,
	}
	
	merge_state_dictionary(new_states)
