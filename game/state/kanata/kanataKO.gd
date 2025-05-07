extends KOState

class_name KanataKOState

var voice = preload("res://game/assets/voice/kanata/amk_ehhhhhhhhhhhhhhh.wav")

func enter(state: Dictionary) -> void:
	super.enter(state)
	SyncManager.play_sound("KanataVoice", voice, {"bus": "Voice"})
	SyncManager.play_sound("KanataVoiceReverb", voice, {"bus": "ReverbVoice"})
