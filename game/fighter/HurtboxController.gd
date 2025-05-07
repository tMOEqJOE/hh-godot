extends SGArea2D

class_name HurtboxController

@onready var collision_shape = $SGCollisionShape2D

var entityName: String = "DefaultHurtbox"

func _init():
	add_to_group("network_sync")
	add_to_group("hurtbox")

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
		self.set_collision_layer_bit(6, true)  # 7 p1 hurt
		self.set_collision_mask_bit(5, true)   # 6
		self.set_collision_mask_bit(9, true)   # projectile hitbox
	else:
		self.set_collision_layer_bit(7, true)  # 7 p1
		self.set_collision_mask_bit(4, true)   # 6
		self.set_collision_mask_bit(8, true)   # projectile hitbox

func set_projectile_mask_bits(team: bool) -> void:
	self.collision_mask = 0
	self.collision_layer = 0
	if (team):
		self.set_collision_layer_bit(10, true)  # p1 proj. hurt
		self.set_collision_mask_bit(9, true)   # 6
	else:
		self.set_collision_layer_bit(11, true)  # 
		self.set_collision_mask_bit(8, true)   # 6

func set_self_projectile_mask_bits(team: bool) -> void:
	# team hitting 
	self.collision_mask = 0
	self.collision_layer = 0
	set_projectile_mask_bits(team)
	if (team):
		self.set_collision_mask_bit(4, true)   # p1 hitboxes
	else:
		self.set_collision_mask_bit(5, true)   # p2 hitboxes

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

func _network_process(input: Dictionary) -> void:
	sync_to_physics_engine()
	
func disable(disabled: bool):
	collision_shape.disabled = disabled

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
			Color(0.0, 0.5, 0.0, opac),
			true,
		)
