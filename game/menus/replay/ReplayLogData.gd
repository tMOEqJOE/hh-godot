extends RefCounted

const ReplayLogger = preload("res://game/menus/replay/ReplayLogger.gd")

var max_tick := 0

var match_info := {}
var p1_input := {}
var p2_input := {}

var _is_loading := false
var _loader_thread: Thread
var _loader_mutex: Mutex

signal load_progress (current, total)
signal load_finished ()
signal load_error (msg)
signal data_updated ()

func _init() -> void:
	_loader_mutex = Mutex.new()

func clear() -> void:
	if is_loading():
		push_error("Cannot clear() log data while loading")
		return
	
	max_tick = 0
	match_info.clear()
	p1_input.clear()
	p2_input.clear()

func load_log_file(path: String) -> void:
	if is_loading():
		push_error("Attempting to load log file when one is already loading")
		return
	
	var file = FileAccess.open_compressed(path, FileAccess.READ, FileAccess.COMPRESSION_FASTLZ)
	if not file:
		call_deferred("emit_signal", "load_error", "Unable to open file for reading: %s" % path)
		return
	
	if _loader_thread:
		_loader_thread.wait_to_finish()
	_loader_thread = Thread.new()
	
	_is_loading = true
	_loader_thread.start(Callable(self, "_loader_thread_function").bind([file, path]))

func _set_loading(_value: bool) -> void:
	_loader_mutex.lock()
	_is_loading = _value
	_loader_mutex.unlock()

func is_loading() -> bool:
	var value: bool
	_loader_mutex.lock()
	value = _is_loading
	_loader_mutex.unlock()
	return value

func _thread_print(msg) -> void:
	print(msg)

func _loader_thread_function(input: Array) -> void:
	var file: FileAccess = input[0]
	var path: String = input[1]
	
	var header
	var file_size = file.get_length()
	
	while not file.eof_reached():
		var data = file.get_var()
		if data == null or not data is Dictionary:
			continue
		
		if header == null:
			if data['log_type'] == ReplayLogger.LogType.HEADER:
				header = data
				var header_match_info = header.get('match_info', {})
				if match_info.size() > 0 and match_info.hash() != header_match_info.hash():
					file.close()
					call_deferred("emit_signal", "data_updated")
					call_deferred("emit_signal", "load_error", "Log file has match info that doesn't match already loaded data")
					_set_loading(false)
					return
				else:
					match_info = header_match_info
				var battle_ver = header.get('battle_ver', "NONE")
				if battle_ver != Global.BATTLE_ENGINE_VERSION:
					file.close()
					call_deferred("emit_signal", "data_updated")
					call_deferred("emit_signal", "load_error", "Battle version does not match: " + battle_ver)
					_set_loading(false)
					return
				continue
			else:
				file.close()
				call_deferred("emit_signal", "data_updated")
				call_deferred("emit_signal", "load_error", "No header at the top of log: %s" % path)
				_set_loading(false)
				return
		
		_add_log_entry(data)
		call_deferred("emit_signal", "load_progress", file.get_position(), file_size)
	
	file.close()
	call_deferred("emit_signal", "data_updated")
	call_deferred("emit_signal", "load_finished")
	_set_loading(false)

func _add_log_entry(log_entry: Dictionary) -> void:
	var tick: int = log_entry.get('tick', 0)
	max_tick = int(max(max_tick, tick))
	match log_entry['log_type'] as int:
		ReplayLogger.LogType.FRAME:
			if (log_entry.has('p1_input')):
				p1_input[tick] = log_entry.get('p1_input', 0)
			else:
				call_deferred("emit_signal", "data_updated")
				call_deferred("emit_signal", "load_error", "Missing p1 input")
				print("Missing p1 input")
				
			if (log_entry.has('p2_input')):
				p2_input[tick] = log_entry.get('p2_input', 0)
			else:
				call_deferred("emit_signal", "data_updated")
				call_deferred("emit_signal", "load_error", "Missing p2 input")
				print("Missing p2 input")
		_:
			print("incorrect log type for entries")
