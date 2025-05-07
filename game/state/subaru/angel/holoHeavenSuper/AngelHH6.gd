extends AngelAttackState

class_name AngelHH6State

func _init():
	endFrame = 25
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -262144, Enums.StKey.Hurt1PosY : -7471104,
			Enums.StKey.Hurt1ScaleX : 522078, Enums.StKey.Hurt1ScaleY : 1436954,
			},
		6 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.burst_OK: false,
			Enums.StKey.Hit1PosX : 8323072, Enums.StKey.Hit1PosY : -11665407,
			Enums.StKey.Hit1ScaleX : 914093, Enums.StKey.Hit1ScaleY : 887995,
			Enums.StKey.attack_type : Enums.AttackType.GroundBouncer,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*25,
			Enums.StKey.launch_dir_y : SGFixed.ONE*40,
			Enums.StKey.attack_damage:0,
			Enums.StKey.min_damage:0,
			Enums.StKey.chip_damage:0,
			Enums.StKey.hitstop: 15,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.meter_build: 0,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*25,
			Enums.StKey.counter_launch_dir_y: SGFixed.ONE*40,
			},
		7 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -262144, Enums.StKey.Hurt1PosY : -7471104,
			Enums.StKey.Hurt1ScaleX : 522078, Enums.StKey.Hurt1ScaleY : 1436954,
		},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("AngelHH6")
	state[Enums.StKey.super_meter] -= Util.MAX_SUPER_METER

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 3):
		state[Enums.StKey.velocity_x] = SGFixed.ONE*30

func meter_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func combo_pushback(comboTime: int) -> int:
	return 0

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "AngelHH7"
		elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "AngelUninstall"
		elif (interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "AngelUninstall"
		elif (interpreter.is_button_down(Enums.InputFlags.DDown)):
			state[Enums.StKey.cancelState] = "AngelUninstall"
func common_idle_transitions(state: Dictionary, interpreter: InputInterpreter) -> void:
	change_state.call("AngelUninstall")
