extends AngelAttackState

class_name AngelHH10State

var CallSound = preload("res://game/assets/voice/subaru/SBR_KITAAAA zaku zaku.wav")

func _init():
	endFrame = 40
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -262144, Enums.StKey.Hurt1PosY : -7471104,
			Enums.StKey.Hurt1ScaleX : 522078, Enums.StKey.Hurt1ScaleY : 1436954,
			},
		5 : {
			Enums.StKey.Summon : "superFlash",
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
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
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.burst_OK: false,
			Enums.StKey.Hit1PosX : 0, Enums.StKey.Hit1PosY : 0,
			Enums.StKey.Hit1ScaleX : 88338272, Enums.StKey.Hit1ScaleY : 88338272,
			Enums.StKey.attack_type : Enums.AttackType.WallBouncer,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*236,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*70,
			Enums.StKey.attack_damage: 100,
			Enums.StKey.min_damage: 100,
			Enums.StKey.chip_damage:0,
			Enums.StKey.hitstop: 40,
			Enums.StKey.hitstun: 150,
			Enums.StKey.counter_hit: Enums.AttackType.WallBouncer,
			Enums.StKey.meter_build: 0,
			Enums.StKey.counter_hitstun: 30,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*120,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*70,
			},
		7 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -262144, Enums.StKey.Hurt1PosY : -7471104,
			Enums.StKey.Hurt1ScaleX : 522078, Enums.StKey.Hurt1ScaleY : 1436954,
		},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("AngelHH10")
	state[Enums.StKey.super_meter] -= Util.MAX_SUPER_METER

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] >= 6 and state[Enums.StKey.frame] < 15):
		state[Enums.StKey.velocity_x] = SGFixed.ONE*80
	elif (state[Enums.StKey.frame] == 2):
		SyncManager.play_sound("sbr_holoheaven", CallSound, {"bus": "Voice"})

#func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
#	if (state[Enums.StKey.frame] == 0):
#		state[Enums.StKey.leftfaceOK] = false
##	if (state[Enums.StKey.frame] == endFrame - 1):
##		change_state.call("Stand")

func meter_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func combo_pushback(comboTime: int) -> int:
	return 0

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
func common_idle_transitions(state: Dictionary, interpreter: InputInterpreter) -> void:
	change_state.call("AngelUninstall")
