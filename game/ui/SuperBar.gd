extends Node2D

@onready var FullBar : TextureProgressBar = $FullBar # Actual meter remaining

var LVL_0 = load("res://game/assets/sprites/UI/Meters/Level/Timeline 1_0000.png")
var LVL_1 = load("res://game/assets/sprites/UI/Meters/Level/Timeline 1_0001.png")
var LVL_2 = load("res://game/assets/sprites/UI/Meters/Level/Timeline 1_0002.png")
var LVL_3 = load("res://game/assets/sprites/UI/Meters/Level/Timeline 1_0003.png")
var LVL_4 = load("res://game/assets/sprites/UI/Meters/Level/Timeline 1_0004.png")
var LVL_5 = load("res://game/assets/sprites/UI/Meters/Level/Timeline 1_0005.png")

var BURST_OK = load("res://game/assets/sprites/VFX/BurstOK/Timeline 1_0001.png")
var BURST_NOT_OK = load("res://game/assets/sprites/VFX/BurstOK/Timeline 1_0003.png")

var BURST_COST_X = load("res://game/assets/sprites/VFX/BurstCost/Timeline 1_0005.png")
var BURST_COST_1 = load("res://game/assets/sprites/VFX/BurstCost/Timeline 1_0000.png")
var BURST_COST_2 = load("res://game/assets/sprites/VFX/BurstCost/Timeline 1_0001.png")
var BURST_COST_3 = load("res://game/assets/sprites/VFX/BurstCost/Timeline 1_0002.png")
var BURST_COST_4 = load("res://game/assets/sprites/VFX/BurstCost/Timeline 1_0003.png")
var BURST_COST_5 = load("res://game/assets/sprites/VFX/BurstCost/Timeline 1_0004.png")

var maxMeter : int = Util.MAX_SUPER_METER
var meterSegment : int = Util.LEVEL_ONE_SUPER

var frame : int = 0

@export var p1_side : bool

func _ready():
	FullBar.max_value = meterSegment
	reset_meter()
	if (not p1_side):
		$LevelNumber.scale.x *= -1
		$BurstCost.scale.x *= -1
		$BurstOK.scale.x *= -1

func set_frame(new_frame: int):
	frame = new_frame

func reset_meter() -> void:
	FullBar.value = Util.LEVEL_ONE_SUPER
	updateUI(Util.LEVEL_ONE_SUPER, true, 1)

func updateUI(currentMeter: int, burstOK: bool, burstCost: int) -> void:
	if (currentMeter >= maxMeter):
		FullBar.tint_progress = max_flash()
		FullBar.value = meterSegment
		$LevelNumber.texture = LVL_5
	elif (currentMeter >= meterSegment*4):
		FullBar.tint_progress = Color("8e74fb")
		FullBar.tint_under = Color("5b0d28")
		FullBar.value = currentMeter % meterSegment
		$LevelNumber.texture = LVL_4
	elif (currentMeter >= meterSegment*3):
		FullBar.tint_progress = Color("fc4c4c")
		FullBar.tint_under = Color("3c4f29")
		FullBar.value = currentMeter % meterSegment
		$LevelNumber.texture = LVL_3
	elif (currentMeter >= meterSegment*2):
		FullBar.tint_progress = Color("7bdb4a")
		FullBar.tint_under = Color("156961")
		FullBar.value = currentMeter % meterSegment
		$LevelNumber.texture = LVL_2
	elif (currentMeter >= meterSegment):
		FullBar.tint_progress = Color("0aa1be")
		FullBar.tint_under = Color("615966")
		FullBar.value = currentMeter % meterSegment
		$LevelNumber.texture = LVL_1
	else:
		FullBar.tint_progress = Color("624baa")
		FullBar.tint_under = Color("000000")
		FullBar.value = currentMeter % meterSegment
		$LevelNumber.texture = LVL_0
	
	if (burstOK):
		$BurstOK.texture = BURST_OK
	else:
		$BurstOK.texture = BURST_NOT_OK
	
	match burstCost:
		1:
			$BurstCost.texture = BURST_COST_1
		2:
			$BurstCost.texture = BURST_COST_2
		3:
			$BurstCost.texture = BURST_COST_3
		4:
			$BurstCost.texture = BURST_COST_4
		5:
			$BurstCost.texture = BURST_COST_5
		_:
			$BurstCost.texture = BURST_COST_X

func max_flash() -> Color:
	var base_color = Color("ffdf76")
	base_color.s += 0.3*sin(frame / 5)
	return base_color
