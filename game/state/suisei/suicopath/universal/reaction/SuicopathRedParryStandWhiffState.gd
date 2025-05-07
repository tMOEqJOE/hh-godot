extends SuicopathStandParryWhiffState

class_name SuicopathRedStandParryWhiffState

func _init():
	endFrame = 40
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt2PosX : 1572864, Enums.StKey.Hurt2PosY : -24641536,
			Enums.StKey.Hurt2ScaleX : 1185327, Enums.StKey.Hurt2ScaleY : 1324647,
			Enums.StKey.Hurt3PosX : -1441792, Enums.StKey.Hurt3PosY : -5898240,
			Enums.StKey.Hurt3ScaleX : 1098168, Enums.StKey.Hurt3ScaleY : 626962,
			Enums.StKey.counterOK : true,
			Enums.StKey.Summon : "RedParryFlash",
			},
		Util.RED_PARRY_WINDOW : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt2PosX : 1572864, Enums.StKey.Hurt2PosY : -24641536,
			Enums.StKey.Hurt2ScaleX : 1185327, Enums.StKey.Hurt2ScaleY : 1324647,
			Enums.StKey.Hurt3PosX : -1441792, Enums.StKey.Hurt3PosY : -5898240,
			Enums.StKey.Hurt3ScaleX : 1098168, Enums.StKey.Hurt3ScaleY : 626962,
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
