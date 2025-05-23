# https://heroiclabs.com/docs/nakama/concepts/multiplayer/relayed/
extends Node

var min_players := 2
var max_players := 4
var client_version := 'dev'

enum NetworkRelay {
	AUTO,
	FORCED,
	DISABLED
}
var use_network_relay: int = NetworkRelay.AUTO

# Nakama variables:
var nakama_socket: NakamaSocket
var my_session_id: String: get = get_my_session_id
var isolated_match_session_id: String # use to remember who you need to send the match invite to
var match_id: String: get = get_match_id

#var all_peer_spectators: Dictionary  # Change it so you send p1 and p2 session ids through the network
var my_spectators: Dictionary # Dictionary of my peer spectator session_ids as key, to player value
var players: Dictionary

var host_players: Array

var _next_peer_id: int

enum MatchState {
	LOBBY = 0,
	MATCHING = 1,
	CONNECTING = 2,
	WAITING_FOR_ENOUGH_PLAYERS = 3,
	READY = 4,
	PLAYING = 5,
}
var match_state: int = MatchState.LOBBY: get = get_match_state

enum MatchMode {
	NONE = 0,
	CREATE = 1,
	JOIN = 2,
	MATCHMAKER = 3,
	PUBLICLOBBY = 4,
}

var match_mode: int = MatchMode.NONE: get = get_match_mode

enum PlayerStatus {
	CONNECTING = 0,
	CONNECTED = 1,
}

enum CHALLENGE_STATE {
	IDLE,
	CHALLENGING,
	DECIDING,
	SPECTATING,
	IN_GAME,
}

enum MatchOpCode {
	WEBRTC_PEER_METHOD = 9001,
	JOIN_SUCCESS = 9002,
	JOIN_ERROR = 9003,
	CHALLENGE = 9004,
	CHALLENGE_ACCEPT = 9005,
	SEND_GAME_ID = 9006,
	SPECTATE_REQUEST = 9007,
	SPECTATE_SEND_GAME_ID = 9008,
	SPECTATE_DISCONNECT_REQUEST = 9009,
	SPECTATE_REQUEST_ACCEPT = 9010,
	CHALLENGE_DISCONNECT = 9011,
	STATUS_UPDATE = 9012,
}

enum JoinErrorReason {
	MATCH_HAS_ALREADY_BEGUN,
	MATCH_IS_FULL,
}

const JOIN_ERROR_MESSAGES := {
	JoinErrorReason.MATCH_HAS_ALREADY_BEGUN: "Sorry! The match has already begun.",
	JoinErrorReason.MATCH_IS_FULL: "Sorry! The match is full.",
}

enum ErrorCode {
	MATCH_CREATE_FAILED,
	JOIN_MATCH_FAILED,
	START_MATCHMAKING_FAILED,
	WEBSOCKET_CONNECTION_ERROR,
	HOST_DISCONNECTED,
	MATCHMAKER_ERROR,
	CLIENT_VERSION_ERROR,
	CLIENT_JOIN_ERROR,
	WEBRTC_OFFER_ERROR,
	FIND_PUBLIC_LOBBY_FAILED,
}

const ERROR_MESSAGES := {
	ErrorCode.MATCH_CREATE_FAILED: "Lobby: Failed to create match",
	ErrorCode.JOIN_MATCH_FAILED: "Lobby: Unable to join match",
	ErrorCode.START_MATCHMAKING_FAILED: "Lobby: Unable to join match making pool",
	ErrorCode.WEBSOCKET_CONNECTION_ERROR: "Lobby: WebSocket connection error",
	ErrorCode.HOST_DISCONNECTED: "Lobby: Host has disconnected",
	ErrorCode.MATCHMAKER_ERROR: "Lobby: Matchmaker error",
	ErrorCode.CLIENT_VERSION_ERROR: "Lobby: Client version doesn't match host",
	ErrorCode.CLIENT_JOIN_ERROR: "Lobby: Client not allowed to join",
	ErrorCode.WEBRTC_OFFER_ERROR: "Lobby: Unable to create WebRTC offer",
	ErrorCode.FIND_PUBLIC_LOBBY_FAILED: "Lobby: Failed to find public lobbies",
}

signal error (message)
signal error_code (code, message, extra)
signal disconnected ()

