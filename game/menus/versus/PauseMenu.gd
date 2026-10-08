extends Control

signal close_menu()
signal exit()
signal command_list()

func _ready():
	process_mode = PROCESS_MODE_ALWAYS

func _on_ExitButton_pressed():
	get_tree().paused = false
	emit_signal("exit")

func _on_CloseButton_pressed():
	get_tree().paused = false
	emit_signal("close_menu")

func _on_CommandListButton_pressed():
	emit_signal("command_list")
