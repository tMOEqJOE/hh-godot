extends Node2D

@onready var FullHP : TextureProgressBar = $FullHP # Actual yellow HP remaining
@onready var AttackHP : TextureProgressBar = $AttackHP # The HP that the last attack took off
@onready var ComboHP : TextureProgressBar = $ComboHPAndEmpty # The total HP dealt from the current combo

const maxHP : int = Util.MAX_HP

var currentHP : int
var comboHP : int
var attackDamageHP: int
var enabled: bool

enum State {
	currentHP,
	comboHP,
	attackDamageHP,
	enabled,
}

signal ko ()

func _ready():
	add_to_group("network_sync")
	FullHP.max_value = maxHP
	AttackHP.max_value = maxHP
	ComboHP.max_value = maxHP
	reset_hp()

func _save_state() -> Dictionary:
	var state : Dictionary = {
		State.currentHP : currentHP,
		State.comboHP : comboHP,
		State.attackDamageHP : attackDamageHP,
		State.enabled : enabled,
	}
	return state

func _load_state(state: Dictionary) -> void:
	currentHP = state[State.currentHP]
	comboHP = state[State.comboHP]
	attackDamageHP = state[State.attackDamageHP]
	enabled = state[State.enabled]

func register_attack(damage: int, hitCount: int, invalid: bool, block: bool, guard:int) -> void:
	if (enabled):
		attackDamageHP = currentHP
		currentHP -= damage
		updateUI()
		if (currentHP <= 0):
			emit_signal("ko")

func drop_combo() -> void:
	attackDamageHP = currentHP
	comboHP = currentHP
	updateUI()

func reset_hp() -> void:
	currentHP = maxHP
	comboHP = maxHP
	attackDamageHP = maxHP
	enabled = true
	updateUI()

func disable_hp() -> void:
	enabled = false

func updateUI() -> void:
	FullHP.value = currentHP
	ComboHP.value = comboHP
	AttackHP.value = attackDamageHP

func get_combo_damage() -> int:
	return comboHP - currentHP

func get_attack_damage() -> int:
	return attackDamageHP - currentHP

func reset_to_game_start() -> void:
	reset_hp()
