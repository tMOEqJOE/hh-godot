extends Sprite2D

var rotation_speed: float

func _ready():
	rotation_speed = .5

func _physics_process(delta):
	if (rotation_speed > .01):
		rotation_speed *= .95
	elif (rotation_speed < .01):
		rotation_speed = .01
	self.rotation += rotation_speed
