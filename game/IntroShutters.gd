extends Node2D

const ShutterSound = preload("res://game/assets/sfx/WhiffLvl2.wav")

func _ready():
	$NetworkAnimationPlayer.play("Wait")
	reset()

func reset():
	$Sprite2D.visible = true
	slide_away()

func slide_away():
	$Sprite2D.visible = true
	$NetworkAnimationPlayer.play("SlideAway")
	$NetworkTimer.start()
	SyncManager.play_sound("shutter", ShutterSound, {"bus": "Sound"})

func _on_NetworkTimer_timeout():
	$NetworkAnimationPlayer.stop()
	$NetworkTimer.stop()
	$Sprite2D.visible = false
