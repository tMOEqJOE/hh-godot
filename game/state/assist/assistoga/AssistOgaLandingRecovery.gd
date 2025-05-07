extends AssistLandingRecoveryState

class_name AssistOgaLandingRecoveryState

func _init():
	endFrame = 15
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,
			},
	}
