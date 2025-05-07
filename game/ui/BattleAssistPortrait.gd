extends Sprite2D

@onready var character_sprite = $Sprite2D

func load_portrait(enum_chara, color) -> void:
	var portrait = ""
	character_sprite.material.set_shader_parameter("palette", color)
	match enum_chara:
		Enums.PointCharacters.Subaru:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/SubaruButton.png"
		Enums.PointCharacters.Mio:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/MioButton.png"
		Enums.PointCharacters.Oga:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/OgaButton.png"
		_:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/SubaruButton.png"
	character_sprite.texture = load(portrait)
