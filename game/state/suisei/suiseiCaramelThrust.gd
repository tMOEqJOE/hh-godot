extends SuiseiAttackState

class_name SuiseiCaramelThrustState

func _init():
	endFrame = 29
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -458752, Enums.StKey.Hurt1PosY : -16842752,
			Enums.StKey.Hurt1ScaleX : 480251, Enums.StKey.Hurt1ScaleY : 1634821,
			Enums.StKey.Hurt2PosX : 1769472, Enums.StKey.Hurt2PosY : -5177345,
			Enums.StKey.Hurt2ScaleX : 670493, Enums.StKey.Hurt2ScaleY : 534448,
			Enums.StKey.Hurt3PosX : -8060928, Enums.StKey.Hurt3PosY : -17956864,
			Enums.StKey.Hurt3ScaleX : 376905, Enums.StKey.Hurt3ScaleY : 376155,
			},
		2 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -458752, Enums.StKey.Hurt1PosY : -16842752,
			Enums.StKey.Hurt1ScaleX : 480251, Enums.StKey.Hurt1ScaleY : 1634821,
			Enums.StKey.Hurt2PosX : 1769472, Enums.StKey.Hurt2PosY : -5177345,
			Enums.StKey.Hurt2ScaleX : 670493, Enums.StKey.Hurt2ScaleY : 534448,
			Enums.StKey.Hurt3PosX : -8060928, Enums.StKey.Hurt3PosY : -17956864,
			Enums.StKey.Hurt3ScaleX : 376905, Enums.StKey.Hurt3ScaleY : 376155,
			Enums.StKey.Summon: "rundust",
			},
		5 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.Hit1PosX : 14240576, Enums.StKey.Hit1PosY : -17595266,
			Enums.StKey.Hit1ScaleX : 1278530, Enums.StKey.Hit1ScaleY : 675360,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -458752, Enums.StKey.Hurt1PosY : -16842752,
			Enums.StKey.Hurt1ScaleX : 480251, Enums.StKey.Hurt1ScaleY : 1634821,
			Enums.StKey.Hurt2PosX : 1769472, Enums.StKey.Hurt2PosY : -5177345,
			Enums.StKey.Hurt2ScaleX : 670493, Enums.StKey.Hurt2ScaleY : 534448,
			Enums.StKey.Hurt3PosX : -8060928, Enums.StKey.Hurt3PosY : -17956864,
			Enums.StKey.Hurt3ScaleX : 376905, Enums.StKey.Hurt3ScaleY : 376155,
			Enums.StKey.attack_type : Enums.AttackType.Strike,
			Enums.StKey.guard: Enums.GuardType.Mid,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*35,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*30,
			Enums.StKey.chip_damage: 3,
			Enums.StKey.min_damage:7,
			Enums.StKey.attack_damage: 20,
			Enums.StKey.hitstun: 27,
			Enums.StKey.blockstun: Util.DEFAULT_BLOCKSTUN-3,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 90,
			Enums.StKey.meter_build: SGFixed.ONE*1000,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*25,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*30,
			},
		12 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -458752, Enums.StKey.Hurt1PosY : -16842752,
			Enums.StKey.Hurt1ScaleX : 480251, Enums.StKey.Hurt1ScaleY : 1634821,
			Enums.StKey.Hurt2PosX : 1769472, Enums.StKey.Hurt2PosY : -5177345,
			Enums.StKey.Hurt2ScaleX : 670493, Enums.StKey.Hurt2ScaleY : 534448,
			Enums.StKey.Hurt3PosX : 14240576, Enums.StKey.Hurt3PosY : -17595266,
			Enums.StKey.Hurt3ScaleX : 1278530, Enums.StKey.Hurt3ScaleY : 675360,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("Thrust")
	state[Enums.StKey.super_meter] += SGFixed.ONE*200

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 2):
		state[Enums.StKey.velocity_x] = Util.fixed_max(SGFixed.ONE*55, state[Enums.StKey.velocity_x])
	elif (state[Enums.StKey.frame] == 9):
		state[Enums.StKey.drag_x] = Util.HYPER_FRICTION

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.velocity_x] = SGFixed.mul(state[Enums.StKey.velocity_x], 55536)
			state[Enums.StKey.cancelState] = "AngelInstall"
