extends HurtLaunchState

class_name OgaHurtLaunchState


func _init() -> void:
	HurtSound = preload("res://game/assets/voice/oga/launch_hurt.wav")
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true, 
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true, Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -1703936, Enums.StKey.Hurt1PosY : -17367038,
			Enums.StKey.Hurt1ScaleX : 1096960, Enums.StKey.Hurt1ScaleY : -1630350,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 20):
		SyncManager.play_sound("OgaVoice", HurtSound, {"bus": "Voice"})
