extends DemoMain

class_name TrainingMain

var meter_refresher: TrainingMeterRefresher
var savestate: Dictionary
var state_history: Array
var reaction_save_state: Dictionary
var dummy_input: InputInterpreter
var load_state_delay: int = 0

var is_recording: bool = false
var is_replaying: bool = false
var player_input: InputInterpreter
var record_left_face_ref: bool

var recording_machine

func _init() -> void:
	super._init()
	logging_enabled = false
	replay_logging_enabled = false
	meter_refresher = TrainingMeterRefresher.new()
	recording_machine = preload("res://game/menus/training/TrainingRecordingMachine.gd").new()
	recording_machine.switch_section(0)
	meter_refresher.fighter_game = fighter_game
	game_mode_root = "/root/TrainingMain/FighterGame"
	fighter_game.ko_enabled = false
	Global.HITBOX_DISPLAY = true
	savestate = {}
	state_history = []
	fillWith(state_history, {}, 3)

func fillWith(array, contents, size):
	for i in range(size):
		array.push_back(contents)

func _ready() -> void:
	super._ready()
	setup_training()
	$CanvasLayer/TrainingOptionsMenu.connect("close_menu", Callable(self, "set_new_training_options"))
	$CanvasLayer/TrainingOptionsMenu.connect("exit", Callable(self, "exit"))
	$CanvasLayer/TrainingOptionsMenu.connect("reset", Callable(self, "reset"))
	$CanvasLayer/TrainingOptionsMenu.connect("loadstate", Callable(self, "loadstate_menu"))
	$CanvasLayer/TrainingOptionsMenu.connect("savestate", Callable(self, "execute_savestate"))
	$CanvasLayer/TrainingOptionsMenu.command_list = $CanvasLayer/CommandList
	$CanvasLayer/TrainingOptionsMenu.command_list.connect("close_menu", Callable($CanvasLayer/TrainingOptionsMenu, "command_list_closed"))
	dummy_input.connect("strike_hurt", Callable(self, "load_reaction_state"))

func _physics_process(delta):
	if (not $CanvasLayer/TrainingOptionsMenu.is_enabled()):
		meter_refresher.tick(
		$CanvasLayer/TrainingOptionsMenu.get_super_meter(),
		$CanvasLayer/TrainingOptionsMenu.get_assist_meter(),
		$CanvasLayer/TrainingOptionsMenu.get_sync_rate())
		$CanvasLayer/DamageCounter.tick()
		$CanvasLayer/TrainingInputDisplay.update_input(player_input.get_most_recent_input())
		if (is_recording):
			var train_input: int = player_input.get_training_input(record_left_face_ref)
			recording_machine.record_input(train_input)
			$CanvasLayer/MessageLabel.text = recording_machine.string_recording_frame()
		elif (is_replaying):
			if (recording_machine.has_input()):
				var input:int = recording_machine.read_input()
				dummy_input.replay_input = input
				$CanvasLayer/MessageLabel.text = recording_machine.string_replaying_frame()
			else:
				dummy_input.is_replaying = false
				dummy_input.replay_input = 0
				stop_replay()
		update_reaction_save_state()
		
		var new_left_face : bool
		if (dummy_input.player.team == fighter_game.ServerPlayer.team):
			new_left_face = fighter_game.point_left_face_calculation(true)
		else:
			new_left_face = fighter_game.point_left_face_calculation(false)
		dummy_input.game_left_face = new_left_face
		if (load_state_delay > 0):
			load_state_delay -= 1
			if (load_state_delay == 0):
				execute_loadstate()
	input_helper(null)

func execute_savestate():
	savestate = SyncManager._call_save_state()
	
func update_reaction_save_state():
	var new_state = SyncManager._call_save_state()
	state_history.push_front(new_state)
	reaction_save_state = state_history.pop_back()
	if (reaction_save_state.is_empty()):
		reaction_save_state = savestate

func load_reaction_state():
	SyncManager._call_load_state(reaction_save_state)
	var input_frame
	var key = 1
	for i in range(state_history.size()-1, -1, -1):
		input_frame = SyncManager.get_input_frame(SyncManager.current_tick - i)
		key = input_frame.players.keys()[0]
		if (dummy_input.name == "ServerInputInterpreter"):
			input_frame.players[key].input["/root/TrainingMain/FighterGame/ServerInputInterpreter"] = dummy_input.hurt_response_override(i)
		else:
			input_frame.players[key].input["/root/TrainingMain/FighterGame/ClientInputInterpreter"] = dummy_input.hurt_response_override(i)
		SyncManager._call_network_process(input_frame)

func loadstate():
	load_state_delay = SyncManager.input_delay
	dummy_input.clear_input()

func loadstate_menu():
	loadstate()
	#fighter_game.un_freeze_game_sim()

func execute_loadstate():
	if (not savestate.is_empty()):
		SyncManager._call_load_state(savestate)
		dummy_input.clear_input()
		$CanvasLayer/LoadedStateLabel.show_text()
	else:
		self.execute_savestate()
		self.loadstate()
	fighter_game.un_freeze_game_sim()

