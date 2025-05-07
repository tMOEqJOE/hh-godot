extends AssistAirAttackState

class_name HakkaAirSuperCharge1

var CallSound = preload("res://game/assets/voice/hakka/BZN_Ugh.wav")

func _init():
	endFrame = 200
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -15138816,
			Enums.StKey.Hurt1ScaleX : 686985, Enums.StKey.Hurt1ScaleY : 1488884,
			},
		10 : { 
			Enums.StKey.Hit1Disable : false, Enums.StKey.Hit2Disable : true,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.burst_OK: false,
			Enums.StKey.attack_damage:65,
			Enums.StKey.meter_build: 0,
			Enums.StKey.Hit1PosX: 13500417, Enums.StKey.Hit1PosY : -16515072,
			Enums.StKey.Hit1ScaleX : 1713435, Enums.StKey.Hit1ScaleY : 832895,
			},
		17 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			},
	}


# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.leftfaceOK] = false
	state[Enums.StKey.drag_x] = Util.FRICTION
	state[Enums.StKey.accel_y] = 0
	anim.stop(true)
	anim.play("AssistSuperFollowup")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 7):
		state[Enums.StKey.velocity_x] = SGFixed.ONE*40
	elif (state[Enums.StKey.frame] == 6):
		SyncManager.play_sound("HakkaVoice", CallSound, {"bus": "Voice"})
		SyncManager.play_sound("HakkaVoiceReverb", Global.EmptySound, {"bus": "ReverbVoice"})
	elif (state[Enums.StKey.frame] == 25):
		state[Enums.StKey.accel_y] = Util.GRAVITY

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand):
		if (state[Enums.StKey.hitStopFrame] <= 0):
			change_state.call("Knockdown")
	elif (event_cause == Enums.Reaction.StrikeHurt):
		state[Enums.StKey.hitStopFrame] = 20
		state[Enums.StKey.velocity_y] = 0
	elif (event_cause == Enums.Reaction.LaunchHurt):
		state[Enums.StKey.hitStopFrame] = 20
		state[Enums.StKey.velocity_y] = 0
	else:
		super.reaction(state, interpreter, event_cause)
