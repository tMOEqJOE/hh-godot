extends Node2D

var match_id: String

func _ready() -> void:
	MainMenuMusicControl.play_main_menu_music()
	$CanvasLayer/GridContainer/PasteButton.grab_focus()
	Global.NETPLAY_MODE = Global.NETPLAY_MODES.PRIVATE_ROOM
	$AruDJAnimator.play("Idle")
	
	OnlineLobby.connect("error", Callable(self, "_on_OnlineLobby_error"))
	OnlineLobby.connect("match_joined", Callable(self, "_on_OnlineLobby_match_joined"))
	
	# We can configure OnlineMatch before using it:
#	OnlineLobby.min_players = 2
#	OnlineLobby.max_players = 8
	OnlineLobby.client_version = Global.BATTLE_ENGINE_VERSION
	OnlineLobby.use_network_relay = OnlineLobby.NetworkRelay.AUTO
	
#	OnlineMatch.min_players = 2
#	OnlineMatch.max_players = 8
	OnlineMatch.ice_servers = [{ "urls": ["stun:stun.l.google.com:19302"] }]
	OnlineMatch.use_network_relay = OnlineMatch.NetworkRelay.AUTO

func _on_OnlineLobby_error(message: String) -> void:
	print("ERROR: %s" % message)
	$CanvasLayer/MessageLabel.text = "ERROR: " + message

func _on_OnlineLobby_match_joined(match_id: String) -> void:
	print("Joined private match: %s" % match_id)
	$CanvasLayer/MessageLabel.text = "Joined private match: " + match_id
	get_tree().change_scene_to_file("res://game/menus/onlinemenu/PrivateRoom.tscn")

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if ($CanvasLayer/GridContainer/RoomIDField.has_focus()):
			pass
		elif event.is_action_pressed("ui_cancel"):
			get_tree().change_scene_to_file("res://game/menus/onlinemenu/OnlineModes.tscn")

func _on_create_private_room_pressed():
	OnlineLobby.join_match(Global.nakama_socket, $CanvasLayer/GridContainer/RoomIDField.text)

func _on_paste_button_pressed():
	$CanvasLayer/GridContainer/RoomIDField.text = DisplayServer.clipboard_get()
	$CanvasLayer/MessageLabel.text = "Pasted from clipboard"
