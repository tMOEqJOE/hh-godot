extends AssistAirAttackState

class_name AssistOgaFastFallState

func _init():
	endFrame = 60
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,
			},
		8 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.Hit1PosX : 6684672, Enums.StKey.Hit1PosY : -11403264,
			Enums.StKey.Hit1ScaleX : 412565, Enums.StKey.Hit1ScaleY : 1285086,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*10,
			Enums.StKey.launch_dir_y : SGFixed.ONE*20,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_launch_dir_x : -SGFixed.ONE*10,
			Enums.StKey.counter_launch_dir_y : SGFixed.ONE*60,
			Enums.StKey.hitstun: 40,
			Enums.StKey.hitstop: 10,
			Enums.StKey.counter_hitstun: 60,
			Enums.StKey.attack_damage: 50,
			Enums.StKey.min_damage: 16,
			},
		59 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.drag_x] = 0
	state[Enums.StKey.accel_y] = Util.GRAVITY
	anim.stop(true)
	anim.play("BackAirDash")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 2):
		state[Enums.StKey.velocity_y] = SGFixed.ONE*50
		state[Enums.StKey.velocity_x] = SGFixed.ONE*30

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand):
#		if (state[Enums.StKey.frame] > 8 and state[Enums.StKey.hitStopFrame] <= 0):
		change_state.call("LandAttackRecovery")
	else:
		super.reaction(state, interpreter, event_cause)
