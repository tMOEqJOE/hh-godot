extends HurtAirState

class_name OgaHurtAirState

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true, 
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -1703936, Enums.StKey.Hurt1PosY : -17367038,
			Enums.StKey.Hurt1ScaleX : 1096960, Enums.StKey.Hurt1ScaleY : -1630350,
			},
	}
	
