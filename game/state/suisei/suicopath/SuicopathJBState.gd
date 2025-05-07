extends SuicopathAirAttackState

class_name SuicopathjBState

func _init():
	endFrame = 40
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -4849664, Enums.StKey.Hurt1PosY : -12058623,
			Enums.StKey.Hurt1ScaleX : 536711, Enums.StKey.Hurt1ScaleY : 244563,
			Enums.StKey.Hurt2PosX : 1310719, Enums.StKey.Hurt2PosY : -19660802,
			Enums.StKey.Hurt2ScaleX : 924253, Enums.StKey.Hurt2ScaleY : -367041,
			Enums.StKey.Hurt3PosX : 5439488, Enums.StKey.Hurt3PosY : -12976129,
			Enums.StKey.Hurt3ScaleX : 1090539, Enums.StKey.Hurt3ScaleY : -321771,
			},
		4 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit1PosX : 1245184, Enums.StKey.Hit1PosY : -11141124,
			Enums.StKey.Hit1ScaleX : 2371656, Enums.StKey.Hit1ScaleY : 446127,
			Enums.StKey.Hit2PosX : 5373952, Enums.StKey.Hit2PosY : -24641534,
			Enums.StKey.Hit2ScaleX : 1674376, Enums.StKey.Hit2ScaleY : 408322,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -13303809, Enums.StKey.Hurt1PosY : -14352385,
			Enums.StKey.Hurt1ScaleX : 880511, Enums.StKey.Hurt1ScaleY : 485238,
			Enums.StKey.Hurt2PosX : 3866624, Enums.StKey.Hurt2PosY : -22937602,
			Enums.StKey.Hurt2ScaleX : 2004285, Enums.StKey.Hurt2ScaleY : 411488,
			Enums.StKey.Hurt3PosX : 8847360, Enums.StKey.Hurt3PosY : -15335424,
			Enums.StKey.Hurt3ScaleX : 897376, Enums.StKey.Hurt3ScaleY : 768208,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.meter_build: 0,
			Enums.StKey.attack_damage: 50,
			Enums.StKey.min_damage: 7,
			Enums.StKey.chip_damage: 7,
			Enums.StKey.counter_hit: Enums.AttackType.Strike,
			Enums.StKey.counter_hitstun: 5,
			},
		38 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -13303809, Enums.StKey.Hurt1PosY : -14352385,
			Enums.StKey.Hurt1ScaleX : 880511, Enums.StKey.Hurt1ScaleY : 485238,
			Enums.StKey.Hurt2PosX : 3866624, Enums.StKey.Hurt2PosY : -22937602,
			Enums.StKey.Hurt2ScaleX : 2004285, Enums.StKey.Hurt2ScaleY : 411488,
			Enums.StKey.Hurt3PosX : 8847360, Enums.StKey.Hurt3PosY : -15335424,
			Enums.StKey.Hurt3ScaleX : 897376, Enums.StKey.Hurt3ScaleY : 768208,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("SuicopathjB")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "AngelJump2B"
		elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "AngelJump5A"
