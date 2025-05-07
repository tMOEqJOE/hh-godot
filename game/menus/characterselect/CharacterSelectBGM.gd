extends AudioStreamPlayer

func start_music():
	self.bus = "Music"
	play()

func stop_music():
	stop()
