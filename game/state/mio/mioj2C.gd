extends MioAirAttackState

class_name Mioj2CState

var voice = preload("res://game/assets/voice/mio/mio_na.wav")

func _init():
	endFrame = 60
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 3276800, Enums.StKey.Hurt1PosY : -5505024,
			Enums.StKey.Hurt1ScaleX : 405194, Enums.StKey.Hurt1ScaleY : 951940,
			Enums.StKey.Hurt2PosX : -720895, Enums.StKey.Hurt2PosY : -19988480,
			Enums.StKey.Hurt2ScaleX : 968398, Enums.StKey.Hurt2ScaleY : 793234,
			Enums.StKey.Hurt3PosX : 1507328, Enums.StKey.Hurt3PosY : -23396352,
			Enums.StKey.Hurt3ScaleX : 402121, Enums.StKey.Hurt3ScaleY : 600552,
			},
		4 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit1PosX : 3670016, Enums.StKey.Hit1PosY : -12582913,
			Enums.StKey.Hit1ScaleX : 384041, Enums.StKey.Hit1ScaleY : 1851319,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 3276800, Enums.StKey.Hurt1PosY : -5505024,
			Enums.StKey.Hurt1ScaleX : 405194, Enums.StKey.Hurt1ScaleY : 951940,
			Enums.StKey.Hurt2PosX : -720895, Enums.StKey.Hurt2PosY : -19988480,
			Enums.StKey.Hurt2ScaleX : 968398, Enums.StKey.Hurt2ScaleY : 793234,
			Enums.StKey.Hurt3PosX : 1507328, Enums.StKey.Hurt3PosY : -23396352,
			Enums.StKey.Hurt3ScaleX : 402121, Enums.StKey.Hurt3ScaleY : 600552,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.attack_damage: 30,
			Enums.StKey.min_damage: 10,
			Enums.StKey.attack_type : Enums.AttackType.Strike,
			Enums.StKey.launch_dir_x : Util.BASE_STRIKE_X_PUSHBACK,
			Enums.StKey.launch_dir_y : +SGFixed.ONE*35, # 42
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*7,
			Enums.StKey.counter_launch_dir_y: SGFixed.ONE*42,
			#Enums.StKey.hitstun: Util.DEFAULT_HITSTUN - 3,
			Enums.StKey.counter_hitstun: 40,
			},
		60 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("j2C")

# Writing _delta instead of delta here prevents the unused variable warning.
func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 3):
		SyncManager.play_sound("MioVoice", voice, {"bus": "Voice"})

#func meter_cancel(state: Dictionary, interpreter: InputInterpreter):
	#if (state[Enums.StKey.hitStopFrame] >= 0):
		#if (boost_OK(state, interpreter)):
			#state[Enums.StKey.cancelState] = "AirBoostCancel"
	#else:
		#if (boost_OK(state, interpreter)):
			#change_state.call("AirBoostCancel")

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand):
		if (state[Enums.StKey.hitStopFrame] <= 0 and state[Enums.StKey.frame] >= 3):
			state[Enums.StKey.doubleJump] = 1
			state[Enums.StKey.airDash] = 1
			change_state.call("LandingRecovery")
	else:
		super.reaction(state, interpreter, event_cause)
