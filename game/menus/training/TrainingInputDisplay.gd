extends Node2D

@onready var A_on = preload("res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0000.png")
@onready var A_off = preload("res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0004.png")

@onready var B_on = preload("res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0001.png")
@onready var B_off = preload("res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0004.png")

@onready var C_on = preload("res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0002.png")
@onready var C_off = preload("res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0004.png")

@onready var D_on = preload("res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0003.png")
@onready var D_off = preload("res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0004.png")

@onready var Up_on = preload("res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0005.png")
@onready var Down_on = preload("res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0009.png")
@onready var Left_on = preload("res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0011.png")
@onready var Right_on = preload("res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0007.png")
@onready var UpRight_on = preload("res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0006.png")
@onready var DownRight_on = preload("res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0008.png")
@onready var UpLeft_on = preload("res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0012.png")
@onready var DownLeft_on = preload("res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0010.png")

@onready var logs = $CanvasLayer/InputLog

const fade_thresh = 0.5
const fade_thresh_low = 0.05
const fade_thresh_rate = 0.03

var input_log = []
var input_log_size = 18
var input_hold_frame = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	input_log = []
	var newLabel: Label
	var newSprite: TextureRect
	for i in range(input_log_size):
		var newText : String
		newText = ""
		newSprite = TextureRect.new()
#		newSprite.texture = A_off
		newSprite.name = str(i) + "Dir"
		logs.add_child(newSprite)
		
		newSprite = TextureRect.new()
#		newSprite.texture = A_off
		newSprite.name = str(i) + "AButton"
		logs.add_child(newSprite)
		newSprite = TextureRect.new()
#		newSprite.texture = A_off
		newSprite.name = str(i) + "BButton"
		logs.add_child(newSprite)
		newSprite = TextureRect.new()
#		newSprite.texture = A_off
		newSprite.name = str(i) + "CButton"
		logs.add_child(newSprite)
		newSprite = TextureRect.new()
#		newSprite.texture = A_off
		newSprite.name = str(i) + "DButton"
		logs.add_child(newSprite)
		
		
		newLabel = Label.new()
		newLabel.text = newText
		newLabel.name = str(i) + "Frame"
		newLabel.modulate.r = 0
		newLabel.modulate.g = 0
		newLabel.modulate.b = 0
		newLabel.custom_minimum_size.x = 20
		logs.add_child(newLabel)
		
		input_log.push_front(0)

func _physics_process(delta):
	if $CanvasLayer/right.modulate.a >= fade_thresh_low: 
		$CanvasLayer/right.modulate.a -= fade_thresh_rate
	if $CanvasLayer/left.modulate.a >= fade_thresh_low: 
		$CanvasLayer/left.modulate.a -= fade_thresh_rate
	if $CanvasLayer/up.modulate.a >= fade_thresh_low: 
		$CanvasLayer/up.modulate.a -= fade_thresh_rate
	if $CanvasLayer/down.modulate.a >= fade_thresh_low: 
		$CanvasLayer/down.modulate.a -= fade_thresh_rate
	input_hold_frame += 1

