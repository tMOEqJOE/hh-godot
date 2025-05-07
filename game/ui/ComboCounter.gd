extends Label

@onready var anim = $NetworkAnimationPlayer

func _init():
	self.visible_characters = 0
	add_theme_color_override("font_color", Color("fcdf5b"))
#	invalid_hits = []

func _ready():
	anim.play("Resting")

func count_up(damage: int, hitCount: int, invalid: bool, block: bool, guard:int) -> void:
	self.visible_characters = 3
	self.text = str(hitCount)
	if (block):
		add_theme_color_override("font_color", Color("4ecaf1"))
#		print ("Block.")
	else:
		add_theme_color_override("font_color", Color("fcdf5b"))
#		print ("Valid")

	if (invalid and hitCount > 1):
		add_theme_color_override("font_color", Color("912309"))
		anim.stop(true)
		anim.play("Invalid")
#		invalid_hits += hitCount
	
func drop_combo() -> void:
	self.visible_characters = 0
	add_theme_color_override("font_color", Color("fcdf5b"))
	anim.play("Resting")
