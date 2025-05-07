extends Node2D

signal start_intro_sequence()
# Called when the node enters the scene tree for the first time.

var timer: int = 0

func _ready():
	$Ki.connect("start_fall", Callable(self, "start_intro"))
	timer = 206

func _physics_process(delta: float):
	if (timer > 0):
		timer -= 1
	elif (timer == 0):
		timer = -1
		self.z_index = -80
	else:
		pass


func start_intro():
	emit_signal("start_intro_sequence")
