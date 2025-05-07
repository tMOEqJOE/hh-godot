extends Node2D

func _ready() -> void:
	MainMenuMusicControl.play_main_menu_music()
	Global.NETPLAY_MODE = Global.NETPLAY_MODES.PRIVATE_ROOM
	$CanvasLayer/GridContainer/CreateRoomButton.grab_focus()
	$AruDJAnimator.play("Idle")
	
	OnlineLobby.connect("error", Callable(self, "_on_OnlineMatch_error"))
	OnlineLobby.connect("match_created", Callable(self, "_on_OnlineMatch_match_created"))
	
	# We can configure OnlineMatch before using it:
	OnlineLobby.min_players = 2
	OnlineLobby.max_players = 8
	OnlineLobby.client_version = Global.BATTLE_ENGINE_VERSION
	OnlineLobby.use_network_relay = OnlineLobby.NetworkRelay.AUTO
	
	OnlineMatch.min_players = 2
	OnlineMatch.max_players = 8
	OnlineMatch.ice_servers = [{ "urls": ["stun:stun.l.google.com:19302"] }]
	OnlineMatch.use_network_relay = OnlineMatch.NetworkRelay.AUTO
	update_lobby_size($CanvasLayer/GridContainer/PlayerCountMeter.value)

func _on_OnlineMatch_error(message: String) -> void:
	print("ERROR: %s" % message)
	$CanvasLayer/MessageLabel.text = "ERROR: " + message

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://game/menus/onlinemenu/OnlineModes.tscn")

func _on_create_private_room_pressed():
	OnlineLobby.create_match(Global.nakama_socket)

func _on_OnlineMatch_match_created(match_id: String) -> void:
	print("Private match created: %s" % match_id)
	$CanvasLayer/MessageLabel.text = "Private match created: " + match_id
	get_tree().change_scene_to_file("res://game/menus/onlinemenu/PrivateRoom.tscn")

func _on_PlayerCountMeter_value_changed(value):
	update_lobby_size(value)

func update_lobby_size(new_size):
	OnlineLobby.max_players = new_size
	OnlineMatch.max_players = new_size
	$CanvasLayer/GridContainer/PlayerCountLabel.text = "Max lobby size: " + str(new_size)
	
