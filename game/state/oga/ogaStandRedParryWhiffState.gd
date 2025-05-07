extends OgaStandParryWhiffState

class_name OgaRedStandParryWhiffState

func _init():
	endFrame = 40
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true, Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -1900544, Enums.StKey.Hurt1PosY : -18284544,
			Enums.StKey.Hurt1ScaleX : 976069, Enums.StKey.Hurt1ScaleY : -1832198,
			Enums.StKey.counterOK : true,
			Enums.StKey.Summon : "RedParryFlash",
			},
		Util.RED_PARRY_WINDOW : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true, Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -1900544, Enums.StKey.Hurt1PosY : -18284544,
			Enums.StKey.Hurt1ScaleX : 976069, Enums.StKey.Hurt1ScaleY : -1832198,
			Enums.StKey.Summon : "ParryWhiff",
			},
	}

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.RedParry:
			return true
		Enums.StateProperty.HighParry:
			return state[Enums.StKey.frame] < Util.RED_PARRY_WINDOW
		_:
			return super.has_property(state,property)


func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func meter_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
