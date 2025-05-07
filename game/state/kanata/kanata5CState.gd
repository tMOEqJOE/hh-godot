extends "res://game/state/kanata/mainstates/kanataAttackState.gd"

class_name Kanata5CState

func _init():
	endFrame = 35
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -1114112, Enums.StKey.Hurt1PosY : -10485760,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : 8126464, Enums.StKey.Hurt2PosY : -18677760,
			Enums.StKey.Hurt2ScaleX : 1024561, Enums.StKey.Hurt2ScaleY : -708704,
			Enums.StKey.Hurt3PosX : -9830400, Enums.StKey.Hurt3PosY : -25100288,
			Enums.StKey.Hurt3ScaleX : 1150714, Enums.StKey.Hurt3ScaleY : -810479,
			},
		12 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit1PosX : 17629186, Enums.StKey.Hit1PosY : -17760254,
			Enums.StKey.Hit1ScaleX : 1226496, Enums.StKey.Hit1ScaleY : 2150290,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 5046272, Enums.StKey.Hurt1PosY : -18939904,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : -262144, Enums.StKey.Hurt2PosY : -30605312,
			Enums.StKey.Hurt2ScaleX : 834792, Enums.StKey.Hurt2ScaleY : -665103,
			Enums.StKey.Hurt3PosX : 18022400, Enums.StKey.Hurt3PosY : -7143424,
			Enums.StKey.Hurt3ScaleX : 1150714, Enums.StKey.Hurt3ScaleY : -810479,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.hitstop : 10,
			Enums.StKey.attack_damage: 70,
			Enums.StKey.block_dir_x : -SGFixed.ONE*30,
			Enums.StKey.block_dir_y : SGFixed.ONE*5,
			Enums.StKey.attack_type : Enums.AttackType.GroundBouncer,
			Enums.StKey.hitstun: 28,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*10,
			Enums.StKey.launch_dir_y : SGFixed.ONE*40,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 110,
			Enums.StKey.min_damage: 5,
			Enums.StKey.counter_launch_dir_x: SGFixed.ONE*10,
			Enums.StKey.counter_launch_dir_y: SGFixed.ONE*75,
			},
		16 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 5046272, Enums.StKey.Hurt1PosY : -18939904,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : -262144, Enums.StKey.Hurt2PosY : -30605312,
			Enums.StKey.Hurt2ScaleX : 834792, Enums.StKey.Hurt2ScaleY : -665103,
			Enums.StKey.Hurt3PosX : 18022400, Enums.StKey.Hurt3PosY : -7143424,
			Enums.StKey.Hurt3ScaleX : 1150714, Enums.StKey.Hurt3ScaleY : -810479,
			},
		32 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 2228224, Enums.StKey.Hurt1PosY : -12386304,
			Enums.StKey.Hurt1ScaleX : 871288, Enums.StKey.Hurt1ScaleY : 1034829,
			Enums.StKey.Hurt2PosX : -4325375, Enums.StKey.Hurt2PosY : -19660800,
			Enums.StKey.Hurt2ScaleX : 834792, Enums.StKey.Hurt2ScaleY : -665103,
			Enums.StKey.Hurt3PosX : 10682368, Enums.StKey.Hurt3PosY : -6422527,
			Enums.StKey.Hurt3ScaleX : 1150714, Enums.StKey.Hurt3ScaleY : -810479,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("5C")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
#		if (interpreter.is_dashing(true, state[Enums.StKey.leftface])):
#			state[Enums.StKey.cancelState] = "Run"
#		elif (interpreter.is_dashing(false, state[Enums.StKey.leftface])):
#			state[Enums.StKey.cancelState] = "BackDash"
		if (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Stand6C"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Crouch3C"
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Crouch2C"