signal match_created (match_id)
signal match_joined (match_id)
signal public_lobbies_found (match_data)

signal player_joined (player)
signal player_left (player)
signal player_status_changed (player, status)

signal challenge_status_changed(player, status)

signal match_ready (players)
signal match_not_ready ()

signal challenge_received(sender, is_connect)
signal challenge_accepted(sender, accepted)
signal game_id_received(sender, game_id)
signal spectate_request_received(sender, is_connect)
signal spectate_request_accepted(sender, is_connect)

class Player:
	var session_id: String
	var peer_id: int
	var username: String
	var status: int

	func _init(_session_id: String, _username: String, _peer_id: int) -> void:
		session_id = _session_id
		username = _username
		peer_id = _peer_id
		status = CHALLENGE_STATE.IDLE

	static func from_presence(presence: NakamaRTAPI.UserPresence, _peer_id: int) -> Player:
		return Player.new(presence.session_id, presence.username, _peer_id)

	static func from_dict(data: Dictionary) -> Player:
		return Player.new(data['session_id'], data['username'], int(data['peer_id']))

	func to_dict() -> Dictionary:
		return {
			session_id = session_id,
			username = username,
			peer_id = peer_id,
			status = status
		}

static func serialize_players(_players: Dictionary) -> Dictionary:
	var result := {}
	for key in _players:
		result[key] = _players[key].to_dict()
	return result

static func unserialize_players(_players: Dictionary) -> Dictionary:
	var result := {}
	for key in _players:
		result[key] = Player.from_dict(_players[key])
	return result

func _set_readonly_variable(_value) -> void:
	pass

func _set_nakama_socket(_nakama_socket: NakamaSocket) -> void:
	if nakama_socket == _nakama_socket:
		return

	if nakama_socket:
		nakama_socket.disconnect("closed", Callable(self, "_on_nakama_closed"))
		nakama_socket.disconnect("received_error", Callable(self, "_on_nakama_error"))
		nakama_socket.disconnect("received_match_state", Callable(self, "_on_nakama_match_state"))
		nakama_socket.disconnect("received_match_presence", Callable(self, "_on_nakama_match_presence"))
		nakama_socket.disconnect("received_matchmaker_matched", Callable(self, "_on_nakama_matchmaker_matched"))

	nakama_socket = _nakama_socket
	if nakama_socket:
		nakama_socket.connect("closed", Callable(self, "_on_nakama_closed"))
		nakama_socket.connect("received_error", Callable(self, "_on_nakama_error"))
		nakama_socket.connect("received_match_state", Callable(self, "_on_nakama_match_state"))
		nakama_socket.connect("received_match_presence", Callable(self, "_on_nakama_match_presence"))
		nakama_socket.connect("received_matchmaker_matched", Callable(self, "_on_nakama_matchmaker_matched"))

func _emit_error(code: int, extra = null):
	var message = ERROR_MESSAGES[code]
	if code == ErrorCode.CLIENT_JOIN_ERROR:
		if extra != null:
			message = JOIN_ERROR_MESSAGES.get(extra, message)
	emit_signal("error", message)
	emit_signal("error_code", code, message, extra)

func create_match(_nakama_socket: NakamaSocket) -> void:
	leave()
	_set_nakama_socket(_nakama_socket)
	match_mode = MatchMode.CREATE

	var data = await nakama_socket.create_match_async()
	if data.is_exception():
		leave()
		_emit_error(ErrorCode.MATCH_CREATE_FAILED, data.get_exception())
	else:
		_on_nakama_match_created(data)

func join_match(_nakama_socket: NakamaSocket, _match_id: String) -> void:
	leave()
	_set_nakama_socket(_nakama_socket)
	match_mode = MatchMode.JOIN

	var data = await nakama_socket.join_match_async(_match_id)
	if data.is_exception():
		leave()
		_emit_error(ErrorCode.JOIN_MATCH_FAILED, data.get_exception())
	else:
		_on_nakama_match_join(data)

