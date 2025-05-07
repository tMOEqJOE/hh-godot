extends Node2D

var hp_bar: Node

var last_combo_damage: int
var highest_combo_damage: int

func tick():
	$AttackDamage.text = "Attack  Damage: "+str(hp_bar.get_attack_damage())
	$ComboDamage.text = "Combo Damage: "+str(hp_bar.get_combo_damage())
