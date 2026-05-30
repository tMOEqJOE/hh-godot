extends CharacterSelect

class_name ComboTrialCharacterSelect

func _ready():
	super._ready()
	
	MainMenuMusicControl.reset_seek()
	if (Global.TRAINING_P1):
		P1Cursor.input_prefix = "player1_"
		P2Cursor.input_prefix = "player1_"
		P2Cursor.enable(false)
		P2Cursor.visible = false
	else:
		P1Cursor.input_prefix = "player2_"
		P2Cursor.input_prefix = "player2_"
		P1Cursor.enable(false)
		P1Cursor.visible = false

func connect_ui_elements():
	P1Cursor = $PresentationLayer/P1Cursor
	P2Cursor = $PresentationLayer/P2Cursor
	A1Portrait = $PresentationLayer/A1Portrait
	A2Portrait = $PresentationLayer/A2Portrait
	P1Portrait = $PresentationLayer/P1Portrait
	P2Portrait = $PresentationLayer/P2Portrait
	AkiMC = $PresentationLayer/AkiMC
	P1SelectFlash = $PresentationLayer/P1SelectFlash
	P2SelectFlash = $PresentationLayer/P2SelectFlash
	KimiNoHiroin = $PresentationLayer/KimiNoHiroin
	WinCounterP1 = $PresentationLayer/CanvasLayer/WinCounterP1
	WinCounterP2 = $PresentationLayer/CanvasLayer/WinCounterP2

func update_a1():
	if (Global.TRAINING_P1):
		super.update_a1()
		p1_active_cursor = P2Cursor
		pick_default_opponent(3, 0)

func update_a2():
	if (not Global.TRAINING_P1):
		super.update_a2()
		p2_active_cursor = P1Cursor
		pick_default_opponent(3, 0)

func pick_default_opponent(row, col):
	var randRow = row
	var randCol = col
	if (Global.TRAINING_P1):
		var charaData = resolve_characters(randRow, randCol)
		unload_character(charaData[0],false,false)
		Global.PLAYER_2_NODE_PATH[0] = charaData[0]
		Global.PLAYER_2_CHARACTER[0] = charaData[1]
		Global.load_queue.queue_resource(Global.PLAYER_2_NODE_PATH[0])
		if (Global.PLAYER_2_CHARACTER[0] == Enums.PointCharacters.Mio):
			Global.load_queue.queue_resource(Global.PLAYER_2_NODE_PATH[2])
		
		charaData = resolve_assists(randRow, randCol, false)
		unload_character(charaData[0],false,true)
		p2_active_cursor = null
		Global.PLAYER_2_NODE_PATH[1] = charaData[0]
		Global.PLAYER_2_CHARACTER[1] = charaData[1]
		Global.load_queue.queue_resource(Global.PLAYER_2_NODE_PATH[1])
		p2_ready = true
		p1_ready = true
		ready_up_peer()
	else:
		var charaData = resolve_characters(randRow, randCol)
		unload_character(charaData[0],true,false)
		Global.PLAYER_1_NODE_PATH[0] = charaData[0]
		Global.PLAYER_1_CHARACTER[0] = charaData[1]
		Global.load_queue.queue_resource(Global.PLAYER_1_NODE_PATH[0])
		if (Global.PLAYER_1_CHARACTER[0] == Enums.PointCharacters.Mio):
			Global.load_queue.queue_resource(Global.PLAYER_1_NODE_PATH[2])
		
		randRow = row
		randCol = col #p2_assist_select.cursor.gridX - 2
		charaData = resolve_assists(randRow, randCol, true)
		unload_character(charaData[0], true,true)
		p1_active_cursor = null
		Global.PLAYER_1_NODE_PATH[1] = charaData[0]
		Global.PLAYER_1_CHARACTER[1] = charaData[1]
		Global.load_queue.queue_resource(Global.PLAYER_1_NODE_PATH[1])
		p1_ready = true
		p2_ready = true
		ready_up_peer()

func start_loading_process():
	resolve_colors()
	resolve_assist_colors()
	go_to_next_scene()

func go_to_prev_scene():
	get_tree().change_scene_to_file("res://game/menus/buttonmap/ComboTrialControllerPickMenuScreen.tscn")

func go_to_next_scene():
	get_tree().change_scene_to_file("res://game/menus/stagemusicselect/ComboTrialStageMusicSelect.tscn")
