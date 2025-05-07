extends Node2D

class_name CharacterSelect

# initialize

var rng : RandomNumberGenerator

var next_scene_packed
var prev_scene_packed

var character = [
	[Enums.PointCharacters.Ollie, Enums.PointCharacters.Suisei, Enums.PointCharacters.Kanata],
	[Enums.PointCharacters.Mio, Enums.PointCharacters.Subaru, Enums.PointCharacters.Oga],
	[Enums.PointCharacters.Random, Enums.PointCharacters.Random, Enums.PointCharacters.Random],
	[Enums.PointCharacters.Random, Enums.PointCharacters.Random, Enums.PointCharacters.Random]
	]

var assist2 = [
	[Enums.AssistCharacters.Ollie, Enums.AssistCharacters.Suisei, Enums.AssistCharacters.Kanata, Enums.AssistCharacters.Fubuki, Enums.AssistCharacters.Hakka],
	[Enums.AssistCharacters.Mio, Enums.AssistCharacters.Subaru, Enums.AssistCharacters.Oga, Enums.AssistCharacters.Fubuki, Enums.AssistCharacters.OkaKoro],
	[Enums.AssistCharacters.Random, Enums.AssistCharacters.Random, Enums.AssistCharacters.Random, Enums.AssistCharacters.Sora, Enums.AssistCharacters.Sana],
	[Enums.AssistCharacters.Random, Enums.AssistCharacters.Random, Enums.AssistCharacters.Random, Enums.AssistCharacters.Sora, Enums.AssistCharacters.Sana]
	]
var assist1 = [
	[Enums.AssistCharacters.Hakka, Enums.AssistCharacters.Fubuki, Enums.AssistCharacters.Ollie, Enums.AssistCharacters.Suisei, Enums.AssistCharacters.Kanata],
	[Enums.AssistCharacters.OkaKoro, Enums.AssistCharacters.Fubuki, Enums.AssistCharacters.Mio, Enums.AssistCharacters.Subaru, Enums.AssistCharacters.Oga],
	[Enums.AssistCharacters.Sana, Enums.AssistCharacters.Sora, Enums.AssistCharacters.Random, Enums.AssistCharacters.Random, Enums.AssistCharacters.Random],
	[Enums.AssistCharacters.Sana, Enums.AssistCharacters.Sora, Enums.AssistCharacters.Random, Enums.AssistCharacters.Random, Enums.AssistCharacters.Random]
	]

@onready var AssistSelect = preload("res://game/menus/characterselect/AssistCharacterSelect.tscn")
var p1_assist_select
var p2_assist_select

@onready var ButtonMap = preload("res://game/menus/buttonmap/ButtonMapMenu.tscn")
@onready var KeyButtonMap = preload("res://game/menus/buttonmap/KeyboardButtonMapMenu.tscn")
var p1_button_map: ButtonMapMenuBase
var p2_button_map: ButtonMapMenuBase

var p1_ready:bool = false
var p2_ready:bool = false

var p1_active_cursor
var p2_active_cursor

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.load_queue.start()
	rng = RandomNumberGenerator.new()
	rng.randomize()
	$P1Cursor.connect("change_character", Callable(self, "update_p1_portrait"))
	$P2Cursor.connect("change_character", Callable(self, "update_p2_portrait"))
	$P1Cursor.connect("select_chara", Callable(self, "update_p1"))
	$P2Cursor.connect("select_chara", Callable(self, "update_p2"))
	$P1Cursor.connect("select_chara", Callable($AkiMC, "p1_call"))
	$P2Cursor.connect("select_chara", Callable($AkiMC, "p2_call"))
	$P1Cursor.connect("select_chara", Callable($P1SelectFlash, "player_call"))
	$P2Cursor.connect("select_chara", Callable($P2SelectFlash, "player_call"))
	$KimiNoHiroin.connect("start_intro_sequence", Callable(MainMenuMusicControl, "play_character_select_music"))
	update_p1_portrait($P1Cursor.row, $P1Cursor.col)
	update_p2_portrait($P2Cursor.row, $P2Cursor.col)
	if (self.has_node("CanvasLayer/WinCounterP1")):
		$CanvasLayer/WinCounterP1.update_win_count(true)
		$CanvasLayer/WinCounterP2.update_win_count(false)
	p1_active_cursor = $P1Cursor
	p2_active_cursor = $P2Cursor
	MainMenuMusicControl.reset_seek()

