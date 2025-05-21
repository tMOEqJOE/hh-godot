extends "res://game/state/ollie/mainstates/ollieAttackState.gd"

class_name Ollie6CState

func _init():
	endFrame = 26
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 5111808, Enums.StKey.Hurt1PosY : -8257536,
			Enums.StKey.Hurt1ScaleX : 660841, Enums.StKey.Hurt1ScaleY : -873729,
			Enums.StKey.Hurt2PosX : -1900544, Enums.StKey.Hurt2PosY : -10944513,
			Enums.StKey.Hurt2ScaleX : 792031, Enums.StKey.Hurt2ScaleY : 1034044,
			Enums.StKey.Hurt3PosX : -2555903, Enums.StKey.Hurt3PosY : -20119552,
			Enums.StKey.Hurt3ScaleX : 786415, Enums.StKey.Hurt3ScaleY : 697920,
			},
		22 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit2PosX : 30408704, Enums.StKey.Hit2PosY : -14483458,
			Enums.StKey.Hit2ScaleX : 2245719, Enums.StKey.Hit2ScaleY : 485893,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 5111808, Enums.StKey.Hurt1PosY : -8257536,
			Enums.StKey.Hurt1ScaleX : 660841, Enums.StKey.Hurt1ScaleY : -873729,
			Enums.StKey.Hurt2PosX : -1900544, Enums.StKey.Hurt2PosY : -10944513,
			Enums.StKey.Hurt2ScaleX : 792031, Enums.StKey.Hurt2ScaleY : 1034044,
			Enums.StKey.Hurt3PosX : 28377090, Enums.StKey.Hurt3PosY : -13762560,
			Enums.StKey.Hurt3ScaleX : 2590456, Enums.StKey.Hurt3ScaleY : 727814,
			Enums.StKey.hit_box_colliding_frame : 3,
			Enums.StKey.attack_damage: 20,
			Enums.StKey.hitstop: 2,
			Enums.StKey.min_damage:1,
			Enums.StKey.chip_damage:2,
			Enums.StKey.meter_build: SGFixed.ONE*250,
			Enums.StKey.counter_hit: Enums.AttackType.Strike,
			Enums.StKey.counter_hitstun: 30,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("6C")
#	state[Enums.StKey.super_meter] += SGFixed.ONE*200

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == 20):
		anim.play("6CLoop")
		state[Enums.StKey.velocity_x] += SGFixed.ONE*35
	if (state[Enums.StKey.frame] == endFrame - 2):
		state[Enums.StKey.frame] = 22
	if (not interpreter.is_button_down(Enums.InputFlags.CHold)):
		change_state.call("Stand6CRelease")
	super.handle_input(state, interpreter)

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
