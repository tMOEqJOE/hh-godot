extends Node2D

@export var combo_trial: Dictionary = { #TODO: start with an empty dictionary, load combos when entering a combo trial level?
	0: "Stand5A", #Sample combo
	1: "StandcB",
	2: "Stand5C"
}
var current_combo_index: int = 0

func attack_hurt(hitbox_name: String) -> void: #TODO: connect the eventual UI and make a separate combo trial mode from training
	#print("Hitbox that caused hit: ", hitbox_name)
	if combo_trial.has(current_combo_index):
		if combo_trial[current_combo_index] == hitbox_name:
			print(hitbox_name + " CHECK")
			current_combo_index += 1

			if current_combo_index >= combo_trial.size():
				print("COMPLETE!") #TODO: move to the next combo
				current_combo_index = 0

func drop_combo() -> void:
	if current_combo_index > 0:
		print("DROPPED!")
		current_combo_index = 0
