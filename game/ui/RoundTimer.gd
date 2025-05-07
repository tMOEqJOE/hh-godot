extends Label

const TOTAL_TIME:int = 6000 # 6000
const VISUAL_TOTAL_TIME:int = 100

var currentTime:int
var stopped: bool

enum State {
	time,
	stopped,
}

signal round_timeout ()

func _init():
	self.visible_characters = 4
	stopped = true
	currentTime = TOTAL_TIME
	display_time()
	add_to_group("network_sync")

func reset_to_game_start():
	stopped = true
	currentTime = TOTAL_TIME
	display_time()

func _save_state() -> Dictionary:
	var state = {
		State.time : currentTime,
		State.stopped : stopped,
	}
	return state

func _load_state(state: Dictionary) -> void:
	currentTime = state.get(State.time)
	stopped = state.get(State.stopped)

func reset_time():
	currentTime = TOTAL_TIME
	start_time()
	display_time()

func start_time():
	stopped = false

func stop_time():
	stopped = true

func get_time() -> int:
	return currentTime

func tick():
	if (not stopped):
		currentTime -= 1
		if (currentTime == 0):
			timeout()
	display_time()

func timeout() -> void:
	emit_signal("round_timeout")
	stopped = true

func display_time():
	self.text = str(VISUAL_TOTAL_TIME * (currentTime / float(TOTAL_TIME)))
