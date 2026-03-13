extends RefCounted

class_name MatchConnectionManager

signal all_peers_ready()

var match_disconnected: bool = false
var peer_ready:Dictionary = {} # indicates setup is completed

func _all_peers_ready():
	if (Global.NETPLAY_MODE != Global.NETPLAY_MODES.OFFLINE and not Global.DEBUG):
		return peer_ready.size() >= SyncManager.peers.size() + 1
	else:
		all_peers_ready.emit()

@rpc("any_peer", "call_local") func connect_peer_ready() -> void:
	var peer_id = multiplayer.get_remote_sender_id()
	if multiplayer.is_server():
		peer_ready[peer_id] = true
		message_label.text = "# of Peers loaded: " + str(len(peer_ready))
		if (all_peers_ready()):
			rpc("start_game")

func init():
	match_disconnected = false
	peer_ready = {}

func peer_setup_complete(peer_id: int):
	peer_ready[peer_id] = true
