extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var accel: int = 18
var speed: float = 0

@export var ticks: int
var timer: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = ticks

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (timer > 0):
		timer -= 1
	else:
		speed += accel
		if (accel > 0.001):
			accel *= 0.92
		else:
			accel = 0
			speed = 0
		$Right.position.x -= speed
		$Left.position.x += speed
