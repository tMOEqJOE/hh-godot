extends SGFixedNode2D

@export var xBoundMax: int
@export var yBoundMax: int
@export var xBoundMin: int
@export var yBoundMin: int

var player1: SGFixedNode2D
var player2: SGFixedNode2D

var yCameraOffset1: int = -11993088
var yCameraOffset2: int = -11993088

@onready var WallLeft :SGFixedNode2D = $MovingWalls/WallLeft
@onready var WallRight :SGFixedNode2D = $MovingWalls/WallRight
@onready var AssistWallLeft :SGFixedNode2D = $MovingWalls/AssistWallLeft
@onready var AssistWallRight :SGFixedNode2D = $MovingWalls/AssistWallRight

enum State {
	x,
	y,
}

func _init():
	add_to_group("network_sync")

func _save_state() -> Dictionary:
	var gpos: SGFixedVector2 = self.get_global_fixed_position()
	var state = {
		State.x : gpos.x,
		State.y : gpos.y,
	}
	return state

func _load_state(state: Dictionary) -> void:
	var load_gpos: SGFixedVector2 = SGFixedVector2.new()
	load_gpos.x = state[State.x]
	load_gpos.y = state[State.y]
	self.set_global_fixed_position(load_gpos)
	camera_sync_to_physics_engine()

func camera_sync_to_physics_engine() -> void:
	WallLeft.sync_to_physics_engine()
	WallRight.sync_to_physics_engine()
	AssistWallLeft.sync_to_physics_engine()
	AssistWallRight.sync_to_physics_engine()

func set_players(node1:SGFixedNode2D, node2:SGFixedNode2D):
	player1 = node1
	player2 = node2
	yCameraOffset1 = player1.yCameraOffset
	yCameraOffset2 = player2.yCameraOffset

func tick():
	var gpos1: SGFixedVector2 = player1.get_global_fixed_position()
	var gpos2: SGFixedVector2 = player2.get_global_fixed_position()
	var pos_x:int = SGFixed.mul(gpos1.x+gpos2.x, SGFixed.HALF)
#	var pos_y:int = gpos1.y + yCameraOffset1
#	if (gpos2.y + yCameraOffset2 < pos_y):
#		pos_y = gpos2.y + yCameraOffset2
	var new_pos:SGFixedVector2 = camera_clamp(pos_x)
	self.set_global_fixed_position(new_pos)
	camera_sync_to_physics_engine()

func camera_clamp(pos_x: int) -> SGFixedVector2:
	if (pos_x < xBoundMin):
		pos_x = xBoundMin
	elif (pos_x > xBoundMax):
		pos_x = xBoundMax
	return SGFixed.vector2(pos_x, 0)

func assist_force_in_bounds(x: int) -> int:
	if (x < AssistWallLeft.get_global_fixed_position().x):
		x = AssistWallLeft.get_global_fixed_position().x + AssistWallLeft.fixed_scale.x + 66536
	elif (x > AssistWallRight.get_global_fixed_position().x):
		x = AssistWallRight.get_global_fixed_position().x - AssistWallRight.fixed_scale.x - 66536
	return x
