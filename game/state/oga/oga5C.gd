extends OgaAirAttackState

class_name Oga5CState

func _init():
	endFrame = 60
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 6619136, Enums.StKey.Hurt1PosY : -11665408,
			Enums.StKey.Hurt1ScaleX : 500009, Enums.StKey.Hurt1ScaleY : 345640,
			Enums.StKey.Hurt2PosX : -1835008, Enums.StKey.Hurt2PosY : -24772608,
			Enums.StKey.Hurt2ScaleX : 1028917, Enums.StKey.Hurt2ScaleY : 918540,
			Enums.StKey.Hurt3PosX : 262144, Enums.StKey.Hurt3PosY : -13762562,
			Enums.StKey.Hurt3ScaleX : 755582, Enums.StKey.Hurt3ScaleY : 306604,
			},
		25 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -6815744, Enums.StKey.Hurt1PosY : -30539778,
			Enums.StKey.Hurt1ScaleX : 1324678, Enums.StKey.Hurt1ScaleY : -605995,
			Enums.StKey.Hurt2PosX : 3276800, Enums.StKey.Hurt2PosY : -14090241,
			Enums.StKey.Hurt2ScaleX : 1866963, Enums.StKey.Hurt2ScaleY : -437487,
			Enums.StKey.Hurt3PosX : 1703936, Enums.StKey.Hurt3PosY : -20971522,
			Enums.StKey.Hurt3ScaleX : 1687735, Enums.StKey.Hurt3ScaleY : -405641,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 5963777, Enums.StKey.Hit1PosY : -12189696,
			Enums.StKey.Hit1ScaleX : 1802455, Enums.StKey.Hit1ScaleY : 321218,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 10,
			Enums.StKey.attack_damage: 50,
			Enums.StKey.min_damage: 8,
			},
		50 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -6815744, Enums.StKey.Hurt1PosY : -30539778,
			Enums.StKey.Hurt1ScaleX : 1324678, Enums.StKey.Hurt1ScaleY : -605995,
			Enums.StKey.Hurt2PosX : 3276800, Enums.StKey.Hurt2PosY : -14090241,
			Enums.StKey.Hurt2ScaleX : 1866963, Enums.StKey.Hurt2ScaleY : -437487,
			Enums.StKey.Hurt3PosX : 1703936, Enums.StKey.Hurt3PosY : -20971522,
			Enums.StKey.Hurt3ScaleX : 1687735, Enums.StKey.Hurt3ScaleY : -405641,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("5C")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 0):
		state[Enums.StKey.velocity_x] = Util.fixed_max(SGFixed.ONE * 15, state[Enums.StKey.velocity_x])
		state[Enums.StKey.velocity_y] += -SGFixed.ONE * 43

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (state[Enums.StKey.hitStopFrame] <= 0 and event_cause == Enums.Reaction.GroundLand):
			if (state[Enums.StKey.frame] > 6):
				state[Enums.StKey.doubleJump] = 1
				state[Enums.StKey.airDash] = 1
				state[Enums.StKey.leftfaceOK] = true
				change_state.call("Stand")
	else:
		super.reaction(state, interpreter, event_cause)