func try_react_to_new_controller(event):
	if (event is InputEventJoypadMotion or event is InputEventJoypadButton):
		if (Global.p1_device_id < 0 or Global.p2_device_id < 0):
			Util.try_replace_controller(event.device)

func update_p1_portrait(row:int,col:int):
	$P1Portrait.change_portrait_anim()
	resolve_portrait(row, col, true)
#	$P1Portrait.material.set_shader_param("palette", load(Global.PLAYER_1_COLOR[0]))

func update_p2_portrait(row:int,col:int):
	$P2Portrait.change_portrait_anim()
	resolve_portrait(row, col, false)
#	$P2Portrait.material.set_shader_param("palette", load(Global.PLAYER_2_COLOR[0]))

func update_a1_portrait(row:int,col:int):
	$A1Portrait.change_portrait_anim()
	resolve_assist_portrait(row, col, true)
#	$P1Portrait.material.set_shader_param("palette", load(Global.PLAYER_1_COLOR[0]))

func update_a2_portrait(row:int,col:int):
	$A2Portrait.change_portrait_anim()
	resolve_assist_portrait(row, col, false)
#	$P2Portrait.material.set_shader_param("palette", load(Global.PLAYER_2_COLOR[0]))

func update_p1():
#	Global.PLAYER_1_COLOR[0] = "res://game/assets/sprites/subaru/ColorPalettes/1.png"
#	$P1Portrait.material.set_shader_param("palette", load(Global.PLAYER_1_COLOR[0]))
	p1_assist_select = AssistSelect.instantiate() 
	add_child(p1_assist_select)
	p1_active_cursor = p1_assist_select
	p1_assist_select.position.x = 966
	p1_assist_select.position.y = 300
	p1_assist_select.setup(true, true)
	p1_assist_select.get_node("CharacterCursor").connect("change_character", Callable(self, "update_a1_portrait"))
	p1_assist_select.get_node("CharacterCursor").connect("select_chara", Callable(self, "update_a1"))
	p1_assist_select.get_node("CharacterCursor").connect("select_chara", Callable($P1SelectFlash, "player_call"))
	p1_assist_select.get_node("CharacterCursor").connect("select_chara", Callable($AkiMC, "p1_call"))
	update_a1_portrait(p1_assist_select.cursor_row(), p1_assist_select.cursor_col())
	var charaData = resolve_characters($P1Cursor.row, $P1Cursor.col)
	unload_character(charaData[0],true,false)
	Global.PLAYER_1_NODE_PATH[0] = charaData[0]
	Global.PLAYER_1_CHARACTER[0] = charaData[1]
	Global.load_queue.queue_resource(Global.PLAYER_1_NODE_PATH[0])
	if (Global.PLAYER_1_CHARACTER[0] == Enums.PointCharacters.Mio):
		Global.load_queue.queue_resource(Global.PLAYER_1_NODE_PATH[2])

func update_p2():
#	Global.PLAYER_2_COLOR[0] = "res://game/assets/sprites/subaru/ColorPalettes/2.png"
#	$P2Portrait.material.set_shader_param("palette", load(Global.PLAYER_2_COLOR[0]))
	p2_assist_select = AssistSelect.instantiate() 
	add_child(p2_assist_select)
	p2_active_cursor = p2_assist_select
	p2_assist_select.position.x = 966
	p2_assist_select.position.y = 300
	p2_assist_select.setup(false, false)
	p2_assist_select.get_node("CharacterCursor").connect("change_character", Callable(self, "update_a2_portrait"))
	p2_assist_select.get_node("CharacterCursor").connect("select_chara", Callable(self, "update_a2"))
	p2_assist_select.get_node("CharacterCursor").connect("select_chara", Callable($P2SelectFlash, "player_call"))
	p2_assist_select.get_node("CharacterCursor").connect("select_chara", Callable($AkiMC, "p2_call"))
	update_a2_portrait(p2_assist_select.cursor_row(), p2_assist_select.cursor_col())
	var charaData = resolve_characters($P2Cursor.row, $P2Cursor.col)
	unload_character(charaData[0],false,false)
	Global.PLAYER_2_NODE_PATH[0] = charaData[0]
	Global.PLAYER_2_CHARACTER[0] = charaData[1]
	Global.load_queue.queue_resource(Global.PLAYER_2_NODE_PATH[0])
	if (Global.PLAYER_2_CHARACTER[0] == Enums.PointCharacters.Mio):
		Global.load_queue.queue_resource(Global.PLAYER_2_NODE_PATH[2])

