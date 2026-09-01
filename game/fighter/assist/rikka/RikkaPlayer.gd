extends AssistPlayer

class_name RikkaPlayer

@onready var RikkaBall = preload("res://game/fighter/projectiles/hakka/HakkaTagsProjectile.tscn")

func tick() -> void:
	super.tick()

func summonHelper(entity: String, uninterrupted:bool=true) -> void:
	super.summonHelper(entity, uninterrupted)
	if (not entity.is_empty() and uninterrupted):
		if (entity == "rikkaball"):
			var g_position = get_global_fixed_position()
			var playerData = PlayerSetup.new(
					currentState[Enums.StKey.leftface],
					self.team,
					Enums.Projectiles.RikkaBall,
					self.color_scheme,
					self.input_interpreter
				)
			emit_signal("projectilespawn", 
				g_position.x,
				g_position.y, 
				RikkaBall,
				"RikkaBall",
				playerData)
