extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.connect("animation_finished", Callable(self, "transition"))
	$AnimationPlayer.play("Intro")

func transition(anim_name: String):
	$AnimationPlayer.play("Idle")

func p1_call():
	$AnimationPlayer.play("P1Call")

func p2_call():
	$AnimationPlayer.play("P2Call")

func match_start():
	$AnimationPlayer.stop()
	$AnimationPlayer.play("MatchStart")
