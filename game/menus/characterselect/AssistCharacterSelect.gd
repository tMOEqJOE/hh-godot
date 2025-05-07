extends Node2D

@onready var cursor = $CharacterCursor

func _ready() -> void:
	cursor.is_assist = true

func setup(is_p1 : bool, input_prefix: bool):
	cursor.is_p1 = is_p1
	if (input_prefix):
		cursor.input_prefix = "player1_"
	else:
		cursor.input_prefix = "player2_"
	if (is_p1):
		$AssistCharacterIcons.scale.x *= -1
		cursor.col = cursor.gridX - 2
		cursor.position.x -= (cursor.portraitOffset.x * 1)

func is_selected():
	return cursor.selected

func cursor_col() -> int:
	return cursor.col

func cursor_row() -> int:
	return cursor.row

func deselect():
	cursor.deselect()

func deselect_ok(ok: bool):
	cursor.deselect_ok = ok

func enable(yes: bool):
	cursor.enable(yes)
