extends SuiseiAirAttackState

class_name SuiseijBState

func _init():
	endFrame = 30

	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -18728636,
			Enums.StKey.Hurt1ScaleX : 1342691, Enums.StKey.Hurt1ScaleY : 1149402,
			},
		6 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false, Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hit1PosX : 7471104, Enums.StKey.Hit1PosY : -19136512,
			Enums.StKey.Hit1ScaleX : 758429, Enums.StKey.Hit1ScaleY : 871353,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -18728636,
			Enums.StKey.Hurt1ScaleX : 1342691, Enums.StKey.Hurt1ScaleY : 1149402,
			Enums.StKey.hit_box_colliding_frame : 3,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.attack_damage: 23,
			Enums.StKey.min_damage: 3,
			Enums.StKey.hitstop: 4,
			Enums.StKey.counter_hit: Enums.AttackType.Strike,
			Enums.StKey.meter_build: SGFixed.ONE*600,
			Enums.StKey.counter_hitstun: 5,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("jB")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (state[Enums.StKey.airDash] > -1 and interpreter.is_air_dashing(true, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "ForwardAirDash"
		elif (state[Enums.StKey.airDash] > -1 and interpreter.is_air_dashing(false, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "BackwardAirDash"
		if (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface])
				and interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "Jump6B"
		elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "Jump5A"