func join_public_lobby(_nakama_socket: NakamaSocket, _match_id: String) -> void:
	leave()
	_set_nakama_socket(_nakama_socket)
	match_id = _match_id
	match_mode = MatchMode.PUBLICLOBBY
	
	var payload_dict = {
		"battleEngineVersion" : Global.get_battle_version(),
	}
	var data = await nakama_socket.join_match_async(_match_id, payload_dict)
	if data.is_exception():
		leave()
		_emit_error(ErrorCode.JOIN_MATCH_FAILED, data.get_exception())
	else:
		_on_nakama_match_join(data)

func create_new_public_lobby(_nakama_socket: NakamaSocket):
	leave()
	_set_nakama_socket(_nakama_socket)
	match_mode = MatchMode.PUBLICLOBBY
	var payload_dict = {
		"isPrivate" : false,
		"battleEngineVersion" : Global.get_battle_version(),
	}
	var payload = JSON.stringify(payload_dict)
	var data = await nakama_socket.rpc_async("create-match", payload)
	if data.is_exception():
		leave()
		_emit_error(ErrorCode.MATCH_CREATE_FAILED, data.get_exception())
	else:
		_on_nakama_public_lobby_created(data)

func find_lobbies(nakama_socket: NakamaSocket, nakama_client: NakamaClient, nakama_session: NakamaSession):
	_set_nakama_socket(nakama_socket)
	var query = "+label.isPrivate:false +label.battleEngineVersion:"+Global.get_battle_version()
	var data: NakamaAPI.ApiMatchList = await nakama_client.list_matches_async(nakama_session, 0, 250, 100, true, "", query)
	if data.is_exception():
		_emit_error(ErrorCode.FIND_PUBLIC_LOBBY_FAILED, data.get_exception())
		return null
	else:
		_on_nakama_match_public_lobbies_found(data)

func start_playing() -> void:
	pass

func leave(close_socket: bool = false) -> void:
	# Nakama disconnect.
	if nakama_socket:
		if match_id:
			await nakama_socket.leave_match_async(match_id)
		if close_socket:
			nakama_socket.close()
			_set_nakama_socket(null)

	# Initialize all the variables to their default state.
	my_session_id = ''
	match_id = ''
	players = {}
	my_spectators = {}
	host_players = []
	_next_peer_id = 1
	match_state = MatchState.LOBBY
	match_mode = MatchMode.NONE

func get_my_session_id() -> String:
	return my_session_id

func get_match_id() -> String:
	return match_id

func get_match_mode() -> int:
	return match_mode

func get_match_state() -> int:
	return match_state

func get_session_id(peer_id: int):
	for session_id in players:
		if players[session_id]['peer_id'] == peer_id:
			return session_id
	return null

func get_player_by_peer_id(peer_id: int) -> Player:
	var session_id = get_session_id(peer_id)
	if session_id:
		return players[session_id]
	return null

func get_players_by_peer_id() -> Dictionary:
	var result := {}
	for player in players.values():
		result[player.peer_id] = player
	return result

func get_player_names_by_peer_id() -> Dictionary:
	var result := {}
	for session_id in players:
		result[players[session_id]['peer_id']] = players[session_id]['username']
	return result

func _on_nakama_error(data) -> void:
	print ("ERROR:")
	print(data)
	leave()
	_emit_error(ErrorCode.WEBSOCKET_CONNECTION_ERROR, data)

func _on_nakama_closed() -> void:
	leave()
	emit_signal("disconnected")

func _on_nakama_match_created(data: NakamaRTAPI.Match) -> void:
	match_id = data.match_id
	my_session_id = data.self_user.session_id
	var my_player = Player.from_presence(data.self_user, 1)
	players[my_session_id] = my_player
	_next_peer_id = 2

	emit_signal("match_created", match_id)
	emit_signal("player_joined", my_player)
	emit_signal("player_status_changed", my_player, PlayerStatus.CONNECTED)

func _on_nakama_public_lobby_created(data: NakamaAPI.ApiRpc) -> void:
	var json_result = JSON.new()
	var error = json_result.parse(data.payload)
	if error != OK:
		print(error)
		return

	var content = json_result.data
	var match_id = content['matchId']
	match_id = match_id
	
	emit_signal("match_created", match_id)

