extends PointPlayer

class_name SubaruPlayer

# Fields

const SubaruStarBall = preload("res://game/fighter/projectiles/SubaruStarball.tscn")
const SubaruBatterSetBall = preload("res://game/fighter/projectiles/SubaruBatterSetBall.tscn")

func summonHelper(entity: String) -> void:
	super.summonHelper(entity)
	if (not entity.is_empty()):
		var leftface_mult = 1
		if (currentState[Enums.StKey.leftface]):
			leftface_mult = -1
		
		if (entity == "muteMusic"):
			MainMenuMusicControl.stop_music()
		elif (entity == "angelInstallMusic"):
			var is_comeback = false
			if (is_instance_valid(round_counter) and round_counter != null and 
					is_instance_valid(opponent_round_counter) and opponent_round_counter != null):
				if (round_counter.read_rounds_won() < opponent_round_counter.read_rounds_won()):
					is_comeback = true
			MainMenuMusicControl.play_angel_install_music(is_comeback)
		elif (entity == "subarustarball"):
			var g_position = get_global_fixed_position()
			var playerData = PlayerSetup.new(
					currentState[Enums.StKey.leftface],
					self.team,
					Enums.Projectiles.SubaruStarBall,
					self.color_scheme,
					self.input_interpreter
				)
			emit_signal("projectilespawn", 
				g_position.x - (SGFixed.ONE*100*leftface_mult), 
				g_position.y - (SGFixed.ONE*200), 
				SubaruStarBall,
				"SubaruStarBall",
				playerData)
		elif (entity == "subarubattersetball"):
			var g_position = get_global_fixed_position()
			var playerData = PlayerSetup.new(
					currentState[Enums.StKey.leftface],
					self.team,
					Enums.Projectiles.SubaruBatterSetBall,
					self.color_scheme,
					self.input_interpreter
				)
			emit_signal("projectilespawn", 
				g_position.x + (SGFixed.ONE*100*leftface_mult), 
				g_position.y - (SGFixed.ONE*200), 
				SubaruBatterSetBall,
				"SubaruBatterSetBall",
				playerData)
