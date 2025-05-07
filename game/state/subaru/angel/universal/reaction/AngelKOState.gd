extends AngelHurtAirState

class_name AngelKOState

var voice = preload("res://game/assets/voice/subaru/SBR_AAAAAAAA.wav")

func _init():
	endFrame = 180
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			#
			Enums.StKey.Hurt1Disable : true,
			Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt3Disable : true,
			# Enums.StKey.Hit1PosX : 2025, Enums.StKey.Hit1PosY : -13828096,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	state[Enums.StKey.cancelState] = ""
	state[Enums.StKey.drag_x] = 0
	state[Enums.StKey.comboTime] = 2
#	state[Enums.StKey.burst_OK] = true
#	if (state[Enums.StKey.velocity_y] > -SGFixed.ONE*80):
#		state[Enums.StKey.velocity_y] = -SGFixed.ONE*80
	state[Enums.StKey.accel_y] = Util.JUGGLE_GRAVITY
	state[Enums.StKey.accel_x] = 0
#	state[Enums.StKey.hitstun] = 150
	state[Enums.StKey.hitstop] = 20
	anim.speed_scale = 1
	SyncManager.play_sound("AngelVoice", voice, {"bus": "Voice"})
	SyncManager.play_sound("AngelVoiceReverb", voice, {"bus": "ReverbVoice"})
	anim.play("AngelKO")
