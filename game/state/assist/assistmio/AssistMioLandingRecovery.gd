extends AssistLandingRecoveryState

class_name AssistMioLandingRecoveryState

func _init():
	super._init()
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -8337728,
			Enums.StKey.Hurt1ScaleX : 786985, Enums.StKey.Hurt1ScaleY : 874037,
			},
	}
