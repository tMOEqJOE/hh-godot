extends SuicopathHurtLaunchState

class_name SuicopathHurtGroundBounceState

const GroundBounceSound = preload("res://game/assets/sfx/HitLvl1.wav")

func _init() -> void:
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true, Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -18153472,
			Enums.StKey.Hurt1ScaleX : 1185327, Enums.StKey.Hurt1ScaleY : 1324647,
			Enums.StKey.Summon : "knockdowndust",
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.hitStopFrame] = -1
	SyncManager.play_sound("knockdown", GroundBounceSound, {"bus": "Sound"})

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.hitStopFrame] < 0 and state[Enums.StKey.frame] == 1):
		state[Enums.StKey.hitStopFrame] = Util.GROUND_BOUNCE_HITSTOP
	elif (state[Enums.StKey.frame] == 2):
		state[Enums.StKey.velocity_y] = SGFixed.mul(state[Enums.StKey.velocity_y], Util.GROUND_BOUNCE_POWER_DECAY)

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.StrikeHurt):
		if (state[Enums.StKey.frame] > 2):
			change_state.call("AngelHurtAir")
		else:
			change_state.call("AngelHurtStand")
	elif (event_cause == Enums.Reaction.BlockHurt):
		change_state.call("AngelAirBlock")
	elif (event_cause == Enums.Reaction.JustBlockHurt):
		change_state.call("AngelJustAirBlock")
	elif (event_cause == Enums.Reaction.ThrowHurt):
		change_state.call("AngelHurtAirThrow")
	elif (event_cause == Enums.Reaction.LaunchHurt):
		change_state.call("AngelHurtLaunch")
	elif (event_cause == Enums.Reaction.BurstLockHurt):
		state[Enums.StKey.burst_OK] = false
	elif (event_cause == Enums.Reaction.KOHurt):
		change_state.call("AngelKO")
	elif (state[Enums.StKey.hitStopFrame] <= 0):
		if (event_cause == Enums.Reaction.GroundLand and state[Enums.StKey.frame] > 2):
			if (state[Enums.StKey.ground_bounce] > 0):
				state[Enums.StKey.ground_bounce] -= 1
				change_state.call("AngelGroundBounce")
			else:
				state[Enums.StKey.doubleJump] = 1
				state[Enums.StKey.airDash] = 1
				change_state.call("AngelKnockdown")
		elif (event_cause == Enums.Reaction.WallLand):
			if (state[Enums.StKey.wall_bounce] > 0):
				state[Enums.StKey.wall_bounce] -= 1
				change_state.call("AngelWallBounce")
