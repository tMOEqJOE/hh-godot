extends OgaGroundAssistCallState

class_name OgaGroundAssistCallSuperState

func _init():
	CallSound = preload("res://game/assets/voice/oga/oga_hmph.wav")
	endFrame = Util.BASE_ASSIST_RECOVERY
	
	anim_data = {
		0: {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -3801087, Enums.StKey.Hurt1PosY : -4849664,
			Enums.StKey.Hurt1ScaleX : 1319752, Enums.StKey.Hurt1ScaleY : 585786,
			Enums.StKey.Hurt2PosX : -131072, Enums.StKey.Hurt2PosY : -13500417,
			Enums.StKey.Hurt2ScaleX : 899246, Enums.StKey.Hurt2ScaleY : 941131,
			Enums.StKey.Hurt3PosX : -6422528, Enums.StKey.Hurt3PosY : -25952256,
			Enums.StKey.Hurt3ScaleX : 891698, Enums.StKey.Hurt3ScaleY : 376207,
			},
		1 : {
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -3801087, Enums.StKey.Hurt1PosY : -4849664,
			Enums.StKey.Hurt1ScaleX : 1319752, Enums.StKey.Hurt1ScaleY : 585786,
			Enums.StKey.Hurt2PosX : -131072, Enums.StKey.Hurt2PosY : -13500417,
			Enums.StKey.Hurt2ScaleX : 899246, Enums.StKey.Hurt2ScaleY : 941131,
			Enums.StKey.Hurt3PosX : -6422528, Enums.StKey.Hurt3PosY : -25952256,
			Enums.StKey.Hurt3ScaleX : 891698, Enums.StKey.Hurt3ScaleY : 376207,
			Enums.StKey.Summon : "assistSuper",
			Enums.StKey.counterOK : false,
			},
	}

func battery_meter(state: Dictionary) -> void:
	state[Enums.StKey.assist_meter] -= Util.ASSIST_STOCK*2
	state[Enums.StKey.sync_rate] = SGFixed.mul(state[Enums.StKey.sync_rate], 5536)
