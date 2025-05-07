extends StandFDStanceState

class_name OgaStandFDState

func _init():
	anim_data = {
		0 : {
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true, Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1PosX : -1900544, Enums.StKey.Hurt1PosY : -18284544,
			Enums.StKey.Hurt1ScaleX : 976069, Enums.StKey.Hurt1ScaleY : -1832198,
			Enums.StKey.Summon : "FDBubble",
			},
		12 : {
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true, Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Summon : "FDBubble",
			},
	}