func update_input(input: int):
	input = remove_down_up(input)
	if (input_log[0] != input):
		input_log.push_front(input)
		if (input_log.size() > input_log_size):
			input_log.pop_back()
		update_input_log()
		input_hold_frame = 1
	logs.get_node(str(0) + "Dir").texture = display_direction(input_log[0])
	logs.get_node(str(0) + "AButton").texture = display_button(input_log[0], 0)
	logs.get_node(str(0) + "BButton").texture = display_button(input_log[0], 1)
	logs.get_node(str(0) + "CButton").texture = display_button(input_log[0], 2)
	logs.get_node(str(0) + "DButton").texture = display_button(input_log[0], 3)
	logs.get_node(str(0) + "Frame").text = str(input_hold_frame)
	
	if input & Enums.InputFlags.AHold == Enums.InputFlags.AHold:
		$CanvasLayer/A.texture = A_on
	else:
		$CanvasLayer/A.texture = A_off
	
	if input & Enums.InputFlags.BHold == Enums.InputFlags.BHold:
		$CanvasLayer/B.texture = B_on
	else:
		$CanvasLayer/B.texture = B_off
	
	if input & Enums.InputFlags.CHold == Enums.InputFlags.CHold:
		$CanvasLayer/C.texture = C_on
	else:
		$CanvasLayer/C.texture = C_off
	
	if input & Enums.InputFlags.DHold == Enums.InputFlags.DHold:
		$CanvasLayer/D.texture = D_on
	else:
		$CanvasLayer/D.texture = D_off
		
	if input & Enums.InputFlags.UP == Enums.InputFlags.UP:
		$CanvasLayer/up.modulate.a = 1.0
		$CanvasLayer/up.modulate.r = 1.0
		$CanvasLayer/up.modulate.b = 1.0
		$CanvasLayer/up.modulate.g = 1.0
	else:
		if $CanvasLayer/up.modulate.a >= fade_thresh: 
			$CanvasLayer/up.modulate.a = fade_thresh
			$CanvasLayer/up.modulate.r = .5
			$CanvasLayer/up.modulate.b = .5
			$CanvasLayer/up.modulate.g = .5
	
	if input & Enums.InputFlags.DOWN == Enums.InputFlags.DOWN:
		$CanvasLayer/down.modulate.a = 1.0
		$CanvasLayer/down.modulate.r = 1.0
		$CanvasLayer/down.modulate.b = 1.0
		$CanvasLayer/down.modulate.g = 1.0
	else:
		if $CanvasLayer/down.modulate.a >= fade_thresh: 
			$CanvasLayer/down.modulate.a = fade_thresh
			$CanvasLayer/down.modulate.r = .5
			$CanvasLayer/down.modulate.b = .5
			$CanvasLayer/down.modulate.g = .5
	
	if input & Enums.InputFlags.LEFT == Enums.InputFlags.LEFT:
		$CanvasLayer/left.modulate.a = 1.0
		$CanvasLayer/left.modulate.r = 1.0
		$CanvasLayer/left.modulate.b = 1.0
		$CanvasLayer/left.modulate.g = 1.0
	else:
		if $CanvasLayer/left.modulate.a >= fade_thresh: 
			$CanvasLayer/left.modulate.a = fade_thresh
			$CanvasLayer/left.modulate.r = .5
			$CanvasLayer/left.modulate.b = .5
			$CanvasLayer/left.modulate.g = .5
	
	if input & Enums.InputFlags.RIGHT == Enums.InputFlags.RIGHT:
		$CanvasLayer/right.modulate.a = 1.0
		$CanvasLayer/right.modulate.r = 1.0
		$CanvasLayer/right.modulate.b = 1.0
		$CanvasLayer/right.modulate.g = 1.0
	else:
		if $CanvasLayer/right.modulate.a >= fade_thresh: 
			$CanvasLayer/right.modulate.a = fade_thresh
			$CanvasLayer/right.modulate.r = .5
			$CanvasLayer/right.modulate.b = .5
			$CanvasLayer/right.modulate.g = .5

func remove_down_up(input):
	var new_input = input
	var map = 0
	map |= Enums.InputFlags.ADown
	map |= Enums.InputFlags.AUp
	map |= Enums.InputFlags.BDown
	map |= Enums.InputFlags.BUp
	map |= Enums.InputFlags.CDown
	map |= Enums.InputFlags.CUp
	map |= Enums.InputFlags.DDown
	map |= Enums.InputFlags.DUp
	map = ~map
	return new_input & map

func update_input_log():
	var logs = $CanvasLayer/InputLog
	for i in range(input_log_size-1, 0, -1):
		logs.get_node(str(i) + "Dir").texture = logs.get_node(str(i-1) + "Dir").texture
		logs.get_node(str(i) + "AButton").texture = logs.get_node(str(i-1) + "AButton").texture
		logs.get_node(str(i) + "BButton").texture = logs.get_node(str(i-1) + "BButton").texture
		logs.get_node(str(i) + "CButton").texture = logs.get_node(str(i-1) + "CButton").texture
		logs.get_node(str(i) + "DButton").texture = logs.get_node(str(i-1) + "DButton").texture
		logs.get_node(str(i) + "Frame").text = logs.get_node(str(i-1) + "Frame").text
	logs.get_node(str(0) + "Dir").texture = display_direction(input_log[0])
	logs.get_node(str(0) + "AButton").texture = display_button(input_log[0], 0)
	logs.get_node(str(0) + "BButton").texture = display_button(input_log[0], 1)
	logs.get_node(str(0) + "CButton").texture = display_button(input_log[0], 2)
	logs.get_node(str(0) + "DButton").texture = display_button(input_log[0], 3)
	logs.get_node(str(0) + "Frame").text = str(input_hold_frame)

func display_button(input, index):
	match index:
		0:
			if (input & Enums.InputFlags.AHold):
				return A_on
		1:
			if (input & Enums.InputFlags.BHold):
				return B_on
		2:
			if (input & Enums.InputFlags.CHold):
				return C_on
		3:
			if (input & Enums.InputFlags.DHold):
				return D_on
	return null

func display_direction(input):
	var output = null
	if (input & Enums.InputFlags.LEFT):
		if (input & Enums.InputFlags.UP):
			output = UpLeft_on
		elif (input & Enums.InputFlags.DOWN):
			output = DownLeft_on
		else:
			output = Left_on
	elif (input & Enums.InputFlags.RIGHT):
		if (input & Enums.InputFlags.UP):
			output = UpRight_on
		elif (input & Enums.InputFlags.DOWN):
			output = DownRight_on
		else:
			output = Right_on
	else:
		if (input & Enums.InputFlags.UP):
			output = Up_on
		elif (input & Enums.InputFlags.DOWN):
			output = Down_on
		else:
			output = null
	return output
