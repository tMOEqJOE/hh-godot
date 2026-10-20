extends Node2D

const VIEWPORT_MARGIN := 32.0

# Called when the node enters the scene tree for the first time.

@onready var BUTTON_MAP_MENU = preload("res://game/menus/buttonmap/ButtonMapMenuScreen.tscn")
var button_menu
var button_map_paused_before_open: bool
var last_input_event: InputEvent

# holoheavenbugreport@gmail.com

var Main_volume = 0
var BGM_volume = -10
var Sound_volume = -10
var Voice_volume = -10
var DebugRollbackLogsEnabled: bool = false
var language_mode: String = "en"

var _options_base_position: Vector2
var _options_base_scale: Vector2
var _options_base_size: Vector2
var _options_layout_ready := false

func get_language_index(locale: String) -> int:
	match locale:
		"ja":
			return 1
		"es":
			return 2
		"pt":
			return 3
		_:
			return 0

func _ready():
	load_startup_config()
	$CanvasLayer/Options/LanguageOption.add_item("English", 0)
	$CanvasLayer/Options/LanguageOption.add_item("日本語", 1)
	$CanvasLayer/Options/LanguageOption.add_item("Español", 2)
	$CanvasLayer/Options/LanguageOption.add_item("Português", 3)
	$CanvasLayer/Options/LanguageOption.select(get_language_index(language_mode))
	$CanvasLayer/Options/FullScreenButton.grab_focus()
	$CanvasLayer/Options/VsyncEmpty.text = bool_to_on_off_string(DisplayServer.window_get_vsync_mode() != DisplayServer.VSYNC_DISABLED)
	$CanvasLayer/Options/MainVolumeMeter.value = db_conversion(Main_volume, $CanvasLayer/Options/MainVolumeMeter.max_value)
	$CanvasLayer/Options/MusicVolumeMeter.value = db_conversion(BGM_volume, $CanvasLayer/Options/MusicVolumeMeter.max_value)
	$CanvasLayer/Options/SoundVolumeMeter.value = db_conversion(Sound_volume, $CanvasLayer/Options/SoundVolumeMeter.max_value)
	$CanvasLayer/Options/VoiceVolumeMeter.value = db_conversion(Voice_volume, $CanvasLayer/Options/VoiceVolumeMeter.max_value)
	$CanvasLayer/Options/VersionLabelReadout.text = Global.BATTLE_ENGINE_VERSION
	update_debug_rollback_log()
	replay_text_update()
	var options: Control = $CanvasLayer/Options
	_options_base_position = options.position
	_options_base_scale = options.scale
	_options_base_size = options.size
	_options_layout_ready = true
	get_viewport().size_changed.connect(_fit_options_to_viewport)
	call_deferred("_fit_options_to_viewport")

func _notification(what: int) -> void:
	if what == NOTIFICATION_TRANSLATION_CHANGED and _options_layout_ready:
		call_deferred("_fit_options_to_viewport")

func _fit_options_to_viewport() -> void:
	var options: Control = $CanvasLayer/Options
	var viewport_size := get_viewport_rect().size
	var margin := minf(VIEWPORT_MARGIN, minf(viewport_size.x, viewport_size.y) * 0.05)
	var available_size := viewport_size - Vector2.ONE * margin * 2.0
	var content_size := _options_base_size.max(options.get_combined_minimum_size())
	var base_display_size := content_size * _options_base_scale
	if base_display_size.x <= 0.0 or base_display_size.y <= 0.0:
		return

	var fit_scale := minf(
		1.0,
		minf(available_size.x / base_display_size.x, available_size.y / base_display_size.y)
	)
	options.size = content_size
	options.scale = _options_base_scale * fit_scale
	var displayed_size := content_size * options.scale
	options.position = Vector2(
		clampf(_options_base_position.x, margin, viewport_size.x - displayed_size.x - margin),
		clampf(_options_base_position.y, margin, viewport_size.y - displayed_size.y - margin)
	)

func db_conversion(internal_volume, meter_max):
	return (internal_volume * 2) + meter_max

func _input(event):
	last_input_event = event
	if event.is_action_pressed("ui_cancel"):
		_on_GoBackButton_pressed()

func _on_FullScreenButton_pressed():
	print (DisplayServer.window_get_mode())
	if (DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_FULLSCREEN):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	ProjectSettings.save_custom("override.cfg")

