extends KOState

class_name OllieKOState

var voice = preload("res://game/assets/voice/ollie/oll_wasureru beeeeeam.wav")

func enter(state: Dictionary) -> void:
	super.enter(state)
	SyncManager.play_sound("OllieVoice", voice, {"bus": "Voice"})
	SyncManager.play_sound("OllieVoiceReverb", voice, {"bus": "ReverbVoice"})
