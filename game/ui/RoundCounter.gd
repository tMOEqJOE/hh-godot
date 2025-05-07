extends Node2D

var fullround = preload("res://game/assets/sprites/UI/RoundCounterFull.png")
var emptyround = preload("res://game/assets/sprites/UI/RoundCounterEmpty.png")

var roundsWon: int
@export var is_p1: bool

enum State {
	rounds,
}

signal win ()

func _ready():
	add_to_group("network_sync")
	roundsWon = 0
	updateUI()

func _save_state() -> Dictionary:
	var state : Dictionary = {
		State.rounds : roundsWon,
	}
	return state

func _load_state(state: Dictionary) -> void:
	var old_rounds_won = roundsWon
	roundsWon = state[State.rounds]
	if (old_rounds_won != roundsWon):
		updateUI()

func _network_process(input: Dictionary) -> void:
	pass

func register_ko() -> void:
	roundsWon += 1
	updateUI()
	if (roundsWon >= 2):
		emit_signal("win")
		if (is_p1):
			Global.P1_WON_MATCH = true
		else:
			Global.P1_WON_MATCH = false

func reset_to_game_start() -> void:
	roundsWon = 0
	updateUI()

func read_rounds_won() -> int:
	return roundsWon

func updateUI() -> void:
	match roundsWon:
		0:
			$Count0.texture = emptyround
			$Count1.texture = emptyround
		1:
			$Count0.texture = fullround
			$Count1.texture = emptyround
		2:
			$Count0.texture = fullround
			$Count1.texture = fullround
		_:
			print("Invalid round count")
