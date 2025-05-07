extends HatoAttackState

class_name HatoCardsState

var voice = preload("res://game/assets/voice/mio/mio_blessed giggles 2.wav")

func _init():
	endFrame = 30
	
	anim_data = {
		0 : {
			Enums.StKey.Summon : "meterDump",
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : true,
			Enums.StKey.Hurt1PosX : -327680, Enums.StKey.Hurt1PosY : -20447234,
			Enums.StKey.Hurt1ScaleX : 841262, Enums.StKey.Hurt1ScaleY : 1777410,
			},
		6 : {
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
		7 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 23330814, Enums.StKey.Hit1PosY : -23592962,
			Enums.StKey.Hit1ScaleX : 3994209, Enums.StKey.Hit1ScaleY : 1615133,
			Enums.StKey.attack_type : Enums.AttackType.WallBouncer,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*10,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*30,
			Enums.StKey.burst_OK: false,
			Enums.StKey.attack_damage: 60,
			Enums.StKey.hitstun : 80,
			Enums.StKey.min_damage:10,
			Enums.StKey.chip_damage:10,
			Enums.StKey.meter_build: 0,
			Enums.StKey.hitstop: 10,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 200,
			Enums.StKey.counter_launch_dir_x: SGFixed.ONE*10,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*30,
			},
		12 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 23330814, Enums.StKey.Hit1PosY : -23592962,
			Enums.StKey.Hit1ScaleX : 3994209, Enums.StKey.Hit1ScaleY : 1615133,
			Enums.StKey.attack_type : Enums.AttackType.WallBouncer,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*50,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*70,
			Enums.StKey.burst_OK: false,
			Enums.StKey.attack_damage: 70,
			Enums.StKey.hitstun : 80,
			Enums.StKey.min_damage:10,
			Enums.StKey.chip_damage:10,
			Enums.StKey.meter_build: 0,
			Enums.StKey.hitstop: 10,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 200,
			Enums.StKey.counter_launch_dir_x: SGFixed.ONE*60,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*70,
			},
		17 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			#
			# Enums.StKey.Hit1PosX : 2025, Enums.StKey.Hit1PosY : -13828096,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("Cards")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 3):
		SyncManager.play_sound("HatoVoice", voice, {"bus": "Voice"})
		SyncManager.play_sound("HatoVoiceReverb", voice, {"bus": "ReverbVoice"})
