extends Node2D

var hp_bar: Node

var highest_combo_damage: int

func tick():
	if (hp_bar.get_attack_damage() != 0):
		if hp_bar.get_attack_damage_scaling() > 0:
			$AttackDamage.text = tr("UI_LABEL_ATTACK_DAMAGE")+" "+str(hp_bar.get_attack_damage())+" (x"+("%.2f" % hp_bar.get_attack_damage_scaling())+")"
		else:
			$AttackDamage.text = tr("UI_LABEL_ATTACK_DAMAGE")+" "+str(hp_bar.get_attack_damage())+" (--)"
	if (hp_bar.get_combo_damage() != 0):
		if hp_bar.get_combo_damage() > highest_combo_damage:
			highest_combo_damage = hp_bar.get_combo_damage()
		$ComboDamage.text = tr("UI_LABEL_COMBO_DAMAGE")+" "+str(hp_bar.get_combo_damage())+" ("+str(highest_combo_damage)+")"
