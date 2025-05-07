extends "res://game/state/kanata/kanataGroundAssistCall.gd"

class_name KanataGroundAssistCall2State

func _init():
	CallSound = preload("res://game/assets/voice/kanata/amk_Hey~.wav")
	endFrame = Util.BASE_ASSIST_RECOVERY
	
	anim_data = {
		0: {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -262144, Enums.StKey.Hurt1PosY : -7471104,
			Enums.StKey.Hurt1ScaleX : 522078, Enums.StKey.Hurt1ScaleY : 1436954,
			},
		1 : {
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -262144, Enums.StKey.Hurt1PosY : -7471104,
			Enums.StKey.Hurt1ScaleX : 522078, Enums.StKey.Hurt1ScaleY : 1436954,
			Enums.StKey.Summon : "assist2",
			Enums.StKey.counterOK : false,
			},
	}
