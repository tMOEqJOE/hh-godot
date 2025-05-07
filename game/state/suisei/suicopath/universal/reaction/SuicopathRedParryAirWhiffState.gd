extends SuicopathAirParryWhiffState

class_name SuicopathRedAirParryWhiffState

func _init():
	endFrame = 100
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true, Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -18153472,
			Enums.StKey.Hurt1ScaleX : 1185327, Enums.StKey.Hurt1ScaleY : 1324647,
			Enums.StKey.counterOK : true,
			Enums.StKey.Summon : "RedParryFlash",
			},
		Util.RED_PARRY_WINDOW-1 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true, Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -18153472,
			Enums.StKey.Hurt1ScaleX : 1185327, Enums.StKey.Hurt1ScaleY : 1324647,
			Enums.StKey.Summon : "ParryWhiff",
			},
	}

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.RedParry:
			return true
		Enums.StateProperty.LowParry:
			return state[Enums.StKey.frame] < Util.RED_PARRY_WINDOW - 1
		Enums.StateProperty.HighParry:
			return state[Enums.StKey.frame] < Util.RED_PARRY_WINDOW - 1
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
