extends FlayonAirAttackState

class_name Flayon3CState

func _init():
	endFrame = 40
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt2PosX : -524288, Enums.StKey.Hurt2PosY : -7471104,
			Enums.StKey.Hurt2ScaleX : 446568, Enums.StKey.Hurt2ScaleY : -774072,
			Enums.StKey.Hurt3PosX : 655360, Enums.StKey.Hurt3PosY : -1835008,
			Enums.StKey.Hurt3ScaleX : 1161459, Enums.StKey.Hurt3ScaleY : -231611,
			},
		12 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hit1PosX : 5629186, Enums.StKey.Hit1PosY : -16760254,
			Enums.StKey.Hit1ScaleX : 1026496, Enums.StKey.Hit1ScaleY : 1050290,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -327680, Enums.StKey.Hurt1PosY : -27787266,
			Enums.StKey.Hurt1ScaleX : 334968, Enums.StKey.Hurt1ScaleY : 357786,
			Enums.StKey.Hurt2PosX : 1179648, Enums.StKey.Hurt2PosY : -16908288,
			Enums.StKey.Hurt2ScaleX : 446568, Enums.StKey.Hurt2ScaleY : -774072,
			Enums.StKey.Hurt3PosX : 327680, Enums.StKey.Hurt3PosY : -5242880,
			Enums.StKey.Hurt3ScaleX : 779030, Enums.StKey.Hurt3ScaleY : -635720,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.hitstun: 25,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*7,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*50,
			Enums.StKey.counter_hit: Enums.AttackType.WallBouncer,
			Enums.StKey.counter_hitstun: 100,
			Enums.StKey.attack_damage: 35,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*5,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*50,
			},
		14 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -327680, Enums.StKey.Hurt1PosY : -27787266,
			Enums.StKey.Hurt1ScaleX : 334968, Enums.StKey.Hurt1ScaleY : 357786,
			Enums.StKey.Hurt2PosX : 1179648, Enums.StKey.Hurt2PosY : -16908288,
			Enums.StKey.Hurt2ScaleX : 446568, Enums.StKey.Hurt2ScaleY : -774072,
			Enums.StKey.Hurt3PosX : 327680, Enums.StKey.Hurt3PosY : -5242880,
			Enums.StKey.Hurt3ScaleX : 779030, Enums.StKey.Hurt3ScaleY : -635720,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("3C")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 10):
		state[Enums.StKey.velocity_y] = -SGFixed.ONE*40
		state[Enums.StKey.velocity_x] = Util.fixed_max(SGFixed.ONE*10, state[Enums.StKey.velocity_x])

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand and state[Enums.StKey.frame] <= 13):
		pass
	else:
		super.reaction(state, interpreter, event_cause)
