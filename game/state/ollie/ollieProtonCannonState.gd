extends "res://game/state/ollie/mainstates/ollieAttackState.gd"

class_name OllieProtonCannonState

var sound = preload("res://game/assets/voice/ollie/oll_beeeeeam2.wav")

func _init():
	endFrame = 215
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			#
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -262144, Enums.StKey.Hurt1PosY : -7471104,
			Enums.StKey.Hurt1ScaleX : 522078, Enums.StKey.Hurt1ScaleY : 1436954,
			},
		8 : {
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit2PosX : 5832720, Enums.StKey.Hit2PosY : -37289984,
			Enums.StKey.Hit2ScaleX : 1405564, Enums.StKey.Hit2ScaleY : 378195,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 2883584, Enums.StKey.Hurt1PosY : -20185088,
			Enums.StKey.Hurt1ScaleX : 339834, Enums.StKey.Hurt1ScaleY : 629832,
			Enums.StKey.Hurt2PosX : 3407872, Enums.StKey.Hurt2PosY : -11075586,
			Enums.StKey.Hurt2ScaleX : 548413, Enums.StKey.Hurt2ScaleY : -906915,
			Enums.StKey.Hurt3PosX : 3473407, Enums.StKey.Hurt3PosY : -4063231,
			Enums.StKey.Hurt3ScaleX : 1171400, Enums.StKey.Hurt3ScaleY : -464723,
			Enums.StKey.attack_damage: 1,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.meter_build: 0,
			Enums.StKey.attack_type : Enums.AttackType.GroundBouncer, 
			Enums.StKey.launch_dir_x : -SGFixed.ONE*30,
			Enums.StKey.launch_dir_y : SGFixed.ONE*10,
#			Enums.StKey.hitstop: 4,
			Enums.StKey.min_damage:6,
			Enums.StKey.chip_damage:4,
			Enums.StKey.hitstun : 20,
			Enums.StKey.blockstun : 20,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*30,
			Enums.StKey.counter_launch_dir_y: SGFixed.ONE*10,
			},
		9 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -262144, Enums.StKey.Hurt1PosY : -7471104,
			Enums.StKey.Hurt1ScaleX : 522078, Enums.StKey.Hurt1ScaleY : 1436954,
			},
		13 : {
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
		14 : {
			Enums.StKey.Summon : "protoncannon",
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -262144, Enums.StKey.Hurt1PosY : -7471104,
			Enums.StKey.Hurt1ScaleX : 522078, Enums.StKey.Hurt1ScaleY : 1436954,
		},
		15 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -262144, Enums.StKey.Hurt1PosY : -7471104,
			Enums.StKey.Hurt1ScaleX : 522078, Enums.StKey.Hurt1ScaleY : 1436954,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("ProtonCannon")
	state[Enums.StKey.super_meter] -= Util.LEVEL_TWO_SUPER

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 3):
		state[Enums.StKey.hitStopFrame] = 0
	elif (state[Enums.StKey.frame] == 13):
		SyncManager.play_sound("OllieVoice", sound, {"bus": "Voice"})
		SyncManager.play_sound("OllieVoiceReverb", sound, {"bus": "ReverbVoice"})

func combo_pushback(comboTime: int) -> int:
	return 0

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

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