func _on_nakama_match_presence(p_presence: NakamaRTAPI.MatchPresenceEvent) -> void:
	if (p_presence.match_id != match_id):
		return
	
	for presence in p_presence.joins:
		if presence.session_id == my_session_id:
			continue

		if match_mode == MatchMode.CREATE:
			if match_state == MatchState.PLAYING:
				# Tell this player that we've already started
				nakama_socket.send_match_state_async(match_id, MatchOpCode.JOIN_ERROR, JSON.stringify({
					target = presence['session_id'],
					code = JoinErrorReason.MATCH_HAS_ALREADY_BEGUN,
					reason = JOIN_ERROR_MESSAGES[JoinErrorReason.MATCH_HAS_ALREADY_BEGUN],
				}))

			elif players.size() < max_players:
				var new_player = Player.from_presence(presence, _next_peer_id)
				_next_peer_id += 1
				players[presence.session_id] = new_player
				emit_signal("player_joined", new_player)

				# Tell this player (and the others) about all the players peer ids.
				nakama_socket.send_match_state_async(match_id, MatchOpCode.JOIN_SUCCESS, JSON.stringify({
					players = serialize_players(players),
					client_version = client_version,
				}))
			else:
				# Tell this player that we're full up!
				nakama_socket.send_match_state_async(match_id, MatchOpCode.JOIN_ERROR, JSON.stringify({
					target = presence['session_id'],
					code = JoinErrorReason.MATCH_IS_FULL,
					reason = JOIN_ERROR_MESSAGES[JoinErrorReason.MATCH_IS_FULL],
				}))
		
	for presence in p_presence.leaves:
		if p_presence.match_id != self.match_id:
			continue
		if presence.session_id == my_session_id:
			continue
		if not players.has(presence.session_id):
			continue

		var player = players[presence.session_id]

		# If the host disconnects, this is the end!
		if player.peer_id == 1:
			leave()
			_emit_error(ErrorCode.HOST_DISCONNECTED)
		else:
			players.erase(presence.session_id)
			if (my_spectators.has(presence.session_id)):
				my_spectators.erase(presence.session_id)
			emit_signal("player_left", player)

			if players.size() < min_players:
				# If state was previously ready, but this brings us below the minimum players,
				# then we aren't ready anymore.
				if match_state == MatchState.READY:
					match_state = MatchState.WAITING_FOR_ENOUGH_PLAYERS
					emit_signal("match_not_ready")

func _on_nakama_match_join(data: NakamaRTAPI.Match) -> void:
	match_id = data.match_id
	my_session_id = data.self_user.session_id

	if match_mode == MatchMode.JOIN or match_mode == MatchMode.PUBLICLOBBY:
		emit_signal("match_joined", match_id)

func _on_nakama_match_public_lobbies_found(data: NakamaAPI.ApiMatchList) -> void:
	emit_signal("public_lobbies_found", data.matches)

func _on_nakama_match_state(data: NakamaRTAPI.MatchData) -> void:	
	var json_result = JSON.new()
	var error = json_result.parse(data.data)
	if error != OK:
		print(error)
		return

	if (data.match_id != self.match_id):
		return

	var content = json_result.data
	
	if (match_mode == MatchMode.PUBLICLOBBY):
		if data.op_code == MatchOpCode.JOIN_SUCCESS:
			var host_client_version = content.get('client_version', '')
			if client_version != host_client_version:
				leave()
				_emit_error(ErrorCode.CLIENT_VERSION_ERROR, host_client_version)
				return

			var content_players = unserialize_players(content['players'])
			for session_id in content_players:
