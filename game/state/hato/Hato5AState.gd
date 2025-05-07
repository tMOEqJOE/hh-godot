extends HatoAttackState

class_name HatoStand5AState

var voice = preload("res://game/assets/voice/mio/mio_cough2.wav")
const MAX_SPEED_X = SGFixed.ONE*35

func _init():
	endFrame = 20
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : false,
			Enums.StKey.Hurt1PosX : 9830400, Enums.StKey.Hurt1PosY : -8847361,
			Enums.StKey.Hurt1ScaleX : 2191695, Enums.StKey.Hurt1ScaleY : 588993,
			},
		5 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 12189697, Enums.StKey.Hit1PosY : -4390912,
			Enums.StKey.Hit1ScaleX : 2039114, Enums.StKey.Hit1ScaleY : 957228,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*30,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*35,
			Enums.StKey.hitstun: 35,
			Enums.StKey.attack_damage: 50,
			Enums.StKey.min_damage: 9,
			Enums.StKey.chip_damage: 6,
			Enums.StKey.counter_hit: Enums.AttackType.WallBouncer,
			Enums.StKey.counter_hitstun: 5,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*60,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*40,
			},
		8 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : false,
			Enums.StKey.Hurt1PosX : 8323072, Enums.StKey.Hurt1PosY : -9371649,
			Enums.StKey.Hurt1ScaleX : 1620275, Enums.StKey.Hurt1ScaleY : 977828,
			},
		16 : {
			Enums.StKey.Hit1Disable : true,
			# Enums.StKey.Hit1PosX : 2025, Enums.StKey.Hit1PosY : -13828096,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("5A")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] >= 0 and state[Enums.StKey.frame] <= 4):
		state[Enums.StKey.velocity_x] += SGFixed.ONE*12
		if (state[Enums.StKey.velocity_x] >= MAX_SPEED_X):
			state[Enums.StKey.velocity_x] = MAX_SPEED_X
		if (state[Enums.StKey.frame] == 4):
			SyncManager.play_sound("HatoVoice", voice, {"bus": "Voice"})
			SyncManager.play_sound("HatoVoiceReverb", voice, {"bus": "ReverbVoice"})
	elif (state[Enums.StKey.frame] == 5):
		state[Enums.StKey.velocity_x] = MAX_SPEED_X
	elif (state[Enums.StKey.frame] == 8):
		state[Enums.StKey.velocity_x] = 0
	
