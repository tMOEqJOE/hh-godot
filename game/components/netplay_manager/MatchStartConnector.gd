extends Node

signal connected

var MESSAGE_COUNT:int = 10
var received_message:bool

func _init() -> void:
	received_message = false

func send_start_signal():
	for i in range(MESSAGE_COUNT):
		rpc("start_game_client")
	start_game_server()

@rpc("any_peer", "unreliable")
func start_game_client() -> void:
	if not received_message: # and not multiplayer.is_server():
		received_message = true
		connected.emit()

func start_game_server() -> void:
	received_message = true
	connected.emit()

func clear_received_message():
	received_message = false