#				print(session_id)
#				print(content_players[session_id])
				if not players.has(session_id):
					players[session_id] = content_players[session_id]
					emit_signal("player_joined", players[session_id])
					if session_id == my_session_id:
						emit_signal("player_status_changed", players[session_id], PlayerStatus.CONNECTED)
		if data.op_code == MatchOpCode.JOIN_ERROR:
			if content['target'] == my_session_id:
				leave()
				_emit_error(ErrorCode.CLIENT_JOIN_ERROR, content['code'])
				return
		
		if data.op_code == MatchOpCode.CHALLENGE:
			if content['target'] == my_session_id:
				emit_signal("challenge_received", content["sender"], true)
				return
		
		if data.op_code == MatchOpCode.CHALLENGE_DISCONNECT:
			if content['target'] == my_session_id:
				emit_signal("challenge_received", content["sender"], false)
				return
		
		if data.op_code == MatchOpCode.CHALLENGE_ACCEPT:
			if content['target'] == my_session_id:
				emit_signal("challenge_accepted", content["sender"], content['accepted'])
				return
		
		if data.op_code == MatchOpCode.SEND_GAME_ID:
			if content['target'] == my_session_id:
				host_players = []
				host_players.append(content["sender"])
				host_players.append(my_session_id)
				emit_signal("game_id_received", content["sender"], content['game_id'])
				for spectator in my_spectators:
					nakama_socket.send_match_state_async(match_id, MatchOpCode.SPECTATE_SEND_GAME_ID, JSON.stringify({
						client_version = client_version,
						game_id = content['game_id'],
						target = spectator,
						sender = my_session_id,
						host = content["sender"],
						client = my_session_id,
					}))
			return
		
		if data.op_code == MatchOpCode.SPECTATE_REQUEST:
			if content['target'] == my_session_id:
				emit_signal("spectate_request_received", content["sender"], true)
				return
		if data.op_code == MatchOpCode.SPECTATE_DISCONNECT_REQUEST:
			if (my_spectators.has(content['sender'])):
				my_spectators.erase(content['sender'])
				emit_signal("spectate_request_received", content["sender"], false)
			return
		
		if data.op_code == MatchOpCode.SPECTATE_REQUEST_ACCEPT:
			if content['target'] == my_session_id:
				emit_signal("spectate_request_accepted", content["sender"], content["accept"])
				return
		
		if data.op_code == MatchOpCode.SPECTATE_SEND_GAME_ID:
			if content['target'] == my_session_id:
				host_players = []
				host_players.append(content["host"])
				host_players.append(content["client"])
				emit_signal("game_id_received", content["sender"], content['game_id'])
				return
		
		if data.op_code == MatchOpCode.STATUS_UPDATE:
			players[content["sender"]].status = content["status"]
			emit_signal("challenge_status_changed", content["sender"], content["status"])
			return
		return
	else:
		if data.op_code == MatchOpCode.WEBRTC_PEER_METHOD:
			if content['target'] == my_session_id:
				var session_id = data.presence.session_id
		if data.op_code == MatchOpCode.JOIN_SUCCESS && match_mode == MatchMode.JOIN:
			var host_client_version = content.get('client_version', '')
			if client_version != host_client_version:
				leave()
				#error.emit("Client version doesn't match host")
				_emit_error(ErrorCode.CLIENT_VERSION_ERROR, "") #host_client_version)
				return

			var content_players = unserialize_players(content['players'])
			for session_id in content_players:
				if not players.has(session_id):
					players[session_id] = content_players[session_id]
					emit_signal("player_joined", players[session_id])
					if session_id == my_session_id:
						emit_signal("player_status_changed", players[session_id], PlayerStatus.CONNECTED)
		if data.op_code == MatchOpCode.JOIN_ERROR:
			if content['target'] == my_session_id:
				leave()
				_emit_error(ErrorCode.CLIENT_JOIN_ERROR, content['code'])
				return
		
		if data.op_code == MatchOpCode.CHALLENGE:
			if content['target'] == my_session_id:
				emit_signal("challenge_received", content["sender"], true)
				return
		
		if data.op_code == MatchOpCode.CHALLENGE_DISCONNECT:
			if content['target'] == my_session_id:
				emit_signal("challenge_received", content["sender"], false)
				return
		
		if data.op_code == MatchOpCode.CHALLENGE_ACCEPT:
			if content['target'] == my_session_id:
				emit_signal("challenge_accepted", content["sender"], content['accepted'])
				return
		
		if data.op_code == MatchOpCode.SEND_GAME_ID:
			if content['target'] == my_session_id:
				host_players = []
				host_players.append(content["sender"])
				host_players.append(my_session_id)
				emit_signal("game_id_received", content["sender"], content['game_id'])
				for spectator in my_spectators:
					nakama_socket.send_match_state_async(match_id, MatchOpCode.SPECTATE_SEND_GAME_ID, JSON.stringify({
						client_version = client_version,
						game_id = content['game_id'],
						target = spectator,
						sender = my_session_id,
						host = content["sender"],
						client = my_session_id,
					}))
			return
		
		if data.op_code == MatchOpCode.SPECTATE_REQUEST:
			if content['target'] == my_session_id:
				emit_signal("spectate_request_received", content["sender"], true)
				return
		if data.op_code == MatchOpCode.SPECTATE_DISCONNECT_REQUEST:
			if (my_spectators.has(content['sender'])):
				my_spectators.erase(content['sender'])
				emit_signal("spectate_request_received", content["sender"], false)
			return
		
		if data.op_code == MatchOpCode.SPECTATE_REQUEST_ACCEPT:
			if content['target'] == my_session_id:
				emit_signal("spectate_request_accepted", content["sender"], content["accept"])
				return
		
		if data.op_code == MatchOpCode.SPECTATE_SEND_GAME_ID:
			if content['target'] == my_session_id:
				host_players = []
				host_players.append(content["host"])
				host_players.append(content["client"])
				emit_signal("game_id_received", content["sender"], content['game_id'])
				return
		
		if data.op_code == MatchOpCode.STATUS_UPDATE:
			players[content["sender"]].status = content["status"]
			emit_signal("challenge_status_changed", content["sender"], content["status"])
			return

