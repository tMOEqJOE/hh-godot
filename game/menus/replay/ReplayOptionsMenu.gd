extends GridContainer

@onready var BUTTON_MAP_MENU = preload("res://game/menus/buttonmap/ButtonMapMenuScreen.tscn")
var button_menu

signal close_menu()
signal exit()
signal reset()
signal loadstate()

var menu_close_delay: int
var most_recent_focus:Control

#func _on_focus_changed(control:Control) -> void:
	#if control is PopupMenu:
		#return
	#if control != null:
		#most_recent_focus = control

func _ready():
	get_viewport().connect("gui_focus_changed", Callable(self, "_on_focus_changed"))
	most_recent_focus = $CloseButton
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	$TakeoverButton.add_item("None", 0)
	$TakeoverButton.add_item("Player 1", 1)
	$TakeoverButton.add_item("Player 2", 2)
	
func _physics_process(delta):
	if menu_close_delay > 0:
		menu_close_delay -= 1
		if (menu_close_delay == 0):
			close_training_options_menu()

func open_training_options_menu():
	if (not is_enabled()):
		self.visible = true
		if (most_recent_focus != null):
			most_recent_focus.grab_focus()
		else:
			$CloseButton.grab_focus()
	
func set_close_delay():
	if (is_enabled()):
		menu_close_delay = 2
	
func close_training_options_menu():
	if (is_enabled()):
		self.visible = false
		emit_signal("close_menu")

func get_takeover_player() -> int:
	return $TakeoverButton.selected

func is_enabled() -> bool:
	return self.visible

func _on_ExitButton_pressed():
	get_tree().paused = false
#	emit_signal("exit")
	call_deferred("emit_signal", "exit")

func _on_ResetButton_pressed():
	get_tree().paused = false
	emit_signal("reset")

func _on_LoadStateButton_pressed():
	emit_signal("loadstate")

func _on_CloseButton_pressed():
	get_tree().paused = false
	set_close_delay()

func _input(event):
	input_helper(event)

func input_helper(event):
	if process_mode != Node.PROCESS_MODE_PAUSABLE and is_enabled():
		if event.is_action_pressed("player1_start") or event.is_action_pressed("player2_start"):
			_on_CloseButton_pressed()
		elif event.is_action_pressed("player1_cancel") or event.is_action_pressed("player2_cancel"):
			_on_CloseButton_pressed()

func _on_ChangeControlsButton_pressed():
	button_menu = BUTTON_MAP_MENU.instantiate()
	add_child(button_menu)
	button_menu.connect("complete", Callable(self, "button_set_complete"))
	button_menu.scale.x /= self.scale.x
	button_menu.scale.y /= self.scale.y
	button_menu.remove_player(false)
	process_mode = Node.PROCESS_MODE_PAUSABLE

func button_set_complete():
	process_mode = Node.PROCESS_MODE_ALWAYS
	button_menu.disconnect("complete", Callable(self, "button_set_complete"))
	remove_child(button_menu)
	button_menu.queue_free()
	button_menu = null
