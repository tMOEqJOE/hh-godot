extends Control

signal challenge(session_id, curr_state)
signal spectate(session_id, curr_state)

#var frame = 0
#var frame_update = 10

var ping: int
var player: OnlineLobby.Player: get = get_player, set = set_player 

var challenging: bool: get = get_challenging, set = set_challenging
var spectating: bool: get = get_spectating, set = set_spectating

func _ready() -> void:
	ping = -1
	challenging = false
	spectating = false

func update_ping(new_ping: int, msg):
	ping = new_ping
	$PingLabel.set_text("Ping: " + str(ping) + "ms")

func update_status(new_status: int):
	if (new_status == OnlineLobby.CHALLENGE_STATE.IN_GAME):
		$StatusLabel.text = "In a Game"
		$Background.self_modulate = Color("#550606")
	elif (new_status == OnlineLobby.CHALLENGE_STATE.CHALLENGING):
		$StatusLabel.text = "Challenging"
		$Background.self_modulate = Color("#ddaa30")
	elif (new_status == OnlineLobby.CHALLENGE_STATE.DECIDING):
		$StatusLabel.text = "Deciding"
		$Background.self_modulate = Color("#184b9b")
	elif (new_status == OnlineLobby.CHALLENGE_STATE.SPECTATING):
		$StatusLabel.text = "Spectating"
		$Background.self_modulate = Color("#580f8a")
	else:
		$StatusLabel.text = "Ready"
		$Background.self_modulate = Color("#146c76")

func set_player(p_player: OnlineLobby.Player):
	$NameLabel.set_text(p_player.username)
	$PingLabel.set_text(str(p_player.peer_id))
	player = p_player

func get_player() -> OnlineLobby.Player:
	return player

func _on_challenge_pressed():
	emit_signal("challenge", player.session_id, challenging)

func _on_spectate_pressed():
	emit_signal("spectate", player.session_id, spectating)

func set_challenging(p_challenging: bool):
	challenging = p_challenging
	if (challenging):
		$Challenge.text = "Cancel"
	else:
		$Challenge.text = "Challenge"

func get_challenging():
	return challenging

func set_spectating(p_spectating: bool):
	spectating = p_spectating
	if (spectating):
		$Spectate.text = "Cancel"
	else:
		$Spectate.text = "Spectate"
		
func get_spectating():
	return spectating

#func has_focus() -> bool:
	#return $Challenge.has_focus() || $Spectate.has_focus()
