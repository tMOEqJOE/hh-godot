extends SuiseiAirAttackState

class_name Suiseij6BState

func _init():
	endFrame = 38
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 720896, Enums.StKey.Hurt1PosY : -17039362,
			Enums.StKey.Hurt1ScaleX : 495960, Enums.StKey.Hurt1ScaleY : 1224519,
			Enums.StKey.Hurt2PosX : -1507328, Enums.StKey.Hurt2PosY : -22609920,
			Enums.StKey.Hurt2ScaleX : 670493, Enums.StKey.Hurt2ScaleY : 534448,
			Enums.StKey.Hurt3PosX : 5832703, Enums.StKey.Hurt3PosY : -4784128,
			Enums.StKey.Hurt3ScaleX : 382637, Enums.StKey.Hurt3ScaleY : 365464,
			},
		9 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit1PosX : 14286850, Enums.StKey.Hit1PosY : -22478848,
			Enums.StKey.Hit1ScaleX : 629179, Enums.StKey.Hit1ScaleY : 1336735,
			Enums.StKey.Hit2PosX : 11862016, Enums.StKey.Hit2PosY : -22282240,
			Enums.StKey.Hit2ScaleX : 1220205, Enums.StKey.Hit2ScaleY : 646265,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 720896, Enums.StKey.Hurt1PosY : -17039362,
			Enums.StKey.Hurt1ScaleX : 495960, Enums.StKey.Hurt1ScaleY : 1224519,
			Enums.StKey.Hurt2PosX : -1507328, Enums.StKey.Hurt2PosY : -22609920,
			Enums.StKey.Hurt2ScaleX : 670493, Enums.StKey.Hurt2ScaleY : 534448,
			Enums.StKey.Hurt3PosX : 5832703, Enums.StKey.Hurt3PosY : -4784128,
			Enums.StKey.Hurt3ScaleX : 382637, Enums.StKey.Hurt3ScaleY : 365464,
			Enums.StKey.hitstop: 9,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.hitstun: 30,
			Enums.StKey.attack_damage: 32,
			Enums.StKey.meter_build: SGFixed.ONE*1200,
			Enums.StKey.attack_type : Enums.AttackType.WallBouncer,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*20,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*50,
			Enums.StKey.min_damage:4,
			Enums.StKey.chip_damage:3,
			Enums.StKey.counter_hit: Enums.AttackType.WallBouncer,
			Enums.StKey.counter_hitstun: 100,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*5,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*40,
			},
		13 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 720896, Enums.StKey.Hurt1PosY : -17039362,
			Enums.StKey.Hurt1ScaleX : 495960, Enums.StKey.Hurt1ScaleY : 1224519,
			Enums.StKey.Hurt2PosX : -1507328, Enums.StKey.Hurt2PosY : -22609920,
			Enums.StKey.Hurt2ScaleX : 670493, Enums.StKey.Hurt2ScaleY : 534448,
			Enums.StKey.Hurt3PosX : 5832703, Enums.StKey.Hurt3PosY : -4784128,
			Enums.StKey.Hurt3ScaleX : 382637, Enums.StKey.Hurt3ScaleY : 365464,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("j6B")

# Writing _delta instead of delta here prevents the unused variable warning.
func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 10):
		state[Enums.StKey.velocity_x] = -SGFixed.ONE*15
		state[Enums.StKey.velocity_y] = -SGFixed.ONE*5

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (state[Enums.StKey.airDash] > -1 and interpreter.is_air_dashing(true, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "ForwardAirDash"
		elif (state[Enums.StKey.airDash] > -1 and interpreter.is_air_dashing(false, state[Enums.StKey.leftface])):
			state[Enums.StKey.cancelState] = "BackwardAirDash"
