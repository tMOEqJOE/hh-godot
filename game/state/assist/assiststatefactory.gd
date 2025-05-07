extends StateFactory

class_name AssistStateFactory

func _init():
	super._init()
	
	var new_states : Dictionary = {
		"Dormant" : AssistDormantState,
		"AssistAttack" : AssistAttackState,
		"AssistAirAttack" : AssistAirAttackState,
		"AssistAttack2" : AssistAttackState,
		"AssistAirAttack2" : AssistAirAttackState,
		"AssistSuper" : AssistAttackState,
		"AssistAirSuper" : AssistAirAttackState,
		"AssistGuardCancelAttack" : AssistGuardCancelAttackState,
		"AssistAirGuardCancelAttack" : AssistAirGuardCancelAttackState,
		"AssistWeakGuardCancelAttack" : AssistWeakGuardCancelAttackState,
		"AssistAirWeakGuardCancelAttack" : AssistAirWeakGuardCancelAttackState,
		"AssistBurst" : AssistBurstState,
		"AssistExit": AssistExitState,
		"AssistAirExit": AssistAirExitState,
		"LandAttackRecovery" : AssistLandingRecoveryState,

		"HurtStand": AssistHurtGroundState,
		"HurtCrouch": AssistHurtGroundState,
		"HurtAir": AssistHurtAirState,
		"HurtThrow": AssistHurtGroundState,
		"HurtAirThrow": AssistHurtGroundState,
		"HurtLaunch": AssistHurtLaunchState,
		"GroundBounce": AssistHurtGroundBounceState,
		"WallBounce": AssistHurtWallBounceState,
		"Knockdown": AssistKnockdownState,
		
		"Intro": AssistIntroState,
	}
	
	merge_state_dictionary(new_states)
