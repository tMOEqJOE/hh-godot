extends AssistAirAttackState

class_name AssistOgaAssistAirAttackState

func _init():
	endFrame = 70
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hit1PosX : 0, Enums.StKey.Hit1PosY : -11337728,
			Enums.StKey.Hit1ScaleX : 86985, Enums.StKey.Hit1ScaleY : 1074037,
			},
		9 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,
			Enums.StKey.hit_box_colliding_frame : 2, 
			Enums.StKey.Hit1PosX : 15859711, Enums.StKey.Hit1PosY : -24510464,
			Enums.StKey.Hit1ScaleX : 957129, Enums.StKey.Hit1ScaleY : 828344,
			Enums.StKey.Hit2PosX : -7208960, Enums.StKey.Hit2PosY : -12386305,
			Enums.StKey.Hit2ScaleX : 710025, Enums.StKey.Hit2ScaleY : 625184,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*10,
			Enums.StKey.launch_dir_y : SGFixed.ONE*25,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_launch_dir_x : -SGFixed.ONE*10,
			Enums.StKey.counter_launch_dir_y : SGFixed.ONE*60,
			Enums.StKey.hitstun: 25,
			Enums.StKey.hitstop: 5,
			Enums.StKey.counter_hitstun: 60,
			Enums.StKey.attack_damage: 30,
			Enums.StKey.min_damage: 5,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	#state[Enums.StKey.drag_x] = Util.FRICTION
	#state[Enums.StKey.accel_y] = Util.GRAVITY
	#state[Enums.StKey.accel_y] = 0
	state[Enums.StKey.drag_x] = 0
	anim.stop(true)
	anim.play("AssistAirAttack")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 3):
		state[Enums.StKey.velocity_x] = 0
		state[Enums.StKey.velocity_y] = 0
	elif (state[Enums.StKey.frame] >= 5):
		state[Enums.StKey.velocity_x] = SGFixed.ONE*15
		state[Enums.StKey.velocity_y] = SGFixed.ONE*30
