extends Node2D

func _network_spawn(data: Dictionary) -> void:
	visible = true
	var spawn_global_position : Vector2 = Vector2()
	spawn_global_position.x = SGFixed.to_float(data['position_x'])
	spawn_global_position.y = SGFixed.to_float(data['position_y'])
	if (data['leftface']):
		self.scale.x = -1 * Util.fixed_abs(self.scale.x)
	self.global_position = spawn_global_position
	$NetworkAnimationPlayer.seek(0.0, true)
	$NetworkAnimationPlayer.play("Hit")
	$NetworkTimer.start()

func _network_despawn() -> void:
	visible = false
	self.scale.x = Util.fixed_abs(self.scale.x)
	$NetworkTimer.stop()
	$NetworkAnimationPlayer.stop(true)

func _on_NetworkTimer_timeout():
	SyncManager.despawn(self)
