extends Sprite2D

func _physics_process(delta: float) -> void:
	if (get_parent().global_position.y <= -20000):
		# Workaround, if offscreen above the ceiling, don't render shadow
		self.global_position.y = Util.SHADOW_POSITION_Y - 20000
	else:
		self.global_position.y = Util.SHADOW_POSITION_Y