@rpc("any_peer", "call_local", "reliable")
func update_a1():
#	Global.PLAYER_1_COLOR[0] = "res://game/assets/sprites/subaru/ColorPalettes/1.png"
#	$P1Portrait.material.set_shader_param("palette", load(Global.PLAYER_1_COLOR[0]))
	var charaData = resolve_assists(p1_assist_select.cursor_row(), p1_assist_select.cursor_col(), true)
	unload_character(charaData[0], true,true)
	p1_active_cursor = null
	Global.PLAYER_1_NODE_PATH[1] = charaData[0]
	Global.PLAYER_1_CHARACTER[1] = charaData[1]
	Global.load_queue.queue_resource(Global.PLAYER_1_NODE_PATH[1])
	p1_ready = true
	ready_up_peer()

func update_a2():
#	Global.PLAYER_2_COLOR[0] = "res://game/assets/sprites/subaru/ColorPalettes/2.png"
#	$P2Portrait.material.set_shader_param("palette", load(Global.PLAYER_2_COLOR[0]))
	var charaData = resolve_assists(p2_assist_select.cursor_row(), p2_assist_select.cursor_col(), false)
	unload_character(charaData[0],false,true)
	p2_active_cursor = null
	Global.PLAYER_2_NODE_PATH[1] = charaData[0]
	Global.PLAYER_2_CHARACTER[1] = charaData[1]
	Global.load_queue.queue_resource(Global.PLAYER_2_NODE_PATH[1])
	p2_ready = true
	ready_up_peer()

func unload_character(next_character, is_p1, is_assist)-> void:
	var index = 0
	if (is_assist):
		index = 1
	
	#if (Global.PLAYER_2_NODE_PATH[index] != Global.PLAYER_1_NODE_PATH[index]):
		#if (is_p1):
			#if (Global.PLAYER_1_NODE_PATH[index] != next_character):
				#Global.PLAYER_1_NODE[0] = (Global.PLAYER_1_NODE_PATH[index])
		#else:
			#if (Global.PLAYER_2_NODE_PATH[index] != next_character):
				#Global.load_queue.cancel_resource(Global.PLAYER_2_NODE_PATH[index])

func ready_up_peer():
	if (p1_ready and p2_ready):
		start_loading_process()

func start_loading_process():
	resolve_colors()
	resolve_assist_colors()
	go_to_next_scene()

func _physics_process(_delta):
	physics_tick()

func physics_tick():
	if (p1_button_map == null and Input.is_action_just_pressed("player1_cancel")):
		if (not $P1Cursor.selected):
			go_to_prev_scene()
		else:
			if (p1_assist_select != null and p1_assist_select.is_selected()):
				p1_assist_select.deselect()
				p1_active_cursor = p1_assist_select
				p1_ready = false
			else:
				p1_assist_select.queue_free()
				remove_child(p1_assist_select)
				p1_assist_select = null
				p1_active_cursor = $P1Cursor
				$P1Cursor.deselect()
	if (p2_button_map == null and Input.is_action_just_pressed("player2_cancel")):
		if (not $P2Cursor.selected):
			go_to_prev_scene()
		else:
			if (p2_assist_select != null and p2_assist_select.is_selected()):
				p2_assist_select.deselect()
				p2_active_cursor = p2_assist_select
				p2_ready = false
			else:
				p2_assist_select.queue_free()
				remove_child(p2_assist_select)
				p2_assist_select = null
				p2_active_cursor = $P2Cursor
				$P2Cursor.deselect()

