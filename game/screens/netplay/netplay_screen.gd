extends Node2D

@onready var ui_layer = $UILayer

func _ready() -> void:
	ui_layer.show_screen("MenuScreen")

func _on_UILayer_back_button() -> void:
	ui_layer.hide_message()

	if ui_layer.current_screen_name == 'ReadyScreen':
		var alert_content: String

		if SyncManager.network_adaptor.is_network_host():
			alert_content = 'ALERT_LEAVE_MATCH_SETUP_HOST'
		else:
			alert_content = 'ALERT_LEAVE_MATCH'

		ui_layer.show_alert('ALERT_LEAVE_MATCH_TITLE', alert_content)
		await ui_layer.alert_completed

	OnlineMatch.leave()

	if ui_layer.current_screen_name in ['ConnectionScreen', 'MatchScreen']:
		get_tree().change_scene("res://src/main/Title.tscn")
	else:
		_return_to_match_screen()

func _on_UILayer_change_screen(name, screen, info) -> void:
	if name in ['StartScreen', 'MenuScreen']:
		ui_layer.hide_back_button()
	else:
		ui_layer.show_back_button()
