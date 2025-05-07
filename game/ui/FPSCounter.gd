extends Label

var frame = 0
var frame_update = 10

func _physics_process(_delta):
	frame += 1
	if (frame == frame_update):
		frame = 0
		self.set_text(str(Engine.get_frames_per_second()) + "fps")
