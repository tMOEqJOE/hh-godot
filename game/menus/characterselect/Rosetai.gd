extends Node2D

var timer: int = 0
@export var delay: int

func _ready():
	reset_timer()
	$AnimationPlayer.play("Idle")

func _physics_process(delta: float):
	if (delay <= 0):
		if (timer > 0):
			timer -= 1
			self.position.y = 150*cos(float(timer) / 20)
			self.position.x += self.scale.x*8
		else:
			reset_timer()
			self.scale.x *= -1
	else:
		delay -= 1

func reset_timer():
	timer = 600

