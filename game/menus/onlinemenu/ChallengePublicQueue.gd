extends "res://game/menus/onlinemenu/Challenge.gd"

class_name ChallengePublicQueue

signal timed_out_challenge()

# onlinematch variant for public queue, not pretty, but it'll avoid using the lobby version of challenge
var from_queue: OnlineMatch.Player: get = get_from_queue, set = set_from_queue # can be accessed publicly, add a set get?

func _ready() -> void:
	$Timer.start()

func _physics_process(_delta):
	$CanvasLayer/GridContainer/ChallengeTimer.text = "Time: " + str(int($Timer.time_left+1))

func update_ping(new_ping: int, msg):
	var system_time = Time.get_ticks_msec()
	ping = system_time - msg['local_time']
	$CanvasLayer/GridContainer/PingLabel.set_text("Ping: " + str(ping/2) + "ms")

func set_from_queue(p_from: OnlineMatch.Player):
	from_queue = p_from
	update_ui(from_queue.username)

func get_from_queue() -> OnlineMatch.Player:
	return from_queue

func get_session_id() -> String:
	return from_queue.session_id

func update_ui(name: String):
	$CanvasLayer/GridContainer/ChallengerName.set_text(from_queue.username)

func _on_accept_challenge_pressed():
	SyncManager.set_input_delay(int($CanvasLayer/GridContainer/InputDelayMeter.value))
	emit_signal("accept_result", true, from_queue.session_id)
	$Timer.stop()
	call_deferred("disable_challenge")

func _on_decline_challenge_pressed():
	SyncManager.set_input_delay(2)
	emit_signal("accept_result", false, from_queue.session_id)
	$Timer.stop()
	call_deferred("disable_challenge")

func _on_InputDelayMeter_value_changed(value):
	$CanvasLayer/GridContainer/InputDelayLabel.set_text("Input Delay: " + str(int(value)))
	SyncManager.set_input_delay(int($CanvasLayer/GridContainer/InputDelayMeter.value))

func _on_Timer_timeout():
	emit_signal("timed_out_challenge")

func disable_challenge():
	$CanvasLayer/GridContainer/Accept.disabled = true
	$CanvasLayer/GridContainer/Decline.disabled = true
	$CanvasLayer/GridContainer/InputDelayMeter.editable = false
	$CanvasLayer/GridContainer/InputDelayMeter.scrollable = false
	
