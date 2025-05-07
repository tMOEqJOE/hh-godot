# state_factory.gd
extends Node

class_name InputSource

enum State {
	inputHistory,
	zeroIndex,
	countdown,
}

var inputHistory: Array = [] # stores an input every frame, always start with extra 0
var zeroIndex: int = 0 # note: this goes backwards
var countdown: int = 60

const HISTORY_SIZE: int = 60
# Apparently input buffer size is 3F in Xrd, 0F in +R

func _init():
	add_to_group("network_sync")
	for i in range(HISTORY_SIZE):
		inputHistory.push_back(0)

func _save_state() -> Dictionary:
	var state : Dictionary = {
		State.inputHistory : inputHistory.duplicate(true),
		State.zeroIndex : zeroIndex,
		State.countdown : countdown,
	}
	return state

func _load_state(state: Dictionary) -> void:
	inputHistory = state[State.inputHistory].duplicate(true)
	zeroIndex = state[State.zeroIndex]
	countdown = state[State.countdown]

func clear_inputs() -> void:
	inputHistory = []
	for i in range(HISTORY_SIZE):
		inputHistory.push_back(0)

func get_input(index:int) -> int:
	#'''index: 0 is the most recent item in history, 59 is very old'''
	if (index >= inputHistory.size() || index < 0):
		printerr("InputSource: index out of bounds!")
		return 0
	return inputHistory[(zeroIndex + index) % inputHistory.size()]

func update_input(input: Dictionary) -> void:
	if (countdown <= 0):
		var new_input : int = input.get(Enums.PlayerInput.InputVector, 0)
		var prev_input : int = get_input(0) # note this takes the item at the end
		
		if ((new_input & Enums.InputFlags.AHold) ^
				(prev_input & Enums.InputFlags.AHold)):
			if (new_input & Enums.InputFlags.AHold):
				new_input |= Enums.InputFlags.ADown
			else:
				new_input |= Enums.InputFlags.AUp
				
		if ((new_input & Enums.InputFlags.BHold) ^
				(prev_input & Enums.InputFlags.BHold)):
			if (new_input & Enums.InputFlags.BHold):
				new_input |= Enums.InputFlags.BDown
			else:
				new_input |= Enums.InputFlags.BUp
		
		if ((new_input & Enums.InputFlags.CHold) ^
				(prev_input & Enums.InputFlags.CHold)):
			if (new_input & Enums.InputFlags.CHold):
				new_input |= Enums.InputFlags.CDown
			else:
				new_input |= Enums.InputFlags.CUp
		
		if ((new_input & Enums.InputFlags.DHold) ^
				(prev_input & Enums.InputFlags.DHold)):
			if (new_input & Enums.InputFlags.DHold):
				new_input |= Enums.InputFlags.DDown
			else:
				new_input |= Enums.InputFlags.DUp
		
		zeroIndex -= 1
		if (zeroIndex < 0):
			zeroIndex = inputHistory.size() - 1
		inputHistory[zeroIndex] = new_input
	else:
		countdown -= 1

func dump_input() -> String:
	return str(inputHistory)

func dump_ordered_input() -> String:
	var currentZeroIndex = zeroIndex
	var result = "["
	for i in range(0, HISTORY_SIZE - 1):
		result += str(inputHistory[(currentZeroIndex + i) % HISTORY_SIZE]) +","
	result += "]"
	return result

func dump_ordered_input_short() -> String:
	var currentZeroIndex = zeroIndex
	var result = "["
	for i in range(0, 15):
		result += str(inputHistory[(currentZeroIndex + i) % HISTORY_SIZE]) +","
	result += "]"
	return result
