extends Node

const DEFAULT_SOUND_BUS_SETTING := 'network/rollback/sound_manager/default_sound_bus'

var default_bus := "Master"
var ticks := {}

var audioplayers := {}

var SyncManager

func _ready() -> void:
	if ProjectSettings.has_setting(DEFAULT_SOUND_BUS_SETTING):
		default_bus = ProjectSettings.get_setting(DEFAULT_SOUND_BUS_SETTING)

func setup_sound_manager(_sync_manager) -> void:
	SyncManager = _sync_manager
	SyncManager.tick_retired.connect(self._on_SyncManager_tick_retired)
	SyncManager.sync_stopped.connect(self._on_SyncManager_sync_stopped)

func play_sound(identifier: String, sound: AudioStream, info: Dictionary = {}) -> void:
	if SyncManager.is_respawning():
		return

	if ticks.has(SyncManager.current_tick):
		if ticks[SyncManager.current_tick].has(identifier):
			return
	else:
		ticks[SyncManager.current_tick] = {}
	ticks[SyncManager.current_tick][identifier] = true

	var node
	if info.has('position'):
		node = AudioStreamPlayer2D.new()
	else:
		node = AudioStreamPlayer.new()

	node.stream = sound
	node.volume_db = info.get('volume_db', 0.0)
	node.pitch_scale = info.get('pitch_scale', 1.0)
	node.bus = info.get('bus', default_bus)

	if (audioplayers.has(identifier) and audioplayers[identifier] != null):
		_on_audio_finished(audioplayers[identifier], identifier)
	audioplayers[identifier] = node
	add_child(node)
	if info.has('position'):
		node.global_position = info['position']

	node.play()

	node.finished.connect(self._on_audio_finished.bind(node, identifier))

func _on_audio_finished(node: Node, identifier:String) -> void:
	var old_node = audioplayers[identifier]
	old_node.disconnect("finished", self._on_audio_finished)
	audioplayers[identifier].stop()
	remove_child(node)
	node.queue_free()
	audioplayers.erase(identifier)

func clear_all_sounds() -> void:
	for identifier in audioplayers.keys():
		_on_audio_finished(audioplayers[identifier], identifier)

func _on_SyncManager_tick_retired(tick) -> void:
	ticks.erase(tick)

func _on_SyncManager_sync_stopped() -> void:
	clear_all_sounds()
	ticks.clear()
