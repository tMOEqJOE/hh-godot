extends MioAttackState

class_name MioSuperTarotState

var voice = preload("res://game/assets/voice/mio/mio_major arcana intro miooooo.wav")

func _init():
	endFrame = 46
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 524288, Enums.StKey.Hurt1PosY : -15532031,
			Enums.StKey.Hurt1ScaleX : 555414, Enums.StKey.Hurt1ScaleY : 748084,
			Enums.StKey.Hurt2PosX : 6422528, Enums.StKey.Hurt2PosY : -15597570,
			Enums.StKey.Hurt2ScaleX : 510595, Enums.StKey.Hurt2ScaleY : -912293,
			Enums.StKey.Hurt3PosX : -65535, Enums.StKey.Hurt3PosY : -7995392,
			Enums.StKey.Hurt3ScaleX : 1279494, Enums.StKey.Hurt3ScaleY : -793638,
			},
		11 : {
			Enums.StKey.Summon : "superFlash",
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable: true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit1PosX : 0, Enums.StKey.Hit1PosY : 0,
			Enums.StKey.Hit1ScaleX : 18338272, Enums.StKey.Hit1ScaleY : 18338272,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.hitstop: 0,
			Enums.StKey.meter_build: 0,
			Enums.StKey.attack_type : Enums.AttackType.BurstLock,
			Enums.StKey.counter_hit : Enums.AttackType.BurstLock,
		},
		15 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit1PosX : 70451200, Enums.StKey.Hit1PosY : -10813440,
			Enums.StKey.Hit1ScaleX : 7464809, Enums.StKey.Hit1ScaleY : -629685,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 12582912, Enums.StKey.Hurt1PosY : -11010048,
			Enums.StKey.Hurt1ScaleX : 555414, Enums.StKey.Hurt1ScaleY : 748084,
			Enums.StKey.Hurt2PosX : 6422528, Enums.StKey.Hurt2PosY : -15597570,
			Enums.StKey.Hurt2ScaleX : 510595, Enums.StKey.Hurt2ScaleY : -912293,
			Enums.StKey.Hurt3PosX : -65535, Enums.StKey.Hurt3PosY : -7995392,
			Enums.StKey.Hurt3ScaleX : 1279494, Enums.StKey.Hurt3ScaleY : -793638,
			Enums.StKey.burst_OK: false,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.attack_type : Enums.AttackType.GroundBouncer,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*28,
			Enums.StKey.launch_dir_y : SGFixed.ONE*35,
			Enums.StKey.attack_damage: 65,
			Enums.StKey.min_damage:18,
			Enums.StKey.chip_damage:18,
			Enums.StKey.meter_build: 0,
			Enums.StKey.hitstun: 120,
			Enums.StKey.hitstop: 15,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 5,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*28,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*40,
			},
		20 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 12582912, Enums.StKey.Hurt1PosY : -11010048,
			Enums.StKey.Hurt1ScaleX : 555414, Enums.StKey.Hurt1ScaleY : 748084,
			Enums.StKey.Hurt2PosX : 6422528, Enums.StKey.Hurt2PosY : -15597570,
			Enums.StKey.Hurt2ScaleX : 510595, Enums.StKey.Hurt2ScaleY : -912293,
			Enums.StKey.Hurt3PosX : -65535, Enums.StKey.Hurt3PosY : -7995392,
			Enums.StKey.Hurt3ScaleX : 1279494, Enums.StKey.Hurt3ScaleY : -793638,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("SuperTarot")
	state[Enums.StKey.super_meter] -= Util.LEVEL_ONE_SUPER

# Writing _delta instead of delta here prevents the unused variable warning.
func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 3):
		SyncManager.play_sound("MioVoice", voice, {"bus": "Voice"})
		SyncManager.play_sound("MioVoiceReverb", voice, {"bus": "ReverbVoice"})


func meter_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (boost_OK(state, interpreter)):
			state[Enums.StKey.cancelState] = "BoostCancel"
		elif (assist_ok(state, interpreter) and state[Enums.StKey.cancelState] != "BoostCancel"):
			if (level_1_OK(state) and super_assist_meter_ok(state)  and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.DDown, state[Enums.StKey.leftface])):
				state[Enums.StKey.cancelState] = "GroundAssistCallSuper"
	else:
		if (boost_OK(state, interpreter)):
			change_state.call("BoostCancel")

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
