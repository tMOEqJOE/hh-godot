extends SuicopathAirAssistGuardCancelState

class_name SuicopathAirAssistWeakGuardCancelState

func _init():
	endFrame = 160
	CallSound = Global.AirTechSound
	anim_data = {
		0 : {
			Enums.StKey.counterOK : false,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true, Enums.StKey.Hurt2Disable : true, Enums.StKey.Hurt3Disable : true,
			},
		2 : {
			Enums.StKey.counterOK : false,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true, Enums.StKey.Hurt2Disable : true, Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Summon : "airassistWeakGuardCancel",
			},
		13 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 327680, Enums.StKey.Hurt1PosY : -22085634,
			Enums.StKey.Hurt1ScaleX : 257090, Enums.StKey.Hurt1ScaleY : 604574,
			Enums.StKey.Hurt2PosX : 131072, Enums.StKey.Hurt2PosY : -14352384,
			Enums.StKey.Hurt2ScaleX : 401098, Enums.StKey.Hurt2ScaleY : -853100,
			Enums.StKey.Hurt3PosX : 262144, Enums.StKey.Hurt3PosY : -3538944,
			Enums.StKey.Hurt3ScaleX : 783139, Enums.StKey.Hurt3ScaleY : -370037,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func physics_tick(state: Dictionary) -> void:
	if (state[Enums.StKey.frame] == 2):
		state[Enums.StKey.assist_meter] -= (Util.ASSIST_STOCK*2)
		state[Enums.StKey.sync_rate] = SGFixed.mul(state[Enums.StKey.sync_rate], 5536)
		SyncManager.play_sound("Call", CallSound, {"bus": "Voice"})
	if (state[Enums.StKey.frame] == 45):
		state[Enums.StKey.accel_y] = Util.GRAVITY
		anim.play("AngelJumpFall")
	super.physics_tick(state)
