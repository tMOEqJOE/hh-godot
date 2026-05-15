extends Node2D

const ICON_PATHS: Dictionary = {
	"A": "res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0000.png",
	"B": "res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0001.png",
	"C": "res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0002.png",
	"D": "res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0003.png",

	"Up": "res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0005.png",
	"Right": "res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0007.png",
	"Down": "res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0009.png",
	"Left": "res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0011.png",

	"UpRight": "res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0006.png",
	"DownRight": "res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0008.png",
	"UpLeft": "res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0012.png",
	"DownLeft": "res://game/assets/sprites/UI/MainMenus/MenuTutorials/Input_0010.png",
}

@export var combo_trial: Dictionary = { #Sample Combo
	0: "Stand5A",
	1: "StandcB",
	2: "Crouch3C",
	4: "DUMMY: UpRight",
	5: "DUMMY: Right + A + B airdash",
	6: "Jump2C",
	7: "Jump5B",
	8: "Jump5C",
	9: "Jump2C",
	10: "Jump5B",
	11: "Jump5C",
	12: "Jump2C",
	13: "Jump5B",
	14: "Jump5C",
	15: "Jump2C",
	16: "BionicArm",
	17: "BionicArm",
	18: "DUMMY: Hint: try and airdash as fast as possible!"
}

@export var display_names: Dictionary = {
	"Stand5A": "A",
	"StandcB": "B close",
	"Stand5B": "B",
	"Crouch3C": "DownRight C",
	"Jump2C": "Down C air",
	"Jump5B": "B air",
	"Jump5C": "C air",
	"BionicArm": "Right DownRight Down DownLeft Left Right C",
}

var processed_combo: Array = []
var current_combo_position: int = 0
var current_step_progress: int = 0
var showing_complete_message: bool = false

@onready var combo_list_label: RichTextLabel = $ComboTrialList
var button_icon_size: int = 20


func _ready() -> void:
	combo_list_label.bbcode_enabled = true
	combo_list_label.scroll_active = false
	combo_list_label.fit_content = true
	refresh_combo_ui()


func _process_combo() -> void:
	processed_combo.clear()

	if combo_trial.is_empty():
		return

	var keys = combo_trial.keys()
	keys.sort()

	var i := 0

	while i < keys.size():
		var current_move = combo_trial[keys[i]]
		var count := 1

		while i + count < keys.size() and combo_trial[keys[i + count]] == current_move:
			count += 1

		processed_combo.append({
			"move": current_move,
			"count": count
		})

		i += count


func _skip_dummy_steps() -> void:
	while (
		current_combo_position < processed_combo.size()
		and _is_dummy_step(str(processed_combo[current_combo_position]["move"]))
	):
		current_combo_position += 1
		current_step_progress = 0


func refresh_combo_ui() -> void:
	if showing_complete_message:
		return

	_process_combo()
	_skip_dummy_steps()

	var lines: Array[String] = []
	lines.append("Combo Trial:")

	for idx in range(processed_combo.size()):
		var item = processed_combo[idx]

		var display: String

		if _is_dummy_step(item["move"]):
			display = _dummy_text(item["move"])
		else:
			display = _format_display_text(
				display_names.get(item["move"], item["move"])
			)

		if _is_dummy_step(item["move"]):
			lines.append(display)

		elif idx < current_combo_position:
			if item["count"] > 1:
				var progress_text = "%d/%d" % [item["count"], item["count"]]
				lines.append("[x] " + display + " (" + progress_text + ")")
			else:
				lines.append("[x] " + display)

		elif idx == current_combo_position:
			if item["count"] > 1:
				var progress_text = "%d/%d" % [
					current_step_progress,
					item["count"]
				]

				lines.append("> " + display + " (" + progress_text + ")")
			else:
				lines.append("> " + display)

		else:
			if item["count"] > 1:
				lines.append(
					"[ ] " + display + " (0/" + str(item["count"]) + ")"
				)
			else:
				lines.append("[ ] " + display)

	combo_list_label.text = "\n".join(lines)


func _format_display_text(text: String) -> String:
	var tokens = text.split(" ")
	var parts: Array[String] = []

	for token in tokens:
		if ICON_PATHS.has(token):
			parts.append(_bbcode_icon(token))
		else:
			parts.append(token)

	return " ".join(parts)


func _bbcode_icon(name: String) -> String:
	var path = ICON_PATHS.get(name, "")

	if path == "":
		return name

	return "[img width=%d height=%d]%s[/img]"% [button_icon_size, button_icon_size, path]


func _dummy_text(step: String) -> String:
	var idx := step.find(":")

	var tail := ""

	if idx >= 0:
		tail = step.substr(idx + 1).strip_edges()

	var tokens = tail.split(" ")

	var parts: Array[String] = []

	for token in tokens:
		if ICON_PATHS.has(token):
			parts.append(_bbcode_icon(token))
		else:
			parts.append(token)

	return " ".join(parts)


func _is_dummy_step(step: String) -> bool:
	return step.begins_with("DUMMY:")


func attack_hurt(hitbox_name: String) -> void:
	if showing_complete_message:
		return

	print(hitbox_name)

	_skip_dummy_steps()

	if current_combo_position < processed_combo.size():
		var current_item = processed_combo[current_combo_position]

		if current_item["move"] == hitbox_name:
			current_step_progress += 1

			if current_step_progress >= current_item["count"]:
				current_combo_position += 1
				current_step_progress = 0

				_skip_dummy_steps()

				if current_combo_position >= processed_combo.size():
					showing_complete_message = true

					combo_list_label.text = "Complete!"

					await get_tree().create_timer(1.5).timeout

					showing_complete_message = false

					current_combo_position = 0
					current_step_progress = 0

					refresh_combo_ui()

					return

	refresh_combo_ui()


func drop_combo() -> void:
	if current_combo_position > 0 or current_step_progress > 0:
		print("DROPPED!")

		current_combo_position = 0
		current_step_progress = 0

	refresh_combo_ui()
