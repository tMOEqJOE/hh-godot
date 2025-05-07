extends Camera2D

var player1: Node2D
var player2: Node2D

@export var xBoundMax: float
@export var yBoundMax: float
@export var xBoundMin: float
@export var yBoundMin: float

@export var smooth_x_speed: float = 15
@export var smooth_y_speed: float = 45

var yCameraOffset1: float = 0
var yCameraOffset2: float = 0

var initialized: bool = false

func _ready():
	initialized = false
	#if "replay" in OS.get_cmdline_args():
		#replay_mode = true
	#else:
		#replay_mode = false

func set_players(node1:Node2D, node2:Node2D):
	player1 = node1
	player2 = node2
	yCameraOffset1 = SGFixed.to_float(player1.yCameraOffset)
	yCameraOffset2 = SGFixed.to_float(player2.yCameraOffset)
	initialized = true

func _physics_process(delta):
	if initialized:
		var gpos1: Vector2 = player1.global_position
		var gpos2: Vector2 = player2.global_position
		var pos_x:float = (gpos1.x+gpos2.x) * 0.5
		var pos_y:float = gpos1.y + yCameraOffset1
		if (gpos2.y + yCameraOffset2 < pos_y):
			pos_y = gpos2.y + yCameraOffset2
		var new_pos:Vector2 = camera_clamp(pos_x, pos_y)
		camera_smooth(new_pos, delta)

func camera_smooth(new_pos: Vector2, delta: float):
#	motion.x = lerp(motion.x, 0, 0.2)
	self.position.x = lerp(self.position.x, new_pos.x, delta * smooth_x_speed)
	self.position.y = lerp(self.position.y, new_pos.y, delta * smooth_y_speed)
#	.position.lerp(mouse_pos, delta * FOLLOW_SPEED)

func reset_to_game_start():
	self.position.x = 0
	self.position.y = 0
	initialized = false

func camera_clamp(pos_x: float, pos_y: float) -> Vector2:
	if (pos_x < xBoundMin):
		pos_x = xBoundMin
	elif (pos_x > xBoundMax):
		pos_x = xBoundMax
	if (pos_y < yBoundMin):
		pos_y = yBoundMin
	elif (pos_y > yBoundMax):
		pos_y = yBoundMax
	return Vector2(pos_x, pos_y)