func resolve_characters(row: int, col: int):
	var enumChara: int = character[row][col]
	
	if (enumChara == Enums.PointCharacters.Random):
		enumChara = rng.randi_range(0, 5)
		print("RANDOM POINT " + str(enumChara))
	
	match enumChara:
		Enums.PointCharacters.Subaru:
			return ["res://game/fighter/SubaruPlayer.tscn", Enums.PointCharacters.Subaru]
		Enums.PointCharacters.Mio:
			return ["res://game/fighter/MioPlayer.tscn", Enums.PointCharacters.Mio]
		Enums.PointCharacters.Oga:
			return ["res://game/fighter/OgaPlayer.tscn", Enums.PointCharacters.Oga]
		Enums.PointCharacters.Ollie:
			return ["res://game/fighter/OlliePlayer.tscn", Enums.PointCharacters.Ollie]
		Enums.PointCharacters.Kanata:
			return ["res://game/fighter/KanataPlayer.tscn", Enums.PointCharacters.Kanata]
		Enums.PointCharacters.Suisei:
			return ["res://game/fighter/SuiseiPlayer.tscn", Enums.PointCharacters.Suisei]
		_:
			return ["res://game/fighter/SubaruPlayer.tscn", Enums.PointCharacters.Subaru]

func resolve_assists(row:int, col:int, is_p1):
	var enumChara: int = assist2[row][col]
	if (is_p1):
		enumChara = assist1[row][col]
	
	if (enumChara == Enums.AssistCharacters.Random):
		enumChara = rng.randi_range(0, 7)
		print("RANDOM ASSIST " + str(enumChara))
	
	match enumChara:
		Enums.AssistCharacters.Fubuki:
			return ["res://game/fighter/assist/fubuki/FubukiPlayer.tscn", Enums.AssistCharacters.Fubuki]
		Enums.AssistCharacters.Sora:
			return ["res://game/fighter/assist/sora/SoraPlayer.tscn", Enums.AssistCharacters.Sora]
		Enums.AssistCharacters.Sana:
			return ["res://game/fighter/assist/assistsana/SanaPlayer.tscn", Enums.AssistCharacters.Sana]
		Enums.AssistCharacters.OkaKoro:
			return ["res://game/fighter/assist/okakoro/OkaKoroPlayer.tscn", Enums.AssistCharacters.OkaKoro]
		Enums.AssistCharacters.Hakka:
			return ["res://game/fighter/assist/hakka/HakkaPlayer.tscn", Enums.AssistCharacters.Hakka]
		Enums.AssistCharacters.Subaru:
			return ["res://game/fighter/assist/assistsubaru/AssistSubaruPlayer.tscn", Enums.AssistCharacters.Subaru]
		Enums.AssistCharacters.Mio:
			return ["res://game/fighter/assist/assistmio/AssistMioPlayer.tscn", Enums.AssistCharacters.Mio]
		Enums.AssistCharacters.Oga:
			return ["res://game/fighter/assist/assistoga/AssistOgaPlayer.tscn", Enums.AssistCharacters.Oga]
		Enums.AssistCharacters.Ollie:
			return ["res://game/fighter/assist/assistollie/AssistOlliePlayer.tscn", Enums.AssistCharacters.Ollie]
		_:
			return ["res://game/fighter/assist/fubuki/FubukiPlayer.tscn", Enums.AssistCharacters.Fubuki]

func resolve_colors():
	var enumChara1: int = Global.PLAYER_1_CHARACTER[0]
	var enumChara2: int = Global.PLAYER_2_CHARACTER[0]
	var color1: String = ""
	var color2: String = ""
	color1 = match_color(enumChara1)
	color2 = match_color(enumChara2)
	if (enumChara1 == enumChara2):
		color1 += "1.png"
		color2 += "2.png"
	else:
		color1 += "1.png"
		color2 += "1.png"
	Global.PLAYER_1_COLOR[0] = color1
	Global.PLAYER_2_COLOR[0] = color2
	Global.load_new_color(true, false)
	Global.load_new_color(false, false)

