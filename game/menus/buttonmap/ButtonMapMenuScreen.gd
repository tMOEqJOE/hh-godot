extends Node2D

signal complete()

@onready var BUTTON_MAP_MENU = preload("res://game/menus/buttonmap/ButtonMapMenu.tscn")
@onready var KEY_BUTTON_MAP_MENU = preload("res://game/menus/buttonmap/KeyboardButtonMapMenu.tscn")

var ButtonMap1: Node2D
var ButtonMap2: Node2D

var p1_ready: bool = false
var p2_ready: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	process_mode = PROCESS_MODE_ALWAYS
	p1_ready = false
	p2_ready = false
	
	if (Global.p1_is_gamepad):
		ButtonMap1 = BUTTON_MAP_MENU.instantiate()
	else:
		ButtonMap1 = KEY_BUTTON_MAP_MENU.instantiate()
	
	if (Global.p2_is_gamepad):
		ButtonMap2 = BUTTON_MAP_MENU.instantiate()
	else:
		ButtonMap2 = KEY_BUTTON_MAP_MENU.instantiate()
	
	add_child(ButtonMap1)
	add_child(ButtonMap2)
	
	ButtonMap1.position.x = 43
	ButtonMap1.position.y = 92
	
	ButtonMap2.position.x = 1243
	ButtonMap2.position.y = 92
	
	
	ButtonMap1.set_is_p1(true)
	ButtonMap2.set_is_p1(false)
	ButtonMap1.connect("button_set_complete", Callable(self, "button_set_complete"))
	ButtonMap2.connect("button_set_complete", Callable(self, "button_set_complete"))

func remove_player(is_p1: bool):
	if (is_p1 and not p1_ready):
		ButtonMap1.free_button_menu()
		ButtonMap1 = null
		p1_ready = true
	elif (not is_p1 and not p2_ready):
		ButtonMap2.free_button_menu()
		ButtonMap2 = null
		p2_ready = true

func button_set_complete(is_p1:bool):
	if (is_p1):
		p1_ready = true
	else:
		p2_ready = true
	if p1_ready and p2_ready:
		exit()

func exit():
	emit_signal("complete")

func free_button_map():
	if (ButtonMap1 != null):
		ButtonMap1.queue_free()
		ButtonMap1 = null
	if (ButtonMap2 != null):
		ButtonMap2.queue_free()
		ButtonMap2 = null
	super.queue_free()

func _input(event):
	if event.is_action_pressed("player1_start") or event.is_action_pressed("player2_start"):
		exit()
