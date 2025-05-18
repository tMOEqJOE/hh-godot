extends "res://game/fighter/effects/VFX.gd"

func _network_spawn(data: Dictionary) -> void:
	super._network_spawn(data)
	self.rotation = randi() % 200

func _network_despawn() -> void:
	self.rotation = 0
	super._network_despawn()

func _on_NetworkTimer_timeout():
	SyncManager.despawn(self)
