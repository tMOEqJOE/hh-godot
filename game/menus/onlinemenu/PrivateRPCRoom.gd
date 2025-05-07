extends Node2D

@onready var Challenge = load("res://game/menus/onlinemenu/Challenge.tscn")
var challenge

enum CHALLENGE_STATE {
	IDLE,
	CHALLENGING,
	DECIDING,
	IN_MATCH,
}

var challenge_state: int = CHALLENGE_STATE.IDLE

func _ready() -> void:
	MainMenuMusicControl.play_main_menu_music()
	Global.NETPLAY_MODE = Global.NETPLAY_MODES.PRIVATE_ROOM
	$AruDJAnimator.play("Idle")
	$CanvasLayer/RoomIDField.secret = true
	$CanvasLayer/GridContainer/CopyRoomID.grab_focus()
	$CanvasLayer/GridContainer/InputDelayMeter.value = SyncManager.input_delay
	join_an_online_match()

func join_an_online_match() -> void:
	# Connect to all of OnlineMatch's signals.
	OnlineMatch.connect("error", Callable(self, "_on_OnlineMatch_error"))
	OnlineMatch.connect("disconnected", Callable(self, "_on_OnlineMatch_disconnected"))
	OnlineMatch.connect("match_created", Callable(self, "_on_OnlineMatch_match_created"))
	OnlineMatch.connect("match_joined", Callable(self, "_on_OnlineMatch_match_joined"))
	OnlineMatch.connect("matchmaker_matched", Callable(self, "_on_OnlineMatch_matchmaker_matched"))
	OnlineMatch.connect("player_joined", Callable(self, "_on_OnlineMatch_player_joined"))
	OnlineMatch.connect("player_left", Callable(self, "_on_OnlineMatch_player_left"))
	OnlineMatch.connect("player_status_changed", Callable(self, "_on_OnlineMatch_player_status_changed"))
	OnlineMatch.connect("match_ready", Callable(self, "_on_OnlineMatch_match_ready"))
	OnlineMatch.connect("match_not_ready", Callable(self, "_on_OnlineMatch_match_not_ready"))

func _on_OnlineMatch_error(message: String) -> void:
	print("ERROR: %s" % message)
	$CanvasLayer/MessageLabel.text = "ERROR: " + message

func _on_OnlineMatch_disconnected() -> void:
	print("Disconnected from match.")
	$CanvasLayer/MessageLabel.text = "Disconnected from match"

func _on_OnlineMatch_match_created(match_id: String) -> void:
	print("Private match created: %s" % match_id)
	$CanvasLayer/MessageLabel.text = "Private match created: " + match_id

func _on_OnlineMatch_match_joined(match_id: String) -> void:
	print("Joined private match: %s" % match_id)
	$CanvasLayer/MessageLabel.text = "Joined private match: " + match_id

func _on_OnlineMatch_matchmaker_matched(players: Dictionary) -> void:
	print("Joined match via matchmaker")
	for player in players.values():
		print ("Player joined: %s" % player.username)
		$CanvasLayer/MessageLabel.text = "Player joined: " + player.username

func _on_OnlineMatch_player_joined(player: OnlineMatch.Player) -> void:
	print("Player joined: %s" % player.username)
	$CanvasLayer/MessageLabel.text = "Player joined: " + player.username

func _on_OnlineMatch_player_left(player: OnlineMatch.Player) -> void:
	print("Player left: %s" % player.username)
	$CanvasLayer/MessageLabel.text = "Player left: " + player.username

func _on_OnlineMatch_player_status_changed(player: OnlineMatch.Player, status) -> void:
	print("Player status changed: %s -> %s" % [player.username, status])
	if player.peer_id != SyncManager.network_adaptor.get_unique_id() && status == OnlineMatch.PlayerStatus.CONNECTED:
		rpc_id(player.peer_id, "receive_message", "Hi! We're connected now :-)")

@rpc("any_peer") func receive_message(message: String) -> void:
	print("Message from %s: %s" % [multiplayer.get_remote_sender_id(), message])

func _on_OnlineMatch_match_not_ready() -> void:
	print("The match isn't ready to start")

func _on_OnlineMatch_match_ready(players: Dictionary) -> void:
	print("The match is ready to start! Here are players:")
	$CanvasLayer/MessageLabel.text = "Match is starting!"
	for player in players.values():
		print ("- %s" % player.username)
	
@rpc("any_peer", "call_local") func match_ready_up(peer_id) -> void:
	if peer_id != multiplayer.get_unique_id():
		if (challenge_state != CHALLENGE_STATE.CHALLENGING):
			rpc("decline_challenge")
		challenge = Challenge.instantiate()
		challenge.connect("accept_result", Callable(self, "accept_challenge"))
		add_child(challenge)
		challenge_state = CHALLENGE_STATE.DECIDING

func accept_challenge(accept_result: bool):
	if (accept_result):
		rpc("start_game")
	else:
		rpc("decline_challenge")

@rpc("any_peer", "call_local") func decline_challenge():
	$CanvasLayer/GridContainer/CopyRoomID.grab_focus()
	delete_challenge_pop_up()

@rpc("any_peer", "call_local") func start_game() -> void:
	print ("The host told me it's time to start the game!")
	delete_challenge_pop_up()
	OnlineMatch.start_playing()
	get_tree().change_scene_to_file("res://game/menus/onlinemenu/OnlineCharacterSelect.tscn")

func delete_challenge_pop_up():
	if (challenge != null):
		challenge.disconnect("accept_result", Callable(self, "accept_challenge"))
		challenge.queue_free()
		challenge = null
		challenge_state = CHALLENGE_STATE.IDLE

func _on_InputDelayMeter_value_changed(value):
	$CanvasLayer/GridContainer/InputDelayLabel.set_text("Input Delay: " + str(int(value)))
	SyncManager.set_input_delay(int($CanvasLayer/GridContainer/InputDelayMeter.value))

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		OnlineMatch.leave()
		get_tree().change_scene_to_file("res://game/menus/onlinemenu/OnlineModes.tscn")

func _on_copy_room_id_pressed():
	DisplayServer.clipboard_set(OnlineMatch.match_id) 
	$CanvasLayer/MessageLabel.text = "Copied Room ID to clipboard"

func _on_hide_room_id_pressed():
	$CanvasLayer/RoomIDField.secret = !$CanvasLayer/RoomIDField.secret
	if (not $CanvasLayer/RoomIDField.secret):
		$CanvasLayer/RoomIDField.text = str(OnlineMatch.match_id)
		$CanvasLayer/MessageLabel.text = "Showing room ID"
	else: 
		$CanvasLayer/MessageLabel.text = "Hiding room ID"

func _on_start_game_pressed():
	var match_state = OnlineMatch.get_match_state()
	if (match_state == OnlineMatch.MatchState.READY or match_state == OnlineMatch.MatchState.PLAYING):
		if (challenge_state == CHALLENGE_STATE.IDLE):
			rpc("match_ready_up", multiplayer.get_unique_id())
			challenge_state = CHALLENGE_STATE.CHALLENGING
