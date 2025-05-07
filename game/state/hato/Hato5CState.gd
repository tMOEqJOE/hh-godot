extends HatoAttackState

class_name HatoStand5CState

var voice = preload("res://game/assets/voice/mio/mio_dan dan dan dan.wav")

func _init():
	endFrame = 50
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : false,
			Enums.StKey.hit_box_colliding_frame : 4, 
			Enums.StKey.Hit1PosX : 17381698, Enums.StKey.Hit1PosY : -21233664,
			Enums.StKey.Hit1ScaleX : 2333967, Enums.StKey.Hit1ScaleY : 971559,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -15728640,
			Enums.StKey.Hurt1ScaleX : 1088918, Enums.StKey.Hurt1ScaleY : 1252738,
			},
		7 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : false,
			Enums.StKey.Hurt1PosX : 10485760, Enums.StKey.Hurt1PosY : -15728640,
			Enums.StKey.Hurt1ScaleX : 2988918, Enums.StKey.Hurt1ScaleY : 1252738,
			},
		9 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.attack_damage: 20,
			Enums.StKey.chip_damage:1,
			Enums.StKey.min_damage:3,
			Enums.StKey.hitstop: 3,
#			Enums.StKey.attack_type : Enums.AttackType.WallBouncer,
			},
		35 : {
			Enums.StKey.Hit1Disable : true,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("5C")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 4):
		state[Enums.StKey.velocity_x] += SGFixed.ONE*30
		state[Enums.StKey.drag_x] = Util.SLIPPERY_FRICTION
	elif (state[Enums.StKey.frame] == 3):
		SyncManager.play_sound("HatoVoice", voice, {"bus": "Voice"})
		SyncManager.play_sound("HatoVoiceReverb", voice, {"bus": "ReverbVoice"})
