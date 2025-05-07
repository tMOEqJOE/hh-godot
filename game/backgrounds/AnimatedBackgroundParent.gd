extends ParallaxBackground

@export var animatedBackgroundNames: Array
var nodes:Array

func _ready():
	for name in animatedBackgroundNames:
		nodes.append(get_node(name))

func freeze():
	for node in nodes:
		node.get_node("AnimationPlayer").playback_speed = 0

func unfreeze():
	for node in nodes:
		node.get_node("AnimationPlayer").playback_speed = 1