func _on_VsyncButton_pressed():
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED if (not (DisplayServer.window_get_vsync_mode() != DisplayServer.VSYNC_DISABLED)) else DisplayServer.VSYNC_DISABLED)
	ProjectSettings.set_setting(
		"display/window/vsync/vsync_mode", (DisplayServer.window_get_vsync_mode() != DisplayServer.VSYNC_DISABLED))
	$CanvasLayer/Options/VsyncEmpty.text = bool_to_on_off_string(DisplayServer.window_get_vsync_mode() != DisplayServer.VSYNC_DISABLED)
	ProjectSettings.save_custom("override.cfg")

func bool_to_on_off_string(input_bool: bool):
	if (input_bool):
		return tr("UI_TRAINING_ON")
	else:
		return tr("UI_TRAINING_OFF")

func _on_LanguageOption_item_selected(index: int) -> void:
	match index:
		1:
			language_mode = "ja"
		2:
			language_mode = "es"
		3:
			language_mode = "pt"
		_:
			language_mode = "en"
	apply_language()
	Util.write_to_config_file("Language", "Locale", language_mode)

func apply_language() -> void:
	TranslationServer.set_locale(language_mode)

func _on_ResetButton_pressed():
	_on_MainVolumeMeter_value_changed(0 + $CanvasLayer/Options/MainVolumeMeter.max_value)
	_on_MusicVolumeMeter_value_changed(-10 + $CanvasLayer/Options/MusicVolumeMeter.max_value)
	_on_SoundVolumeMeter_value_changed(-10 + $CanvasLayer/Options/SoundVolumeMeter.max_value)
	_on_VoiceVolumeMeter_value_changed(-10 + $CanvasLayer/Options/VoiceVolumeMeter.max_value)
	
	if (((get_window().mode == Window.MODE_EXCLUSIVE_FULLSCREEN) or (get_window().mode == Window.MODE_FULLSCREEN))):
		_on_FullScreenButton_pressed()
	if (not (DisplayServer.window_get_vsync_mode() != DisplayServer.VSYNC_DISABLED)):
		_on_VsyncButton_pressed()
	if (Global.ROLLBACK_LOGS_ENABLED):
		_on_DebugRollbackLogsButton_pressed()
	if (not Global.replay_logging_enabled):
		_on_ReplayLogsButton_pressed()

func _on_ReplayLogsButton_pressed():
	Global.replay_logging_enabled = not Global.replay_logging_enabled
	replay_text_update()

func replay_text_update():
	if (Global.replay_logging_enabled):
		$CanvasLayer/Options/ReplayLogsEmpty.text = tr("UI_TRAINING_ON")
	else:
		$CanvasLayer/Options/ReplayLogsEmpty.text = tr("UI_TRAINING_OFF")

func _on_GoBackButton_pressed():
	get_tree().change_scene_to_file("res://game/menus/mainmenu/MainMenu.tscn")
	Util.write_to_config_file("SoundOptions", "MainVolume", Main_volume)
	Util.write_to_config_file("SoundOptions", "MusicVolume", BGM_volume)
	Util.write_to_config_file("SoundOptions", "SoundVolume", Sound_volume)
	Util.write_to_config_file("SoundOptions", "VoiceVolume", Voice_volume)
	Util.write_to_config_file("Debug", "DebugRollbackLogsEnabled", DebugRollbackLogsEnabled)
	Util.write_to_config_file("Visual", "Vsync", (DisplayServer.window_get_vsync_mode() != DisplayServer.VSYNC_DISABLED))
	#Util.write_to_config_file("Visual", "FullScreenMode", (ProjectSettings.get_setting("display/window/size/fullscreen")))
	Util.write_to_config_file("Visual", "FullScreenMode", (DisplayServer.window_get_mode()))
	Util.write_to_config_file("Replay", "ReplayLogsEnabled", Global.replay_logging_enabled)

func _on_MainVolumeMeter_value_changed(value):
	$CanvasLayer/Options/MainVolumeMeter.value = value
	Main_volume = volume_meter_change("Master", $CanvasLayer/Options/MainVolumeMeter)
func _on_MusicVolumeMeter_value_changed(value):
	$CanvasLayer/Options/MusicVolumeMeter.value = value
	BGM_volume = volume_meter_change("Music", $CanvasLayer/Options/MusicVolumeMeter)
