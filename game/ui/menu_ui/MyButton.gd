extends Button
class_name MyButton

enum ButtonType {
	OK,
	CANCEL,
}
@export var button_type := ButtonType.OK

var focus: ControlFocusComponent

func _ready() -> void:
	focus = ControlFocusComponent.new()
	add_child(focus)
	
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	pass
	#Sounds.play("Select" if button_type == OK else "Back")
