extends AssistAirAttackState

class_name AssistMioAssistjBState

func _init():
	endFrame = 35
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true, Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -12337728,
			Enums.StKey.Hurt1ScaleX : 1286985, Enums.StKey.Hurt1ScaleY : 1374037,
			},
		10 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -12337728,
			Enums.StKey.Hurt1ScaleX : 1286985, Enums.StKey.Hurt1ScaleY : 1374037,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.Hit1PosX : 17432576, Enums.StKey.Hit1PosY : -3473408,
			Enums.StKey.Hit1ScaleX : 1260160, Enums.StKey.Hit1ScaleY : 488013,
			Enums.StKey.attack_damage: 30,
			Enums.StKey.min_damage:4,
			Enums.StKey.chip_damage:2,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.guard: Enums.GuardType.Mid, # Goodbye the rare build with the low
			Enums.StKey.launch_dir_x: -SGFixed.ONE*12,
			Enums.StKey.launch_dir_y: -SGFixed.ONE*30,
			Enums.StKey.hitstun: 60,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_hitstun: 60,
			Enums.StKey.counter_launch_dir_x: SGFixed.ONE*5,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*40,
			},
		16 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -12337728,
			Enums.StKey.Hurt1ScaleX : 1286985, Enums.StKey.Hurt1ScaleY : 1374037,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.drag_x] = Util.FRICTION
	state[Enums.StKey.accel_y] = 0
	anim.stop(true)
	anim.play("Assist5B")

func exit_state():
	change_state.call("AssistAirAttack")

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.ForceTagOut):
		exit_state()
	else:
		super.reaction(state, interpreter, event_cause)

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_button_down(Enums.InputFlags.CUp)):
			change_state.call("AssistjC")

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.DrainAssistMeter:
			return true
		_:
			return super.has_property(state,property)
