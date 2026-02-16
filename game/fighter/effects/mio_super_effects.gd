extends "res://game/fighter/effects/VFX.gd"

func _network_spawn(data: Dictionary) -> void:
	super._network_spawn(data)
	if (data.has("color_palette")):
		var palette = data["color_palette"]
		assert(palette != null)
		if (palette != null):
			$Sprite2D.material.set_shader_parameter("palette", palette)
		
