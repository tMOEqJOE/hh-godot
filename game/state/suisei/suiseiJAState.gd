extends SuiseiAirAttackState

class_name SuiseijAState

func _init():
	endFrame = 13
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -1769470, Enums.StKey.Hurt1PosY : -18728636,
			Enums.StKey.Hurt1ScaleX : 1042691, Enums.StKey.Hurt1ScaleY : 1149402,
			Enums.StKey.Hurt2PosX : 13828096, Enums.StKey.Hurt2PosY : -16842750,
			Enums.StKey.Hurt2ScaleX : 911373, Enums.StKey.Hurt2ScaleY : 476748,
			},
		3 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true, Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit2PosX : 13631489, Enums.StKey.Hit2PosY : -13665409,
			Enums.StKey.Hit2ScaleX : 1135943, Enums.StKey.Hit2ScaleY : 582434,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -1769470, Enums.StKey.Hurt1PosY : -18728636,
			Enums.StKey.Hurt1ScaleX : 1042691, Enums.StKey.Hurt1ScaleY : 1149402,
			Enums.StKey.Hurt2PosX : 13828096, Enums.StKey.Hurt2PosY : -16842750,
			Enums.StKey.Hurt2ScaleX : 911373, Enums.StKey.Hurt2ScaleY : 476748,
#			Enums.StKey.hitstop: 8,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.attack_damage: 25,
			Enums.StKey.min_damage: 3,
			Enums.StKey.meter_build: SGFixed.ONE*1000,
			Enums.StKey.counter_hit: Enums.AttackType.Strike,
			Enums.StKey.hitstun: Util.DEFAULT_LIGHT_HITSTUN,
			Enums.StKey.blockstun: Util.DEFAULT_LIGHT_BLOCKSTUN,
			},
		8 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -1769470, Enums.StKey.Hurt1PosY : -18728636,
			Enums.StKey.Hurt1ScaleX : 1042691, Enums.StKey.Hurt1ScaleY : 1149402,
			Enums.StKey.Hurt2PosX : 13828096, Enums.StKey.Hurt2PosY : -16842750,
			Enums.StKey.Hurt2ScaleX : 911373, Enums.StKey.Hurt2ScaleY : 476748,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("jA")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (state[Enums.StKey.airDash] > -1 and interpreter.is_air_dashing(true, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "ForwardAirDash"
		elif (state[Enums.StKey.airDash] > -1 and interpreter.is_air_dashing(false, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "BackwardAirDash"
		elif (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface])
				and interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "Jump6B"
		elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "Jump5B"
		elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "Jump5A"
