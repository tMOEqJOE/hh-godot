extends SGArea2D

class_name HitboxController

@onready var collision_shape = $SGCollisionShape2D

var firstFrameCollide : Dictionary = {}
var entityName: String = "DefaultHitbox"

func _init():
	add_to_group("network_sync")
	add_to_group("hitbox")

func reset_to_game_start():
	Util.reset_node_transform_state(self)
	collision_shape.disabled = true
	sync_to_physics_engine()
	
func _ready():
	$SGCollisionShape2D.visible = false

func setup(team:bool, entityName:String):
	set_mask_bits(team)
	self.entityName = entityName
	
func set_mask_bits(team: bool) -> void:
	if (team):
		self.set_collision_layer_bit(4, true) # 5
#		self.set_collision_mask_bit(5, true) # 6 8 # clash disjoints
		self.set_collision_mask_bit(7, true) # 6 8
	else:
		self.set_collision_layer_bit(5, true)   # 6
#		self.set_collision_mask_bit(4, true) # 5 7 # clash disjoints
		self.set_collision_mask_bit(6, true) # 5 7

func set_projectile_mask_bits(team: bool) -> void:
	self.collision_mask = 0
	self.collision_layer = 0
	if (team):
		self.set_collision_layer_bit(8, true)  # p1 proj. hurt
		self.set_collision_mask_bit(11, true)   # 6
		self.set_collision_mask_bit(7, true)
	else:
		self.set_collision_layer_bit(9, true)  # 
		self.set_collision_mask_bit(10, true)   # 6
		self.set_collision_mask_bit(6, true)

func _save_state() -> Dictionary:
	var state : Dictionary = {
		Enums.StKey.disabled : collision_shape.disabled
	}
	Util.save_hitbox_transform_state(self, state)
	return state

func _load_state(state: Dictionary) -> void:
	Util.load_node_transform_state(self, state)
	collision_shape.disabled = state.get(Enums.StKey.disabled, false)
	sync_to_physics_engine()

func disable(disabled: bool):
	collision_shape.disabled = disabled

func process_collisions() -> void:
	sync_to_physics_engine()
	
	firstFrameCollide = {}
	if (not collision_shape.disabled):
		var overlapping_bodies = get_overlapping_areas()
		if not overlapping_bodies.is_empty():
			for body in overlapping_bodies:
				firstFrameCollide[body.entityName] = 1

func _process(delta):
	update()

func update():
	if (Global.HITBOX_DISPLAY):
		queue_redraw()

func _draw() -> void:
	var opac = 0
	if (not collision_shape.disabled and Global.HITBOX_DISPLAY):
		opac = 0.35
		draw_rect(
			Rect2(
				Vector2(
					SGFixed.to_float(collision_shape.fixed_position.x - collision_shape.shape.extents_x),
					SGFixed.to_float(collision_shape.fixed_position.y - collision_shape.shape.extents_y)
					),
				Vector2(
					SGFixed.to_float(collision_shape.shape.extents_x * 2), 
					SGFixed.to_float(collision_shape.shape.extents_y * 2)
					)
			), 
			Color(0.5, 0.0, 0.0, opac),
			true,
	)