func _on_SoundVolumeMeter_value_changed(value):
	$CanvasLayer/Options/SoundVolumeMeter.value = value
	Sound_volume = volume_meter_change("Sound", $CanvasLayer/Options/SoundVolumeMeter)
func _on_VoiceVolumeMeter_value_changed(value):
	$CanvasLayer/Options/VoiceVolumeMeter.value = value
	Voice_volume = volume_meter_change("Voice", $CanvasLayer/Options/VoiceVolumeMeter, -5)
	Voice_volume = volume_meter_change("ReverbVoice", $CanvasLayer/Options/VoiceVolumeMeter, -5)

func volume_meter_change(bus, meter, modify=0):
	var volume = (meter.value - meter.max_value) / 2
	if meter.value <= meter.min_value + 0.1:
		volume = -100
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(bus), volume + modify)
	return volume

func _on_DebugRollbackLogsButton_pressed():
	DebugRollbackLogsEnabled = not DebugRollbackLogsEnabled
	Global.ROLLBACK_LOGS_ENABLED = DebugRollbackLogsEnabled
	update_debug_rollback_log()

func update_debug_rollback_log():
	if (DebugRollbackLogsEnabled):
		$CanvasLayer/Options/DebugRollbackLogsEmpty.text = tr("UI_STATUS_ROLLBACK_LOG_WARNING_ON")
	else:
		$CanvasLayer/Options/DebugRollbackLogsEmpty.text = tr("UI_STATUS_ROLLBACK_LOG_WARNING_OFF")

func _on_GetLogsDirButton_pressed():
	DisplayServer.clipboard_set(ProjectSettings.globalize_path("user://"))
	$CanvasLayer/Options/GetLogDirEmpty.text = tr("UI_STATUS_COPIED_FILE_PATH")

func _on_ClearControlsButton_pressed() -> void:
	var config = ConfigFile.new()

	# Load data from a file.
	var err = config.load("user://controllersettings.cfg")

	# If the file didn't load, ignore it.
	if err != OK:
		print("Load: Controller Config File Error: " + str(err))
		return
	
	config.clear()
	config.save("user://controllersettings.cfg")
	$CanvasLayer/Options/ClearControlsEmpty.text = tr("UI_STATUS_CLEARED_CONTROLS_FILE")
	
	Util.try_create_new_controller_file()
	Util.set_input_map_ui_controls()
	Util.init_global_input_map()

func _on_ChangeControlsButton_pressed() -> void:
	button_map_paused_before_open = get_tree().paused
	button_menu = BUTTON_MAP_MENU.instantiate()
	button_menu.configure_single_player(last_input_event, true)
	set_process_input(false)
	var focus_owner = get_viewport().gui_get_focus_owner()
	if (focus_owner != null):
		focus_owner.release_focus()
	$CanvasLayer.add_child(button_menu)
	button_menu.connect("complete", Callable(self, "button_set_complete"))

func button_set_complete() -> void:
	get_tree().paused = button_map_paused_before_open
	button_menu.disconnect("complete", Callable(self, "button_set_complete"))
	button_menu.queue_free()
	button_menu = null
	set_process_input(true)
	$CanvasLayer/Options/ChangeControlsButton.call_deferred("grab_focus")

func load_startup_config():
	var config = ConfigFile.new()

	# Load data from a file.
	var err = config.load("user://gamesettings.cfg")

	# If the file didn't load, ignore it.
	if err != OK:
		print("Config File Error: " + str(err))
		language_mode = Global.resolve_locale(config)
		apply_language()
		return

	language_mode = Global.resolve_locale(config)
	apply_language()
	
	Main_volume = config.get_value("SoundOptions", "MainVolume", 0)
	BGM_volume = config.get_value("SoundOptions", "MusicVolume", -10)
	Sound_volume = config.get_value("SoundOptions", "SoundVolume", -10)
	Voice_volume = config.get_value("SoundOptions", "VoiceVolume", -10)
	DebugRollbackLogsEnabled = config.get_value("Debug", "DebugRollbackLogsEnabled", false)
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED if (config.get_value("Visual", "Vsync", true)) else DisplayServer.VSYNC_DISABLED)
	Global.replay_logging_enabled = config.get_value("Replay", "ReplayLogsEnabled", true)
	ProjectSettings.set_setting(
		"display/window/vsync/vsync_mode", (DisplayServer.window_get_vsync_mode() != DisplayServer.VSYNC_DISABLED))
