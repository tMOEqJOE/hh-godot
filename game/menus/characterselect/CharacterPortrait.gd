extends Sprite2D

@export var xOffset: int
@export var speed: int

var ticks: int = 10
var tick: int = 0

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if (tick > 0):
		self.position.x += speed
		tick -= 1

func change_portrait_anim():
	self.position.x = xOffset - (ticks * speed)
	tick = ticks