func send_challenge(session_id):
	nakama_socket.send_match_state_async(match_id, MatchOpCode.CHALLENGE, JSON.stringify({
		client_version = client_version,
		target = session_id,
		sender = my_session_id
	}))

func send_challenge_disconnect(session_id):
	nakama_socket.send_match_state_async(match_id, MatchOpCode.CHALLENGE_DISCONNECT, JSON.stringify({
		client_version = client_version,
		target = session_id,
		sender = my_session_id
	}))

func accept_challenge(session_id, p_accepted: bool):
	nakama_socket.send_match_state_async(match_id, MatchOpCode.CHALLENGE_ACCEPT, JSON.stringify({
		client_version = client_version,
		target = session_id,
		sender = my_session_id,
		accepted = p_accepted,
	}))

func send_game_id(session_id, p_game_id: String):
	# Tell this player (and the others) about all the players peer ids.
	host_players = []
	host_players.append(my_session_id)
	host_players.append(session_id)
	
	for spectator in my_spectators.keys():
		nakama_socket.send_match_state_async(match_id, MatchOpCode.SPECTATE_SEND_GAME_ID, JSON.stringify({
			client_version = client_version,
			game_id = p_game_id,
			target = spectator,
			sender = my_session_id,
			host = my_session_id,
			client = session_id,
		}))
	nakama_socket.send_match_state_async(match_id, MatchOpCode.SEND_GAME_ID, JSON.stringify({
		client_version = client_version,
		game_id = p_game_id,
		target = session_id,
		sender = my_session_id,
	}))

func send_spectate_request(session_id):
	# Tell this player (and the others) about all the players peer ids.
	nakama_socket.send_match_state_async(match_id, MatchOpCode.SPECTATE_REQUEST, JSON.stringify({
		client_version = client_version,
		target = session_id,
		sender = my_session_id
	}))
	
	for spectator_id in my_spectators.keys():
		nakama_socket.send_match_state_async(match_id, MatchOpCode.SPECTATE_REQUEST_ACCEPT, JSON.stringify({
			client_version = client_version,
			target = spectator_id,
			sender = my_session_id,
			accept = false,
		}))
	my_spectators = {}

func accept_spectate_request(session_id: String, accepted: bool):
	if (accepted):
		my_spectators[session_id] = players[session_id]
	
	nakama_socket.send_match_state_async(match_id, MatchOpCode.SPECTATE_REQUEST_ACCEPT, JSON.stringify({
		client_version = client_version,
		target = session_id,
		sender = my_session_id,
		accept = accepted,
	}))

func send_status_update(new_status: int):
	nakama_socket.send_match_state_async(match_id, MatchOpCode.STATUS_UPDATE, JSON.stringify({
		sender = my_session_id,
		status = new_status,
	}))

func send_spectate_disconnect_request(session_id: String):
	# Tell this player (and the others) about all the players peer ids.
	nakama_socket.send_match_state_async(match_id, MatchOpCode.SPECTATE_DISCONNECT_REQUEST, JSON.stringify({
		client_version = client_version,
		sender = my_session_id,
	}))

func clear_my_spectators():
	my_spectators = {}
