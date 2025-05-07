extends Sprite2D

var time: int = 0

func _physics_process(delta):
	time += 1
	self.modulate.a = 0.5 + 0.5*cos(.005*time)
