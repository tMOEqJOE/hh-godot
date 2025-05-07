extends KOState

class_name SubaruKOState

var voice = preload("res://game/assets/voice/subaru/SBR_AAAAAAAA.wav")

func enter(state: Dictionary) -> void:
	super.enter(state)
	SyncManager.play_sound("SubaruVoice", voice, {"bus": "Voice"})
	SyncManager.play_sound("SubaruVoiceReverb", voice, {"bus": "ReverbVoice"})
