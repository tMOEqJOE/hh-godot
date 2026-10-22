extends CharacterSelect

class_name TrainingCharacterSelect

func _ready():
	super._ready()
	load_next_scenes()
	MainMenuMusicControl.reset_seek()
	if (Global.TRAINING_P1):
		$P1Cursor.input_prefix = "player1_"
		$P2Cursor.input_prefix = "player1_"
		$P2Cursor.enable(false)
	else:
		$P1Cursor.input_prefix = "player2_"
		$P2Cursor.input_prefix = "player2_"
		$P1Cursor.enable(false)

func load_next_scenes():
	next_scene_packed = load("res://game/menus/stagemusicselect/TrainingStageMusicSelect.tscn")
	prev_scene_packed = load("res://game/menus/buttonmap/TrainingControllerPickMenuScreen.tscn")

func complete_p1_selection():
	super.complete_p1_selection()
	if (Global.TRAINING_P1):
		p1_assist_select.get_node("CharacterCursor").input_prefix = "player1_"
	else:
		p1_assist_select.get_node("CharacterCursor").input_prefix = "player2_"
		p2_active_cursor = p1_assist_select

func complete_p2_selection():
	super.complete_p2_selection()
	if (Global.TRAINING_P1):
		p2_assist_select.get_node("CharacterCursor").input_prefix = "player1_"
		p1_active_cursor = p2_assist_select
	else:
		p2_assist_select.get_node("CharacterCursor").input_prefix = "player2_"

func complete_a1_selection():
	super.complete_a1_selection()
	if (Global.TRAINING_P1):
		p1_active_cursor = $P2Cursor
		$P2Cursor.enable(true)
	else:
		p2_active_cursor = null

func complete_a2_selection():
	super.complete_a2_selection()
	if (not Global.TRAINING_P1):
		p2_active_cursor = $P1Cursor
		$P1Cursor.enable(true)
	else:
		p1_active_cursor = null

func back_button(event):
	if (p1_color_capture.is_empty() and Global.TRAINING_P1 and p1_button_map == null and (Input.is_action_just_pressed("player1_cancel") or Util.is_action_pressed_player_specific(event, "menu_back_b", true))):
		if (not $P1Cursor.selected):
			go_to_prev_scene()
		else:
			if (p2_assist_select != null and p2_assist_select.is_selected()):
				p2_assist_select.deselect()
				p1_active_cursor = p2_assist_select
				p2_ready = false
			elif ($P2Cursor.enabled and $P2Cursor.selected):
				p2_assist_select.queue_free()
				remove_child(p2_assist_select)
				$A2Portrait.clear_portrait()
				p2_assist_select = null
				p1_active_cursor = $P2Cursor
				$P2Cursor.deselect()
			elif ($P2Cursor.enabled and not $P2Cursor.selected):
				$P2Cursor.enable(false)
				p1_assist_select.deselect()
				p1_active_cursor = p1_assist_select
				p1_ready = false
			else:
				p1_assist_select.queue_free()
				remove_child(p1_assist_select)
				$A1Portrait.clear_portrait()
				p1_assist_select = null
				p1_active_cursor = $P1Cursor
				$P1Cursor.deselect()
	elif (p2_color_capture.is_empty() and (not Global.TRAINING_P1) and p2_button_map == null and (Input.is_action_just_pressed("player2_cancel") or Util.is_action_pressed_player_specific(event, "menu_back_b", false))):
		if (not $P2Cursor.selected):
			go_to_prev_scene()
		else:
			if (p1_assist_select != null and p1_assist_select.is_selected()):
				p1_assist_select.deselect()
				p2_active_cursor = p1_assist_select
				p1_ready = false
			elif ($P1Cursor.enabled and $P1Cursor.selected):
				p1_assist_select.queue_free()
				remove_child(p1_assist_select)
				$A1Portrait.clear_portrait()
				p1_assist_select = null
				p2_active_cursor = $P1Cursor
				$P1Cursor.deselect()
			elif ($P1Cursor.enabled and not $P1Cursor.selected):
				$P1Cursor.enable(false)
				p2_assist_select.deselect()
				p2_active_cursor = p2_assist_select
				p2_ready = false
			else:
				p2_assist_select.queue_free()
				remove_child(p2_assist_select)
				$A2Portrait.clear_portrait()
				p2_assist_select = null
				p2_active_cursor = $P2Cursor
				$P2Cursor.deselect()

func go_to_prev_scene():
	get_tree().change_scene_to_packed(prev_scene_packed)

func go_to_next_scene():
	get_tree().change_scene_to_packed(next_scene_packed)
