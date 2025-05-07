extends SGFixedNode2D

func _network_spawn(data: Dictionary) -> void:
	visible = true
	var spawn_global_position : SGFixedVector2 = SGFixedVector2.new()
	spawn_global_position.x = data['position_x']
	spawn_global_position.y = data['position_y']
	if (data['leftface']):
		self.fixed_scale.x = -1 * Util.fixed_abs(self.fixed_scale.x)
	set_global_fixed_position(spawn_global_position)
	$NetworkAnimationPlayer.seek(0.0, true)
	$NetworkAnimationPlayer.play("Hit")
	$NetworkTimer.start()

func _network_despawn() -> void:
	visible = false
	self.fixed_scale.x = Util.fixed_abs(self.fixed_scale.x)
	$NetworkTimer.stop()
	$NetworkAnimationPlayer.stop(true)

func _on_NetworkTimer_timeout():
	SyncManager.despawn(self)
