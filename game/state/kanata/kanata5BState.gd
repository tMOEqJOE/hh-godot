extends "res://game/state/kanata/mainstates/kanataAttackState.gd"

class_name Kanata5BState

func _init():
	endFrame = 34
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -4849664, Enums.StKey.Hurt1PosY : -9437184,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : 3014656, Enums.StKey.Hurt2PosY : -16187392,
			Enums.StKey.Hurt2ScaleX : 1024561, Enums.StKey.Hurt2ScaleY : -708704,
			Enums.StKey.Hurt3PosX : -5373952, Enums.StKey.Hurt3PosY : -19136512,
			Enums.StKey.Hurt3ScaleX : 1150714, Enums.StKey.Hurt3ScaleY : -810479,
			},
		11 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hit1PosX : 17629186, Enums.StKey.Hit1PosY : -17629184,
			Enums.StKey.Hit1ScaleX : 1421942, Enums.StKey.Hit1ScaleY : 565317,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -4849664, Enums.StKey.Hurt1PosY : -9437184,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : 2162689, Enums.StKey.Hurt2PosY : -20185088,
			Enums.StKey.Hurt2ScaleX : 1024561, Enums.StKey.Hurt2ScaleY : -708704,
			Enums.StKey.Hurt3PosX : 23330816, Enums.StKey.Hurt3PosY : -17170432,
			Enums.StKey.Hurt3ScaleX : 1150714, Enums.StKey.Hurt3ScaleY : -810479,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.attack_damage: 55,
			Enums.StKey.counter_hit: Enums.AttackType.Strike,
			Enums.StKey.hitstop: 9,
			Enums.StKey.counter_hitstun: 5,
			},
		18 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -4849664, Enums.StKey.Hurt1PosY : -9437184,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : 3014656, Enums.StKey.Hurt2PosY : -16187392,
			Enums.StKey.Hurt2ScaleX : 1024561, Enums.StKey.Hurt2ScaleY : -708704,
			Enums.StKey.Hurt3PosX : -5373952, Enums.StKey.Hurt3PosY : -19136512,
			Enums.StKey.Hurt3ScaleX : 1150714, Enums.StKey.Hurt3ScaleY : -810479,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("5B")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 9):
		state[Enums.StKey.velocity_x] = Util.fixed_max(state[Enums.StKey.velocity_x], SGFixed.ONE*20)

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
#		if (interpreter.is_dashing(true, state[Enums.StKey.leftface])):
#			state[Enums.StKey.cancelState] = "Run"
#		elif (interpreter.is_dashing(false, state[Enums.StKey.leftface])):
#			state[Enums.StKey.cancelState] = "BackDash"
		if (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Stand6C"
#		elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
#				interpreter.is_button_down(Enums.InputFlags.ADown)):
#			state[Enums.StKey.cancelState] = "Stand6A"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Crouch3C"
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Crouch2C"
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "Crouch2B"
		elif (interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Stand5C"
