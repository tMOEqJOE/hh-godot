extends Node2D

@onready var FullBar : TextureProgressBar = $FullBar # Actual meter remaining
@onready var NegativeZone : TextureProgressBar = $NegativeZone # Exhaustion zone

var SOLID = preload("res://game/assets/sprites/UI/Meters/Assist/AssistBarSolid.png")
var BASE = preload("res://game/assets/sprites/UI/Meters/Assist/AssistBar.png")

var maxMeter : int = Util.MAX_ASSIST_METER
var meterSegment : int = Util.ASSIST_STOCK
var frame : int = 0

func _ready():
	FullBar.max_value = maxMeter
	NegativeZone.max_value = maxMeter
	reset_meter()

func reset_meter() -> void:
	FullBar.value = Util.ASSIST_STOCK*2
	updateUI(Util.ASSIST_STOCK*2)

func set_frame(new_frame: int):
	frame = new_frame

func updateUI(currentMeter: int) -> void:
	NegativeZone.value = meterSegment
	if (currentMeter >= maxMeter):
		FullBar.tint_progress = Color("ffe852")
		FullBar.tint_under = Color("000000")
		NegativeZone.tint_progress = Color("6d623b")
		FullBar.texture_under = BASE
		FullBar.texture_progress = SOLID
	elif (currentMeter >= meterSegment*3):
		FullBar.tint_progress = Color("d92de7")
		FullBar.tint_under = Color("000000")
		NegativeZone.tint_progress = Color("522e3b")
		FullBar.texture_under = BASE
		FullBar.texture_progress = SOLID
	elif (currentMeter >= meterSegment*2):
		FullBar.tint_progress = Color("ff6186")
		FullBar.tint_under = Color("000000")
		NegativeZone.tint_progress = Color("502e52")
		FullBar.texture_under = BASE
		FullBar.texture_progress = SOLID
	elif (currentMeter >= meterSegment):
		FullBar.tint_progress = Color("c1bcc1")
		FullBar.tint_under = Color("000000")
		NegativeZone.tint_progress = Color("4f4f4f")
		FullBar.texture_under = BASE
		FullBar.texture_progress = SOLID
	else:
		FullBar.tint_progress = Color("8c95f7")
		FullBar.tint_under = danger_flash()
		FullBar.texture_under = BASE
		FullBar.texture_progress = SOLID
		NegativeZone.value = 0
	FullBar.value = currentMeter

func danger_flash() -> Color:
	var base_color = Color("9e1414")
	base_color.r += 0.2*sin(frame / 3.0)
#	base_color.g += 0.1*sin(frame / 3.0)
	return base_color
