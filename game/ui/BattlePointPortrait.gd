extends Sprite2D

@onready var character_sprite = $Sprite2D

func load_portrait(enum_point_chara, point_color, enum_assist_chara, assist_color) -> void:
	var portrait = ""
	character_sprite.material.set_shader_parameter("palette", point_color)
	match enum_point_chara:
		Enums.PointCharacters.Subaru:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/SubaruButton.png"
		Enums.PointCharacters.Mio:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/MioButton.png"
		Enums.PointCharacters.Oga:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/OgaButton.png"
		Enums.PointCharacters.Ollie:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/OllieButton.png"
		Enums.PointCharacters.Kanata:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/KanataButton.png"
		Enums.PointCharacters.Suisei:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/SuiseiButton.png"
		_:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/SubaruButton.png"
	character_sprite.texture = load(portrait)
	
	$AssistBattlePortrait/Sprite2D.material.set_shader_parameter("palette", assist_color)
	match enum_assist_chara:
		Enums.AssistCharacters.Fubuki:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/FubukiButton.png"
		Enums.AssistCharacters.Sora:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/SoraButton.png"
		Enums.AssistCharacters.Sana:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/SanaButton.png"
		Enums.AssistCharacters.OkaKoro:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/OkaKoroButton.png"
		Enums.AssistCharacters.Hakka:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/HakkaButton.png"
		Enums.AssistCharacters.Subaru:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/SubaruButton.png"
		Enums.AssistCharacters.Mio:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/MioButton.png"
		Enums.AssistCharacters.Oga:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/OgaButton.png"
		Enums.AssistCharacters.Ollie:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/OllieButton.png"
		Enums.AssistCharacters.Kanata:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/KanataButton.png"
		Enums.AssistCharacters.Suisei:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/SuiseiButton.png"
		_:
			portrait = "res://game/assets/sprites/UI/CharacterSelect/MiniPortraits/FubukiButton.png"
	$AssistBattlePortrait/Sprite2D.texture = load(portrait)
