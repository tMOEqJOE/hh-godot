extends KOState

class_name SuiseiKOState

var voice = preload("res://game/assets/voice/suisei/sui_aaaaaaa -deadpan-.wav")

func enter(state: Dictionary) -> void:
	super.enter(state)
	SyncManager.play_sound("SuiseiVoice", voice, {"bus": "Voice"})
	SyncManager.play_sound("SuiseiVoiceReverb", voice, {"bus": "ReverbVoice"})
