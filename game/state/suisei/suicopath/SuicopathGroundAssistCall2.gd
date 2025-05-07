extends SuicopathGroundAssistCallState

class_name SuicopathGroundAssistCall2State

func _init():
	endFrame = Util.BASE_ASSIST_RECOVERY
	
	anim_data = {
		0: {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 1769472, Enums.StKey.Hurt1PosY : -15728636,
			Enums.StKey.Hurt1ScaleX : 1142691, Enums.StKey.Hurt1ScaleY : 1549402,
			},
		1 : {
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 1769472, Enums.StKey.Hurt1PosY : -15728636,
			Enums.StKey.Hurt1ScaleX : 1142691, Enums.StKey.Hurt1ScaleY : 1549402,
			Enums.StKey.Summon : "assist2",
			Enums.StKey.counterOK : false,
			},
	}
