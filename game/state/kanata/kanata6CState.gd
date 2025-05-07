extends "res://game/state/kanata/mainstates/kanataAttackState.gd"

class_name Kanata6CState

func _init():
	endFrame = 30
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -10551299, Enums.StKey.Hurt1PosY : -9895937,
			Enums.StKey.Hurt1ScaleX : 478735, Enums.StKey.Hurt1ScaleY : 989118,
			Enums.StKey.Hurt2PosX : -720897, Enums.StKey.Hurt2PosY : -15990784,
			Enums.StKey.Hurt2ScaleX : 964115, Enums.StKey.Hurt2ScaleY : 370909,
			Enums.StKey.Hurt3PosX : -6291457, Enums.StKey.Hurt3PosY : -24576000,
			Enums.StKey.Hurt3ScaleX : 497627, Enums.StKey.Hurt3ScaleY : 523538,
			},
		10 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit2PosX : 13565953, Enums.StKey.Hit2PosY : -5308416,
			Enums.StKey.Hit2ScaleX : 1089113, Enums.StKey.Hit2ScaleY : 604316,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -10551299, Enums.StKey.Hurt1PosY : -9895937,
			Enums.StKey.Hurt1ScaleX : 478735, Enums.StKey.Hurt1ScaleY : 989118,
			Enums.StKey.Hurt2PosX : -720897, Enums.StKey.Hurt2PosY : -15990784,
			Enums.StKey.Hurt2ScaleX : 964115, Enums.StKey.Hurt2ScaleY : 370909,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.hitstop: 12,
			Enums.StKey.attack_damage: 60,
			Enums.StKey.min_damage:2,
			Enums.StKey.chip_damage:10,
			Enums.StKey.counter_hit: Enums.AttackType.Strike,
			Enums.StKey.counter_hitstun: 10,
			},
		13 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 327680, Enums.StKey.Hurt1PosY : -8978430,
			Enums.StKey.Hurt1ScaleX : 803537, Enums.StKey.Hurt1ScaleY : 971143,
			Enums.StKey.Hurt2PosX : 8912898, Enums.StKey.Hurt2PosY : -4915198,
			Enums.StKey.Hurt2ScaleX : 497627, Enums.StKey.Hurt2ScaleY : 523538,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("6C")
	state[Enums.StKey.super_meter] += SGFixed.ONE*200

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 5):
		state[Enums.StKey.velocity_x] = Util.fixed_max(state[Enums.StKey.velocity_x], SGFixed.ONE*10)

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
#		if (interpreter.is_dashing(true, state[Enums.StKey.leftface])):
#			state[Enums.StKey.cancelState] = "Run"
#		elif (interpreter.is_dashing(false, state[Enums.StKey.leftface])):
#				state[Enums.StKey.cancelState] = "BackDash"
		if (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Stand6C"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Crouch3C"
		
