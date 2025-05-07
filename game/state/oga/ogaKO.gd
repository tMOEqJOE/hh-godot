extends KOState

class_name OgaKOState

var voice = preload("res://game/assets/voice/oga/oga_gasp kuso.wav")

func enter(state: Dictionary) -> void:
	super.enter(state)
	SyncManager.play_sound("OgaVoice", voice, {"bus": "Voice"})
	SyncManager.play_sound("OgaVoiceReverb", voice, {"bus": "ReverbVoice"})
