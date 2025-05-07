extends Node2D

@onready var BUTTON_MAP_MENU = preload("res://game/menus/buttonmap/ButtonMapMenuScreen.tscn")
var button_menu

func _ready() -> void:
	MainMenuMusicControl.play_main_menu_music()
	$CanvasLayer/NameLabel.text = Global.nakama_session.username
	$CanvasLayer/GridContainer/CreateRoomButton.grab_focus()
	if (Global.IS_PUBLIC_LOBBY):
		$CanvasLayer/GridContainer/CreatePublicRoomButton.grab_focus()
	Global.NETPLAY_MODE = Global.NETPLAY_MODES.PRIVATE_ROOM
	$AruDJAnimator.play("Idle")
	OnlineMatch.leave()
	OnlineLobby.leave()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://game/menus/buttonmap/OnlineControllerPickMenuScreen.tscn")

func _on_join_private_room_pressed() -> void:
	Global.IS_PUBLIC_LOBBY = false
	get_tree().change_scene_to_file("res://game/menus/onlinemenu/JoinRoom.tscn")

func _on_create_private_room_pressed():
	Global.IS_PUBLIC_LOBBY = false
	get_tree().change_scene_to_file("res://game/menus/onlinemenu/CreateRoomSettings.tscn")

func _on_create_public_room():
	Global.IS_PUBLIC_LOBBY = true
	get_tree().change_scene_to_file("res://game/menus/onlinemenu/CreatePublicRoom.tscn")

func _on_find_public_match():
	Global.IS_PUBLIC_LOBBY = true
	get_tree().change_scene_to_file("res://game/menus/onlinemenu/FindPublicRoom.tscn")

func _on_change_controls():
	button_menu = BUTTON_MAP_MENU.instantiate()
	add_child(button_menu)
	button_menu.remove_player(false)
	button_menu.connect("complete", Callable(self, "button_set_complete"))
	get_tree().paused = true

func button_set_complete():
	get_tree().paused = false
	button_menu.disconnect("complete", Callable(self, "button_set_complete"))
	button_menu.queue_free()
	button_menu = null
