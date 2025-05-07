extends Node2D

var accel_y: float = .400
var vel_y: float = 0

@export var image: Texture2D
@export var ticks: int

var timer: int = 0

signal start_fall()

# Called when the node enters the scene tree for the first time.
func _ready():
	self.position.y += -220
	$Sprite2D.texture = image
	timer = ticks
	vel_y = -0

func _physics_process(delta: float):
	if (timer > 0):
		timer -= 1
	elif (timer == 0):
		timer = -1
		emit_signal("start_fall")
	else:
		vel_y += accel_y
		if (self.position.y > 0 and vel_y > 0):
			vel_y *= -0.3
			if (vel_y >= -accel_y - 0.001):
				vel_y = 0
				accel_y = 0
		self.position.y += vel_y
