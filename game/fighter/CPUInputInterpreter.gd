extends InputInterpreter

class_name CPUInputInterpreter

var player: PointPlayer
var bit_input: int = 0

var frame_cooldown: int = 0

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func clear_input():
	bit_input = 0
#	dump_ordered_input_history()

func read_input() -> Dictionary:
	var input := {}
	
	frame_cooldown += 1
	if (frame_cooldown == 1):
		bit_input = 0
		bit_input |= random_axis(0.3, 0.5)
		bit_input |= random_bit(Enums.InputFlags.AHold, 0.20)
		bit_input |= random_bit(Enums.InputFlags.BHold,0.20)
		bit_input |= random_bit(Enums.InputFlags.CHold, 0.10)
		bit_input |= random_bit(Enums.InputFlags.DHold, 0.08)
		frame_cooldown = 0
	
	input[Enums.PlayerInput.InputVector] = bit_input
	return input

func random_bit(bit, prob):
	if (rng.randf_range(0, 1.0) <= prob):
		return bit
	return 0

func random_axis(dead_horizontal, dead_vertical):
	var input_vector: Vector2 = Vector2(
			-rng.randf_range(0, 1.0) + rng.randf_range(0, 1.0), 
			-rng.randf_range(0, 1.0) + rng.randf_range(0, 1.0)
		)
	var bit_input = 0
	if (input_vector.x < -dead_horizontal):
		bit_input |= Enums.InputFlags.LEFT
	elif (input_vector.x > dead_horizontal):
		bit_input |= Enums.InputFlags.RIGHT

	if (input_vector.y < -dead_vertical):
		bit_input |= Enums.InputFlags.DOWN
	elif (input_vector.y > dead_vertical):
		bit_input |= Enums.InputFlags.UP
	return bit_input
