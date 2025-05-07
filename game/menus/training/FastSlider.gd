extends HSlider

var hold_frame:int = 0

func _physics_process(_delta):
	if (self.has_focus()):
		if (Util.is_left_held_prefix("player1_") or Util.is_left_held_prefix("player2_")):
			if (hold_frame > 10):
				self.set_value(self.get_value() - self.step)
			else:
				hold_frame += 1
		elif (Util.is_right_held_prefix("player1_") or Util.is_right_held_prefix("player2_")):
			if (hold_frame > 10):
				self.set_value(self.get_value() + self.step)
			else:
				hold_frame += 1
		else:
			hold_frame = 0
