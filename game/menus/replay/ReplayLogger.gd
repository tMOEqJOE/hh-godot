extends RefCounted

enum LogType {
	HEADER,
	FRAME,
	STATE,
	INPUT,
}

enum FrameType {
	INTERFRAME,
	TICK,
	INTERPOLATION_FRAME,
}

enum SkipReason {
	ADVANTAGE_ADJUSTMENT,
	INPUT_BUFFER_UNDERRUN,
	WAITING_TO_REGAIN_SYNC,
}

var data := {}

var _writer_thread: Thread
var _writer_thread_semaphore: Semaphore
var _writer_thread_mutex: Mutex
var _write_queue := []
var _log_file: FileAccess
var _started := false

var game_mode_root: String

var SyncManager

func _init(_sync_manager, _game_mode_root) -> void:
	# Inject the SyncManager to prevent cyclic reference.
	SyncManager = _sync_manager
	game_mode_root = _game_mode_root
	
	_writer_thread_mutex = Mutex.new()
	_writer_thread_semaphore = Semaphore.new()
	_writer_thread = Thread.new()
	_log_file = null
	
	SyncManager.connect("tick_input_complete", Callable(self, "begin_tick"))

func start(log_file_name: String, match_info: Dictionary = {}) -> int:
	if not _started:
		var err: int
		_log_file = FileAccess.open_compressed(log_file_name, FileAccess.WRITE, FileAccess.COMPRESSION_FASTLZ)
		if not _log_file:
			return FileAccess.get_open_error()
		
		var header := {
			log_type = LogType.HEADER,
			match_info = match_info,
			battle_ver = Global.BATTLE_ENGINE_VERSION
		}
		_log_file.store_var(header)

		_started = true
		_writer_thread.start(self._writer_thread_function)
	
	return OK

func stop() -> void:
	_writer_thread_mutex.lock()
	var is_running = _started
	_writer_thread_mutex.unlock()
	
	if is_running:
		if data.size() > 0:
			write_current_data()
		
		_writer_thread_mutex.lock()
		_started = false
		_writer_thread_mutex.unlock()
		
		_writer_thread_semaphore.post()
		_writer_thread.wait_to_finish()
		
		_log_file.close()
		_write_queue.clear()
		data.clear()

func _writer_thread_function() -> void:
	while true:
		_writer_thread_semaphore.wait()

		var data_to_write
		var should_exit: bool

		_writer_thread_mutex.lock()
		data_to_write = _write_queue.pop_front()
		should_exit = not _started
		_writer_thread_mutex.unlock()

		if data_to_write is Dictionary:
			_log_file.store_var(data_to_write)
		elif should_exit:
			break

func write_current_data() -> void:
	if data.size() == 0:
		return
	var copy := data.duplicate(true)
	_writer_thread_mutex.lock()
	_write_queue.push_back(copy)
	_writer_thread_mutex.unlock()
	
	_writer_thread_semaphore.post()
	
	data.clear()

func begin_tick(tick: int) -> void:
	data['log_type'] = LogType.FRAME
	data['tick'] = tick
	var input_frame = SyncManager.get_input_frame(tick)
	if (Global.NETPLAY_MODE == Global.NETPLAY_MODES.OFFLINE):
		var key = input_frame.players.keys()[0]
		var p1 = input_frame.players[key].input[game_mode_root+"/ServerInputInterpreter"]
		var p2 = input_frame.players[key].input[game_mode_root+"/ClientInputInterpreter"]
		data['p1_input'] = p1[Enums.PlayerInput.InputVector]
		data['p2_input'] = p2[Enums.PlayerInput.InputVector]
	else:
		var keys = input_frame.players.keys()
		var p1_key = keys[0]
		var p2_key = keys[1]
		if (p1_key != 1):
			p1_key = keys[1]
			p2_key = keys[0]
		var p1 = input_frame.players[p1_key].input[game_mode_root+"/ServerInputInterpreter"]
		var p2 = input_frame.players[p2_key].input[game_mode_root+"/ClientInputInterpreter"]
		data['p1_input'] = p1[Enums.PlayerInput.InputVector]
		data['p2_input'] = p2[Enums.PlayerInput.InputVector]
	write_current_data()
