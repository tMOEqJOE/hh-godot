extends Node2D

@onready var SyncText : Label = $Label # Actual meter remaining

#export var p1_side : bool
#
#func _ready():
#	if (not p1_side):
#		SyncText.scale.x *= -1

func updateUI(currentMeter: int) -> void:
	SyncText.text = str(int(floor(currentMeter / SGFixed.ONE)))
