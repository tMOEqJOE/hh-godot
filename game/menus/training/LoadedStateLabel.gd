extends Label

var frame: int = 0

func _ready() -> void:
	hide_text()

func _physics_process(delta: float) -> void:
	if (frame > 0):
		frame -= 1
	elif (frame == 0):
		hide_text()

func show_text():
	frame = 20
	self.show()

func hide_text():
	self.hide()