func exit():
	get_tree().change_scene_to_file("res://game/menus/characterselect/TrainingCharacterSelect.tscn")
	sync_clear()
	free_main()
	MainMenuMusicControl.stop_music()

func reset():
	sync_clear()
	$CanvasLayer/TrainingOptionsMenu.hide()
	reload_scene()
	#get_tree().reload_current_scene()

func reload_scene():
	super.reload_scene()
	skip_training_intro()
	stop_record()
	stop_replay()
	

func control_the_dummy():
	if (not dummy_input.player == null):
		dummy_input.disconnect_signals()
	if (Global.TRAINING_P1):
		player_input = fighter_game.get_node("ServerInputInterpreter")
		fighter_game.ServerPlayer.input_interpreter = dummy_input
		fighter_game.ClientPlayer.input_interpreter = player_input
		fighter_game.AssistPlayer1.input_interpreter = dummy_input
		fighter_game.AssistPlayer2.input_interpreter = player_input
		if (fighter_game.Hato1 != null):
			fighter_game.Hato1.input_interpreter = dummy_input
		if (fighter_game.Hato2 != null):
			fighter_game.Hato2.input_interpreter = player_input
		dummy_input.player = fighter_game.ServerPlayer
		record_left_face_ref = fighter_game.ClientPlayer.currentState[Enums.StKey.leftface]
	else:
		player_input = fighter_game.get_node("ClientInputInterpreter")
		fighter_game.ServerPlayer.input_interpreter = player_input
		fighter_game.ClientPlayer.input_interpreter = dummy_input
		fighter_game.AssistPlayer1.input_interpreter = player_input
		fighter_game.AssistPlayer2.input_interpreter = dummy_input
		if (fighter_game.Hato1 != null):
			fighter_game.Hato1.input_interpreter = player_input
		if (fighter_game.Hato2 != null):
			fighter_game.Hato2.input_interpreter = dummy_input
		dummy_input.player = fighter_game.ClientPlayer
		record_left_face_ref = fighter_game.ServerPlayer.currentState[Enums.StKey.leftface]
	dummy_input.connect_signals()

func return_control_to_player():
	if (not dummy_input.player == null):
		dummy_input.disconnect_signals()
	if (Global.TRAINING_P1):
		player_input = fighter_game.get_node("ServerInputInterpreter")
		fighter_game.ServerPlayer.input_interpreter = player_input
		fighter_game.ClientPlayer.input_interpreter = dummy_input
		fighter_game.AssistPlayer1.input_interpreter = player_input
		fighter_game.AssistPlayer2.input_interpreter = dummy_input
		if (fighter_game.Hato1 != null):
			fighter_game.Hato1.input_interpreter = player_input
		if (fighter_game.Hato2 != null):
			fighter_game.Hato2.input_interpreter = dummy_input
		dummy_input.player = fighter_game.ClientPlayer
	else:
		player_input = fighter_game.get_node("ClientInputInterpreter")
		fighter_game.ServerPlayer.input_interpreter = dummy_input
		fighter_game.ClientPlayer.input_interpreter = player_input
		fighter_game.AssistPlayer1.input_interpreter = dummy_input
		fighter_game.AssistPlayer2.input_interpreter = player_input
		if (fighter_game.Hato1 != null):
			fighter_game.Hato1.input_interpreter = dummy_input
		if (fighter_game.Hato2 != null):
			fighter_game.Hato2.input_interpreter = player_input
		dummy_input.player = fighter_game.ServerPlayer
	dummy_input.connect_signals()

func setup_training():
	if (Global.TRAINING_P1):
		fighter_game.get_node("ClientInputInterpreter").set_script(DummyInputInterpreter)
		dummy_input = fighter_game.get_node("ClientInputInterpreter")
		dummy_input.input_prefix = "player2_"
		$CanvasLayer/DamageCounter.hp_bar = fighter_game.get_node("Camera3D/BattleUI/ClientHPBar")
	else:
		fighter_game.get_node("ServerInputInterpreter").set_script(DummyInputInterpreter)
		dummy_input = fighter_game.get_node("ServerInputInterpreter")
		dummy_input.input_prefix = "player1_"
		$CanvasLayer/DamageCounter.hp_bar = fighter_game.get_node("Camera3D/BattleUI/ServerHPBar")
	return_control_to_player()
	skip_training_intro()

func skip_training_intro():
	fighter_game.get_node("Camera3D/BattleUI/NowLoadingText").skip()
	fighter_game.ServerPlayer.skip_intro()
	fighter_game.ClientPlayer.skip_intro()
	fighter_game.AssistPlayer1.skip_intro()
	fighter_game.AssistPlayer2.skip_intro()
	fighter_game.intro_shutters_set_visible(false)
	meter_refresher.refresh_meter(
		$CanvasLayer/TrainingOptionsMenu.get_super_meter(),
		$CanvasLayer/TrainingOptionsMenu.get_assist_meter(),
		$CanvasLayer/TrainingOptionsMenu.get_sync_rate())

