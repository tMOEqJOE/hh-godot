extends SuiseiCrouchAttackState

class_name Suisei2BState

func _init():
	endFrame = 32
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 2883584, Enums.StKey.Hurt1PosY : -3276800,
			Enums.StKey.Hurt1ScaleX : 334968, Enums.StKey.Hurt1ScaleY : 357786,
			Enums.StKey.Hurt2PosX : -524288, Enums.StKey.Hurt2PosY : -7471104,
			Enums.StKey.Hurt2ScaleX : 446568, Enums.StKey.Hurt2ScaleY : -774072,
			Enums.StKey.Hurt3PosX : 10747904, Enums.StKey.Hurt3PosY : -3276800,
			Enums.StKey.Hurt3ScaleX : 1263663, Enums.StKey.Hurt3ScaleY : -349887,
			},
		8 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit1PosX : 17104898, Enums.StKey.Hit1PosY : -1376256,
			Enums.StKey.Hit1ScaleX : 470480, Enums.StKey.Hit1ScaleY : 167990,
			Enums.StKey.Hit2PosX : 9633793, Enums.StKey.Hit2PosY : -3014657,
			Enums.StKey.Hit2ScaleX : 711968, Enums.StKey.Hit2ScaleY : 321020,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 2883584, Enums.StKey.Hurt1PosY : -3276800,
			Enums.StKey.Hurt1ScaleX : 334968, Enums.StKey.Hurt1ScaleY : 357786,
			Enums.StKey.Hurt2PosX : -524288, Enums.StKey.Hurt2PosY : -7471104,
			Enums.StKey.Hurt2ScaleX : 446568, Enums.StKey.Hurt2ScaleY : -774072,
			Enums.StKey.Hurt3PosX : 10747904, Enums.StKey.Hurt3PosY : -3276800,
			Enums.StKey.Hurt3ScaleX : 1263663, Enums.StKey.Hurt3ScaleY : -349887,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.guard: Enums.GuardType.Low,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.launch_dir_x: -SGFixed.ONE*12,
			Enums.StKey.launch_dir_y: -SGFixed.ONE*30,
			Enums.StKey.attack_damage: 35,
			Enums.StKey.hitstun: 60,
			Enums.StKey.min_damage:4,
			Enums.StKey.meter_build: SGFixed.ONE*1000,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*5,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*30,
			Enums.StKey.counter_hitstun: 60,
			},
		20 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 2883584, Enums.StKey.Hurt1PosY : -3276800,
			Enums.StKey.Hurt1ScaleX : 334968, Enums.StKey.Hurt1ScaleY : 357786,
			Enums.StKey.Hurt2PosX : -524288, Enums.StKey.Hurt2PosY : -7471104,
			Enums.StKey.Hurt2ScaleX : 446568, Enums.StKey.Hurt2ScaleY : -774072,
			Enums.StKey.Hurt3PosX : 10747904, Enums.StKey.Hurt3PosY : -3276800,
			Enums.StKey.Hurt3ScaleX : 1263663, Enums.StKey.Hurt3ScaleY : -349887,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.drag_x] = Util.FRICTION
	anim.play("2B")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 6):
		state[Enums.StKey.velocity_x] += Util.fixed_max(SGFixed.ONE*35, state[Enums.StKey.velocity_x])

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
