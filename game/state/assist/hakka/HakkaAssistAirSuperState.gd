extends AssistAirAttackState

class_name HakkaAirSuperState

var CallSound = preload("res://game/assets/voice/hakka/BZN_Charging.wav")

func _init():
	endFrame = 240
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hit1PosX : 0, Enums.StKey.Hit1PosY : -11337728,
			Enums.StKey.Hit1ScaleX : 686985, Enums.StKey.Hit1ScaleY : 1074037,
			Enums.StKey.Summon : "meterDump",
			},
		5 : {
			Enums.StKey.Summon : "superFlash",
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit1PosX : 0, Enums.StKey.Hit1PosY : 0,
			Enums.StKey.Hit1ScaleX : 18338272, Enums.StKey.Hit1ScaleY : 18338272,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.hitstop: 0,
			Enums.StKey.meter_build: 0,
			Enums.StKey.attack_type : Enums.AttackType.BurstLock,
			Enums.StKey.counter_hit : Enums.AttackType.BurstLock,
			},
		6 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.drag_x] = Util.FRICTION
	state[Enums.StKey.accel_y] = 0
	anim.stop(true)
	anim.play("AssistSuper")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 5):
		SyncManager.play_sound("HakkaVoice", CallSound, {"bus": "Voice"})
		SyncManager.play_sound("HakkaVoiceReverb", CallSound, {"bus": "ReverbVoice"})

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (not interpreter.is_button_down(Enums.InputFlags.DHold)):
		if (state[Enums.StKey.frame] <= 7):
			pass
		elif (state[Enums.StKey.frame] <= 60):
			change_state.call("AirSuperCharge1")
		elif (state[Enums.StKey.frame] <= 144):
			change_state.call("AirSuperCharge2")
		else:
			change_state.call("AirSuperCharge3")

func exit_state():
	change_state.call("AirSuperCharge3")

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	super.reaction(state, interpreter, event_cause)
	SyncManager.play_sound("HakkaVoice", Global.EmptySound, {"bus": "Voice"})
	SyncManager.play_sound("HakkaVoiceReverb", Global.EmptySound, {"bus": "ReverbVoice"})
#	if (event_cause == Enums.Reaction.GroundLand):
#		pass
#	elif (event_cause == Enums.Reaction.StrikeHurt):
##		state[Enums.StKey.velocity_x] = 0
#		state[Enums.StKey.velocity_y] = 0
#	elif (event_cause == Enums.Reaction.LaunchHurt):
##		state[Enums.StKey.velocity_x] = 0
#		state[Enums.StKey.velocity_y] = 0
##	elif (event_cause == Enums.Reaction.WallLand):
##		if (state[Enums.StKey.hitStopFrame] <= 0):
##			change_state.call("Dormant")
#	else:
#		.reaction(state, interpreter, event_cause)

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.DrainAssistMeter:
			return true
		_:
			return super.has_property(state,property)
