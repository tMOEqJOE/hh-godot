extends Node2D

signal end_pre_round ()

const NOWLOADINGSound = preload("res://game/assets/sfx/WhiffLvl3.wav")

const GOSound = preload("res://game/assets/sfx/GO.wav")

var enabled: bool = true

func start():
	$NetworkTimer.start()
	if (enabled):
		$NetworkAnimationPlayer.play("LOADING")
		$Fade.visible = true
		SyncManager.play_sound("nowloading", NOWLOADINGSound, {"bus": "Sound"})

func _on_NetworkTimer_timeout():
	emit_signal("end_pre_round")
	$NetworkTimer.stop()
	$Fade.visible = false
	if (enabled):
		SyncManager.play_sound("go", GOSound, {"bus": "Sound"})

func skip():
	enabled = false
	$NetworkTimer.wait_ticks = 1