func resolve_assist_colors():
	var enumChara1: int = Global.PLAYER_1_CHARACTER[1]
	var enumChara2: int = Global.PLAYER_2_CHARACTER[1]
	var color1: String = ""
	var color2: String = ""
	color1 = match_color(enumChara1, true)
	color2 = match_color(enumChara2, true)
	if (enumChara1 == enumChara2):
		color1 += "1.png"
		color2 += "2.png"
	else:
		color1 += "1.png"
		color2 += "1.png"
	Global.PLAYER_1_COLOR[1] = color1
	Global.PLAYER_2_COLOR[1] = color2
	Global.load_new_color(true, true)
	Global.load_new_color(false, true)

func match_color(enumChara:int, is_assist=false) -> String:
	var color = ""
	if (is_assist):
		match enumChara:
			Enums.AssistCharacters.Fubuki:
				color = "res://game/assets/sprites/assists/fubuki/ColorPalettes/"
			Enums.AssistCharacters.Sora:
				color = "res://game/assets/sprites/assists/sora/ColorPalettes/"
			Enums.AssistCharacters.Subaru:
				color = "res://game/assets/sprites/subaru/ColorPalettes/"
			Enums.AssistCharacters.Mio:
				color = "res://game/assets/sprites/mio/ColorPalettes/"
			Enums.AssistCharacters.Oga:
				color = "res://game/assets/sprites/oga/ColorPalettes/"
			_:
				color = "res://game/assets/sprites/subaru/ColorPalettes/"
	else:
		match enumChara:
			Enums.PointCharacters.Subaru:
				color = "res://game/assets/sprites/subaru/ColorPalettes/"
			Enums.PointCharacters.Mio:
				color = "res://game/assets/sprites/mio/ColorPalettes/"
			Enums.PointCharacters.Oga:
				color = "res://game/assets/sprites/oga/ColorPalettes/"
			_:
				color = "res://game/assets/sprites/subaru/ColorPalettes/"
	return color

func resolve_portrait(row:int, col:int, is_p1:bool):
	var enumChara: int = character[row][col]
	var color: String = ""
	var portrait: String = ""
	match enumChara:
		Enums.PointCharacters.Subaru:
			color = "res://game/assets/sprites/subaru/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SubaruPortrait.png"
		Enums.PointCharacters.Mio:
			color = "res://game/assets/sprites/mio/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/MioPortrait.png"
		Enums.PointCharacters.Oga:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/OgaPortrait.png"
		Enums.PointCharacters.Ollie:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/OlliePortrait.png"
		Enums.PointCharacters.Suisei:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SuiseiPortrait.png"
		Enums.PointCharacters.Kanata:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/KanataPortrait.png"
		Enums.PointCharacters.Seven:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SubaruPortrait.png"
		Enums.PointCharacters.Eight:
			color = "res://game/assets/sprites/subaru/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SubaruPortrait.png"
		Enums.PointCharacters.Nine:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SubaruPortrait.png"
		Enums.PointCharacters.Ten:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SubaruPortrait.png"
		Enums.PointCharacters.Eleven:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SubaruPortrait.png"
		Enums.PointCharacters.Twelve:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SubaruPortrait.png"
		Enums.PointCharacters.Random:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/KimiNoHiroin/QuestionMark.png"
		_:
			color = "res://game/assets/sprites/subaru/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/subaru/SubaruPortrait.png"
	if (is_p1):
		Global.PLAYER_1_COLOR[0] = color
		$P1Portrait.texture = load(portrait)
	else:
		Global.PLAYER_2_COLOR[0] = color
		$P2Portrait.texture = load(portrait)

