extends OllieChessProjectilePlayer

class_name OllieChargeChessProjectilePlayer

func _ready():
	super._ready()
	dim_sprite()

func dim_sprite():
	$Sprite2D.material.set_shader_parameter("dimming", 0.8)
