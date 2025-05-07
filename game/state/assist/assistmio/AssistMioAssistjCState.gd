extends AssistAirAttackState

class_name AssistMioAssistjCState

func _init():
	endFrame = 46
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt1PosX : -1300000, Enums.StKey.Hurt1PosY : -17337728,
			Enums.StKey.Hurt1ScaleX : 886985, Enums.StKey.Hurt1ScaleY : 1774037,
			},
		12 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit1PosX : 22675458, Enums.StKey.Hit1PosY : -26148864,
			Enums.StKey.Hit1ScaleX : 1948257, Enums.StKey.Hit1ScaleY : -341914,
			Enums.StKey.Hit2PosX : 13697023, Enums.StKey.Hit2PosY : -25690114,
			Enums.StKey.Hit2ScaleX : 764307, Enums.StKey.Hit2ScaleY : -1575564,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt1PosX : -1300000, Enums.StKey.Hurt1PosY : -17337728,
			Enums.StKey.Hurt1ScaleX : 886985, Enums.StKey.Hurt1ScaleY : 1774037,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*30,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*35,
			Enums.StKey.hitstop: 10,
			Enums.StKey.hitstun : 60,
			Enums.StKey.attack_damage: 40,
			Enums.StKey.min_damage:6,
			Enums.StKey.chip_damage:4,
			Enums.StKey.counter_hit: Enums.AttackType.WallBouncer,
			Enums.StKey.counter_hitstun: 20,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*60,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*40,
			},
		16 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt1PosX : -1300000, Enums.StKey.Hurt1PosY : -17337728,
			Enums.StKey.Hurt1ScaleX : 886985, Enums.StKey.Hurt1ScaleY : 1774037,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.drag_x] = Util.FRICTION
	state[Enums.StKey.accel_y] = 0
	anim.stop(true)
	anim.play("Assist5C")

func exit_state():
	change_state.call("AssistAirAttack")

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.ForceTagOut):
		exit_state()
	else:
		super.reaction(state, interpreter, event_cause)

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.DrainAssistMeter:
			return true
		_:
			return super.has_property(state,property)