func _on_SyncManager_sync_started() -> void:
	super._on_SyncManager_sync_started()
	Global.server_input_interpreter.get_node("InputSource").countdown = 0
	Global.client_input_interpreter.get_node("InputSource").countdown = 0

func toggle_training_menu():
	fighter_game.permaFreeze()
	$CanvasLayer/TrainingOptionsMenu.open_training_options_menu()
	if ($CanvasLayer/TrainingOptionsMenu.visible == false):
		$CanvasLayer/TrainingInputDisplay.visible = true
	else:
		$CanvasLayer/TrainingInputDisplay.visible = false

func set_new_training_options():
	fighter_game.un_freeze_game_sim()

	var stance = $CanvasLayer/TrainingOptionsMenu.get_stance()
	var blocking = $CanvasLayer/TrainingOptionsMenu.get_blocking()
	var block_switch = $CanvasLayer/TrainingOptionsMenu.get_block_switch()
	var block_type = $CanvasLayer/TrainingOptionsMenu.get_block_type()
	var air_recovery = $CanvasLayer/TrainingOptionsMenu.get_air_recovery()
	var counter_hit = $CanvasLayer/TrainingOptionsMenu.get_counter_hit()
	
	dummy_input.stance = stance
	dummy_input.blocking = blocking
	dummy_input.block_switch = block_switch
	dummy_input.block_type = block_type
	dummy_input.air_recovery = air_recovery
	dummy_input.counter_hit = counter_hit

### RECORDING 

enum RecordingStates {
	Idle,
	PreRecord,
	Recording,
	Replaying
}

var recording_state: int = RecordingStates.Idle

func recording_fsm_record_input():
	if (recording_state == RecordingStates.Idle):
		start_pre_record()
	elif (recording_state == RecordingStates.PreRecord):
		start_record()
	elif (recording_state == RecordingStates.Recording):
		save_record()
	elif (recording_state == RecordingStates.Replaying):
		start_pre_record()

func recording_fsm_replay_input():
	if (recording_state == RecordingStates.Idle):
		start_replay()
	elif (recording_state == RecordingStates.PreRecord):
		stop_replay()
	elif (recording_state == RecordingStates.Recording):
		stop_record()
	elif (recording_state == RecordingStates.Replaying):
		stop_replay()

func start_pre_record():
	recording_state = RecordingStates.PreRecord
	$CanvasLayer/MessageLabel.text = "Standy for Recording..."
	control_the_dummy()
	is_recording = false
	recording_machine.switch_section(0)
	is_replaying = false

func start_record():
	recording_state = RecordingStates.Recording
	$CanvasLayer/MessageLabel.text = recording_machine.string_recording_frame()
	is_recording = true
	control_the_dummy()

func save_record():
	recording_state = RecordingStates.Idle
	$CanvasLayer/MessageLabel.text = "Saved recording"
	is_recording = false
	recording_machine.save_recording()
	return_control_to_player()

func stop_record():
	recording_state = RecordingStates.Idle
	$CanvasLayer/MessageLabel.text = "Cancelled recording"
	is_recording = false
	recording_machine.cancel_recording()
	return_control_to_player()

func start_replay():
	recording_state = RecordingStates.Replaying
	$CanvasLayer/MessageLabel.text = "Replaying"
	return_control_to_player()
	is_replaying = true
	dummy_input.prep_for_replay()

func stop_replay():
	recording_state = RecordingStates.Idle
	$CanvasLayer/MessageLabel.text = ""
	return_control_to_player()
	recording_machine.cancel_replay()
	is_replaying = false
	dummy_input.is_replaying = false
	dummy_input.replay_input = 0

func _input(event):
	pass

func input_helper(event):
	if (Global.TRAINING_P1 and Input.is_action_just_pressed("player1_start")) or (not Global.TRAINING_P1 and Input.is_action_just_pressed("player2_start")):
		if (not $CanvasLayer/TrainingOptionsMenu.is_enabled()):
			toggle_training_menu()
	elif (Global.TRAINING_P1 and Input.is_action_just_pressed("player1_cancel")) or (not Global.TRAINING_P1 and Input.is_action_just_pressed("player2_cancel")):
		if (not $CanvasLayer/TrainingOptionsMenu.is_enabled()):
			loadstate()
	elif (Global.TRAINING_P1 and Input.is_action_just_pressed("player1_record")) or (not Global.TRAINING_P1 and Input.is_action_just_pressed("player2_record")):
		if (not $CanvasLayer/TrainingOptionsMenu.is_enabled()):
			recording_fsm_record_input()
	elif (Global.TRAINING_P1 and Input.is_action_just_pressed("player1_replay")) or (not Global.TRAINING_P1 and Input.is_action_just_pressed("player2_replay")):
		if (not $CanvasLayer/TrainingOptionsMenu.is_enabled()):
			recording_fsm_replay_input()
