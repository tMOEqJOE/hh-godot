extends KOState

class_name FlayonKOState

var voice = preload("res://game/assets/voice/flayon/SBR_AAAAAAAA.wav")

func enter(state: Dictionary) -> void:
	super.enter(state)
	SyncManager.play_sound("FlayonVoice", voice, {"bus": "Voice"})
	SyncManager.play_sound("FlayonVoiceReverb", voice, {"bus": "ReverbVoice"})
