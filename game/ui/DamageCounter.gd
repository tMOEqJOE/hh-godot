extends Node2D

var hp_bar: Node

var highest_combo_damage: int

func tick():
	if (hp_bar.get_attack_damage() != 0):
		$AttackDamage.text = "Attack  Damage: "+str(hp_bar.get_attack_damage())
	if (hp_bar.get_combo_damage() != 0):
		$ComboDamage.text = "Combo Damage: "+str(hp_bar.get_combo_damage())
