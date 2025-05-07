extends KOState

class_name MioKOState

var voice = preload("res://game/assets/voice/mio/mio_weeeeeh.wav")

func enter(state: Dictionary) -> void:
	super.enter(state)
	SyncManager.play_sound("MioVoice", voice, {"bus": "Voice"})
	SyncManager.play_sound("MioVoiceReverb", voice, {"bus": "ReverbVoice"})
