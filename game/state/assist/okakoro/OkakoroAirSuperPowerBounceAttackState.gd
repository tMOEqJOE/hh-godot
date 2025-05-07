extends AssistAirAttackState

class_name OkakoroAirPowerBounceAttackState

var voice2 = preload("res://game/assets/voice/okayu/oky_oi.wav")
var voicefail = preload("res://game/assets/voice/okayu/oky_korewa muzukashiiyone.wav")

func _init():
	endFrame = 60
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hit1PosX : 0, Enums.StKey.Hit1PosY : -11337728,
			Enums.StKey.Hit1ScaleX : 686985, Enums.StKey.Hit1ScaleY : 1074037,
			},
		1 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.Hit1PosX : 0, Enums.StKey.Hit1PosY : -1669474,
			Enums.StKey.Hit1ScaleX : 826847, Enums.StKey.Hit1ScaleY : 306067,
			Enums.StKey.hitstop : 10,
			Enums.StKey.hitstun : 60,
			Enums.StKey.attack_damage: 50,
			Enums.StKey.attack_type : Enums.AttackType.GroundBouncer,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*5,
			Enums.StKey.launch_dir_y : SGFixed.ONE*45,
			Enums.StKey.min_damage:6,
			Enums.StKey.chip_damage:6,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 120,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*5,
			Enums.StKey.counter_launch_dir_y: SGFixed.ONE*45,
#			Enums.StKey.counter_hitstun: 5,
			},
		2 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			},
	}


# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	var old_accel = state[Enums.StKey.accel_y]
	super.enter(state)
	state[Enums.StKey.accel_y] = old_accel
	state[Enums.StKey.leftfaceOK] = false
	anim.stop(true)
	anim.play("AssistSuperAttack")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 0):
		SyncManager.play_sound("OkakoroPowerBounceAttack", voice2, {"bus": "Voice"})
	elif (state[Enums.StKey.hitStopFrame] == 1):
		state[Enums.StKey.accel_y] += 15000
		state[Enums.StKey.velocity_y] = -SGFixed.ONE*60
		state[Enums.StKey.cancelState] = "AssistAirSuperFall"

func exit_state():
	change_state.call("AssistAirSuperFall")

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand):
		if (state[Enums.StKey.hitStopFrame] <= 0):
#			SyncManager.play_sound("OkakoroPowerBounceAttack", voicefail, {"bus": "Voice"})
			change_state.call("LandAttackRecovery")
	else:
		super.reaction(state, interpreter, event_cause)
