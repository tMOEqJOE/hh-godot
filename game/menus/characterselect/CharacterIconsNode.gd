extends Node2D

var timer: int = 0

func _ready():
	timer = 206

func _physics_process(delta: float):
	if (timer > 0):
		timer -= 1
	elif (timer == 0):
		timer = -1
		self.z_index = -100
	else:
		pass