func resolve_assist_portrait(row:int, col:int, is_p1:bool):
	var enumChara: int = assist2[row][col]
	if (is_p1):
		enumChara = assist1[row][col]
	var color: String = ""
	var portrait: String = ""
	match enumChara:
		Enums.AssistCharacters.Subaru:
			color = "res://game/assets/sprites/subaru/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SubaruPortrait.png"
		Enums.AssistCharacters.Mio:
			color = "res://game/assets/sprites/mio/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/MioPortrait.png"
		Enums.AssistCharacters.Oga:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/OgaPortrait.png"
		Enums.AssistCharacters.Ollie:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/OlliePortrait.png"
		Enums.AssistCharacters.Suisei:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SubaruPortrait.png"
		Enums.AssistCharacters.Kanata:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SubaruPortrait.png"
		Enums.AssistCharacters.Seven:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SubaruPortrait.png"
		Enums.AssistCharacters.Eight:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SubaruPortrait.png"
		Enums.AssistCharacters.Nine:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SubaruPortrait.png"
		Enums.AssistCharacters.Ten:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SubaruPortrait.png"
		Enums.AssistCharacters.Eleven:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SubaruPortrait.png"
		Enums.AssistCharacters.Twelve:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SubaruPortrait.png"
		Enums.AssistCharacters.Fubuki:
			color = "res://game/assets/sprites/assists/fubuki/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/FubukiPortrait.png"
		Enums.AssistCharacters.Sora:
			color = "res://game/assets/sprites/assists/sora/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SoraPortrait.png"
		Enums.AssistCharacters.OkaKoro:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/OkakoroPortrait.png"
		Enums.AssistCharacters.Hakka:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/HakkaPortrait.png"
		Enums.AssistCharacters.Sana:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/SanaPortrait.png"
		Enums.AssistCharacters.Random:
			color = "res://game/assets/sprites/oga/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/KimiNoHiroin/QuestionMark.png"
		_:
			color = "res://game/assets/sprites/assists/fubuki/ColorPalettes/1.png"
			portrait = "res://game/assets/sprites/UI/CharacterSelect/Portraits/FubukiPortrait.png"
	if (is_p1):
		Global.PLAYER_1_COLOR[1] = color
		$A1Portrait.texture = load(portrait)
	else:
		Global.PLAYER_2_COLOR[1] = color
		$A2Portrait.texture = load(portrait)

func button_set_complete(is_p1:bool):
	if (is_p1):
		p1_button_map.free_button_menu()
		remove_child(p1_button_map)
		p1_button_map = null
		if (p1_active_cursor != null):
			p1_active_cursor.enable(true)
	else:
		remove_child(p2_button_map)
		p2_button_map.free_button_menu()
		p2_button_map = null
		if (p2_active_cursor != null):
			p2_active_cursor.enable(true)

func _input(event):
	input_helper(event)

func input_helper(event):
	button_set_initiate(event)
	try_react_to_new_controller(event)

func button_set_initiate(event):
	if event.is_action_pressed("player1_start"):
		if (p1_button_map == null):
			if (event is InputEventJoypadButton and Global.p1_is_gamepad):
				p1_button_map = ButtonMap.instantiate()
			elif (event is InputEventKey and not Global.p1_is_gamepad):
				p1_button_map = KeyButtonMap.instantiate()
			else:
				return
			add_child(p1_button_map)
			p1_button_map.position.x = 50
			p1_button_map.position.y = 50
			p1_button_map.set_is_p1(true)
			p1_button_map.connect("button_set_complete", Callable(self, "button_set_complete"))
			if (p1_active_cursor != null):
				p1_active_cursor.enable(false)
			if (p1_assist_select != null):
				p1_assist_select.deselect()
				p1_ready = false
				p1_active_cursor = p1_assist_select
				p1_assist_select.enable(false)
	if event.is_action_pressed("player2_start"):
		if (p2_button_map == null):
			if (event is InputEventJoypadButton and Global.p2_is_gamepad):
				p2_button_map = ButtonMap.instantiate()
			elif (event is InputEventKey and not Global.p2_is_gamepad):
				p2_button_map = KeyButtonMap.instantiate()
			else:
				return
			add_child(p2_button_map)
			p2_button_map.position.x = 1150
			p2_button_map.position.y = 50
			p2_button_map.set_is_p1(false)
			p2_button_map.connect("button_set_complete", Callable(self, "button_set_complete"))
			if (p2_active_cursor != null):
				p2_active_cursor.enable(false)
			if (p2_assist_select != null):
				p2_assist_select.deselect()
				p2_ready = false
				p2_active_cursor = p2_assist_select
				p2_assist_select.enable(false)

func go_to_prev_scene():
	get_tree().change_scene_to_file("res://game/menus/buttonmap/ControllerPickMenuScreen.tscn")

func go_to_next_scene():
	get_tree().change_scene_to_file("res://game/menus/stagemusicselect/StageMusicSelect.tscn")
