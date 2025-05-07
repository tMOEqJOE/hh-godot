extends Node2D

func _ready() -> void:
	MainMenuMusicControl.play_main_menu_music()
	$CanvasLayer/GridContainer/PVP.grab_focus()
	$AruDJAnimator.play("Idle")

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://game/menus/mainmenu/MainMenu.tscn")

func _on_pvp_pressed():
	get_tree().change_scene_to_file("res://game/menus/buttonmap/ControllerPickMenuScreen.tscn")

func _on_versus_cpu_pressed():
	get_tree().change_scene_to_file("res://game/menus/buttonmap/VersusCPUControllerPickMenuScreen.tscn")
