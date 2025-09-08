extends AirFDStanceState

class_name OllieAirFDStanceState

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true, Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 1310720, Enums.StKey.Hurt1PosY : -19070976,
			Enums.StKey.Hurt1ScaleX : 868657, Enums.StKey.Hurt1ScaleY : 885109,
			Enums.StKey.Summon : "FDBubble",
			},
		7 : {
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true, Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 1310720, Enums.StKey.Hurt1PosY : -19070976,
			Enums.StKey.Hurt1ScaleX : 868657, Enums.StKey.Hurt1ScaleY : 885109,
			Enums.StKey.Summon : "FDBubble",
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.accel_y] = Util.OLLIE_FAST_FALL_GRAVITY
