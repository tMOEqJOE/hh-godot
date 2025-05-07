extends SuicopathAttackState

class_name Suicopath5BState

func _init():
	endFrame = 27
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -7798784, Enums.StKey.Hurt1PosY : -14614527,
			Enums.StKey.Hurt1ScaleX : 794862, Enums.StKey.Hurt1ScaleY : 1033487,
			Enums.StKey.Hurt2PosX : -1179648, Enums.StKey.Hurt2PosY : -3473408,
			Enums.StKey.Hurt2ScaleX : 1490095, Enums.StKey.Hurt2ScaleY : 390990,
			Enums.StKey.Hurt3PosX : -18219008, Enums.StKey.Hurt3PosY : -25559040,
			Enums.StKey.Hurt3ScaleX : 464067, Enums.StKey.Hurt3ScaleY : 550893,
			},
		6 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -7798784, Enums.StKey.Hurt1PosY : -14614527,
			Enums.StKey.Hurt1ScaleX : 794862, Enums.StKey.Hurt1ScaleY : 1033487,
			Enums.StKey.Hurt2PosX : -1179648, Enums.StKey.Hurt2PosY : -3473408,
			Enums.StKey.Hurt2ScaleX : 1490095, Enums.StKey.Hurt2ScaleY : 390990,
			Enums.StKey.Hurt3PosX : -18219008, Enums.StKey.Hurt3PosY : -25559040,
			Enums.StKey.Hurt3ScaleX : 464067, Enums.StKey.Hurt3ScaleY : 550893,
			},
		10 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit1PosX : 27983874, Enums.StKey.Hit1PosY : -19922944,
			Enums.StKey.Hit1ScaleX : 999253, Enums.StKey.Hit1ScaleY : 847327,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -1376256, Enums.StKey.Hurt1PosY : -14811135,
			Enums.StKey.Hurt1ScaleX : 884610, Enums.StKey.Hurt1ScaleY : 743338,
			Enums.StKey.Hurt2PosX : -1179648, Enums.StKey.Hurt2PosY : -3473408,
			Enums.StKey.Hurt2ScaleX : 1490095, Enums.StKey.Hurt2ScaleY : 390990,
			Enums.StKey.Hurt3PosX : 13172736, Enums.StKey.Hurt3PosY : -18808832,
			Enums.StKey.Hurt3ScaleX : 1553629, Enums.StKey.Hurt3ScaleY : 490154,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.attack_damage: 52,
			Enums.StKey.meter_build: 0,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.launch_dir_x : -SGFixed.ONE,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*20,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_launch_dir_x : -SGFixed.ONE,
			Enums.StKey.counter_launch_dir_y : -SGFixed.ONE*20,
			Enums.StKey.hitstun: 25,
			Enums.StKey.counter_hitstun: 3,
			},
		13 : { 
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -1376256, Enums.StKey.Hurt1PosY : -14811135,
			Enums.StKey.Hurt1ScaleX : 884610, Enums.StKey.Hurt1ScaleY : 743338,
			Enums.StKey.Hurt2PosX : -1179648, Enums.StKey.Hurt2PosY : -3473408,
			Enums.StKey.Hurt2ScaleX : 1490095, Enums.StKey.Hurt2ScaleY : 390990,
			Enums.StKey.Hurt3PosX : 17629184, Enums.StKey.Hurt3PosY : -18808832,
			Enums.StKey.Hurt3ScaleX : 1902764, Enums.StKey.Hurt3ScaleY : 490154,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("SuicopathSlap")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "AngelStand6A"
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "AngelCrouch2B"
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "AngelCrouch2A"
		elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "AngelStand5A"
