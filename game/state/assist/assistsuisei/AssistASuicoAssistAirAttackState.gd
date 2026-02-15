extends AssistASuicoBaseAirAttackState

class_name AssistASuicoAssistAirAttackFollowupState

func _init():
	endFrame = 62
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt1PosX : 1703936, Enums.StKey.Hurt1PosY : -21626882,
			Enums.StKey.Hurt1ScaleX : 838229, Enums.StKey.Hurt1ScaleY : 1522967,
			},
		5 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hit1PosX : 1638400, Enums.StKey.Hit1PosY : -31784968,
			Enums.StKey.Hit1ScaleX : 614007, Enums.StKey.Hit1ScaleY : 2173921,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt1PosX : 1703936, Enums.StKey.Hurt1PosY : -21626882,
			Enums.StKey.Hurt1ScaleX : 838229, Enums.StKey.Hurt1ScaleY : 1522967,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.hitstun : 30,
			Enums.StKey.attack_damage: 50,
			Enums.StKey.attack_type : Enums.AttackType.GroundBouncer,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*5,
			Enums.StKey.launch_dir_y : SGFixed.ONE*50,
			Enums.StKey.hitstop: 10,
			Enums.StKey.meter_build: 0,
			Enums.StKey.min_damage: 5,
			Enums.StKey.chip_damage: 5,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 80,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*5,
			Enums.StKey.counter_launch_dir_y: SGFixed.ONE*50,
			},
		12 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt1PosX : 1703936, Enums.StKey.Hurt1PosY : -21626882,
			Enums.StKey.Hurt1ScaleX : 838229, Enums.StKey.Hurt1ScaleY : 1522967,
			},
		20 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hit1PosX : 1638400, Enums.StKey.Hit1PosY : -31784968,
			Enums.StKey.Hit1ScaleX : 614007, Enums.StKey.Hit1ScaleY : 2173921,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt1PosX : 1703936, Enums.StKey.Hurt1PosY : -21626882,
			Enums.StKey.Hurt1ScaleX : 838229, Enums.StKey.Hurt1ScaleY : 1522967,
			Enums.StKey.hit_box_colliding_frame : 5,
			Enums.StKey.hitstun : 80,
			Enums.StKey.attack_damage: 450,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.launch_dir_x : 0,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*30,
			Enums.StKey.hitstop: 3,
			Enums.StKey.meter_build: 0,
			Enums.StKey.min_damage:8,
			Enums.StKey.chip_damage:2,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 100,
			Enums.StKey.counter_launch_dir_x: 0,
			Enums.StKey.counter_launch_dir_y: SGFixed.ONE*40,
			},
		60 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 1703936, Enums.StKey.Hurt1PosY : -21626882,
			Enums.StKey.Hurt1ScaleX : 838229, Enums.StKey.Hurt1ScaleY : 1522967,
			Enums.StKey.Hurt2PosX : -458752, Enums.StKey.Hurt2PosY : -46071808,
			Enums.StKey.Hurt2ScaleX : 992974, Enums.StKey.Hurt2ScaleY : 941760,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.drag_x] = Util.FRICTION
	state[Enums.StKey.accel_y] = 0
	anim.stop(true)
	anim.play("ASuicoAssistAttack")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 0):
		state[Enums.StKey.drag_x] = Util.SLIPPERY_FRICTION
		state[Enums.StKey.velocity_y] = -SGFixed.ONE*20
	elif (state[Enums.StKey.frame] == 4):
		state[Enums.StKey.velocity_x] = SGFixed.ONE*35
		state[Enums.StKey.drag_x] = Util.SLIPPERY_FRICTION
		state[Enums.StKey.velocity_y] = -SGFixed.ONE*60
		state[Enums.StKey.accel_y] = 155536
	elif (state[Enums.StKey.frame] == 16):
		state[Enums.StKey.velocity_x] = 0
		state[Enums.StKey.drag_x] = 0
		state[Enums.StKey.accel_y] = 305536

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand and state[Enums.StKey.frame] >= 13):
		change_state.call("ASuicoAssistAttackFollowup")
	else:
		super.reaction(state, interpreter, event_cause)
