extends Sprite2D

@export var xOffset: int
@export var speed: int

var ticks: int = 10
var tick: int = 0

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if (tick > 0):
		self.position.x += speed
		tick -= 1

func change_portrait_anim():
	self.position.x = xOffset - (ticks * speed)
	tick = ticks

func change_color(color):
	self.material.set_shader_parameter("palette", color)

func change_portrait(enumChara: int, color, is_assist=false):
	match enumChara:
		Enums.AssistCharacters.Subaru:
			color = "res://game/assets/sprites/subaru/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SubaruPortrait.png"
		Enums.AssistCharacters.Mio:
			color = "res://game/assets/sprites/mio/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/MioPortrait.png"
		Enums.AssistCharacters.Oga:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/OgaPortrait.png"
		Enums.AssistCharacters.Ollie:
			color = "res://game/assets/sprites/ollie/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/OlliePortrait.png"
		Enums.AssistCharacters.Suisei:
			color = "res://game/assets/sprites/assists/fubuki/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/FubukiPortrait.png"
		Enums.AssistCharacters.Kanata:
			color = "res://game/assets/sprites/assists/fubuki/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/FubukiPortrait.png"
		Enums.AssistCharacters.Seven:
			color = "res://game/assets/sprites/assists/fubuki/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/FubukiPortrait.png"
		Enums.AssistCharacters.Eight:
			color = "res://game/assets/sprites/assists/fubuki/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/FubukiPortrait.png"
		Enums.AssistCharacters.Nine:
			color = "res://game/assets/sprites/assists/fubuki/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/FubukiPortrait.png"
		Enums.AssistCharacters.Ten:
			color = "res://game/assets/sprites/assists/fubuki/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/FubukiPortrait.png"
		Enums.AssistCharacters.Eleven:
			color = "res://game/assets/sprites/assists/fubuki/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/FubukiPortrait.png"
		Enums.AssistCharacters.Twelve:
			color = "res://game/assets/sprites/assists/fubuki/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/FubukiPortrait.png"
		Enums.AssistCharacters.Fubuki:
			color = "res://game/assets/sprites/assists/fubuki/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/FubukiPortrait.png"
		Enums.AssistCharacters.Sora:
			color = "res://game/assets/sprites/assists/sora/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SoraPortrait.png"
		Enums.AssistCharacters.OkaKoro:
			color = "res://game/assets/sprites/assists/okakoro/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/OkakoroPortrait.png"
		Enums.AssistCharacters.Hakka:
			color = "res://game/assets/sprites/hakka/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/HakkaPortrait.png"
		Enums.AssistCharacters.Sana:
			color = "res://game/assets/sprites/sana/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SanaPortrait.png"
		Enums.AssistCharacters.Random:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/KimiNoHiroin/QuestionMark.png"
		_:
			color = "res://game/assets/sprites/assists/fubuki/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/FubukiPortrait.png"
