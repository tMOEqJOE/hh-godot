extends OgaAttackState

class_name OgaRiderKickState

func _init():
	endFrame = 35
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 11206656, Enums.StKey.Hurt1PosY : -23920636,
			Enums.StKey.Hurt1ScaleX : 1475853, Enums.StKey.Hurt1ScaleY : 525360,
			Enums.StKey.Hurt2PosX : -2293760, Enums.StKey.Hurt2PosY : -23068672,
			Enums.StKey.Hurt2ScaleX : 841985, Enums.StKey.Hurt2ScaleY : -836808,
			Enums.StKey.Hurt3PosX : -7602173, Enums.StKey.Hurt3PosY : -10682367,
			Enums.StKey.Hurt3ScaleX : 838252, Enums.StKey.Hurt3ScaleY : 402529,
			},
		8 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 11206656, Enums.StKey.Hurt1PosY : -23920636,
			Enums.StKey.Hurt1ScaleX : 1475853, Enums.StKey.Hurt1ScaleY : 525360,
			Enums.StKey.Hurt2PosX : -2293760, Enums.StKey.Hurt2PosY : -23068672,
			Enums.StKey.Hurt2ScaleX : 841985, Enums.StKey.Hurt2ScaleY : -836808,
			Enums.StKey.Hurt3PosX : -7602173, Enums.StKey.Hurt3PosY : -10682367,
			Enums.StKey.Hurt3ScaleX : 838252, Enums.StKey.Hurt3ScaleY : 402529,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 15859711, Enums.StKey.Hit1PosY : -20510464,
			Enums.StKey.Hit1ScaleX : 957129, Enums.StKey.Hit1ScaleY : 628344,
			Enums.StKey.guard: Enums.GuardType.Mid,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*35,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*50,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.hitstun: 35,
			Enums.StKey.hitstop: 10,
			Enums.StKey.counter_hitstun: 10,
			Enums.StKey.attack_damage: 35,
			Enums.StKey.min_damage: 3,
		},
		25 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 11206656, Enums.StKey.Hurt1PosY : -23920636,
			Enums.StKey.Hurt1ScaleX : 1475853, Enums.StKey.Hurt1ScaleY : 525360,
			Enums.StKey.Hurt2PosX : -2293760, Enums.StKey.Hurt2PosY : -23068672,
			Enums.StKey.Hurt2ScaleX : 841985, Enums.StKey.Hurt2ScaleY : -836808,
			Enums.StKey.Hurt3PosX : -7602173, Enums.StKey.Hurt3PosY : -10682367,
			Enums.StKey.Hurt3ScaleX : 838252, Enums.StKey.Hurt3ScaleY : 402529,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.drag_x] = Util.FRICTION
	state[Enums.StKey.super_meter] += SGFixed.ONE*200
	anim.play("jC")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 7):
		state[Enums.StKey.velocity_x] = Util.fixed_max(SGFixed.ONE*40, state[Enums.StKey.velocity_x])

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
