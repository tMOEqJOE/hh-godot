extends "res://game/fighter/effects/VFX.gd"

func _network_spawn(data: Dictionary) -> void:
	super._network_spawn(data)
	self.fixed_rotation = randi() % 65536*200

func _network_despawn() -> void:
	super._network_despawn()
	self.fixed_rotation = 0
