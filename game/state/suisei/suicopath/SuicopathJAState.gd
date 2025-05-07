extends SuicopathAirAttackState

class_name SuicopathjAState

func _init():
	endFrame = 40
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -262144, Enums.StKey.Hurt1PosY : -7471104,
			Enums.StKey.Hurt1ScaleX : 522078, Enums.StKey.Hurt1ScaleY : 1436954,
			},
		5 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit1PosX : 22806528, Enums.StKey.Hit1PosY : -27918336,
			Enums.StKey.Hit1ScaleX : 964499, Enums.StKey.Hit1ScaleY : 530451,
			Enums.StKey.Hit2PosX : 11340032, Enums.StKey.Hit2PosY : -21037058,
			Enums.StKey.Hit2ScaleX : 1400487, Enums.StKey.Hit2ScaleY : 707446,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -3014656, Enums.StKey.Hurt1PosY : -13762562,
			Enums.StKey.Hurt1ScaleX : 536711, Enums.StKey.Hurt1ScaleY : 244563,
			Enums.StKey.Hurt2PosX : 2621439, Enums.StKey.Hurt2PosY : -17825792,
			Enums.StKey.Hurt2ScaleX : 924253, Enums.StKey.Hurt2ScaleY : -367041,
			Enums.StKey.Hurt3PosX : 11337728, Enums.StKey.Hurt3PosY : -11993086,
			Enums.StKey.Hurt3ScaleX : 1090539, Enums.StKey.Hurt3ScaleY : -321771,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.hitstun : 80,
			Enums.StKey.attack_damage: 60,
			Enums.StKey.attack_type : Enums.AttackType.WallBouncer,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*40,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*50,
			Enums.StKey.hitstop: 12,
			Enums.StKey.meter_build: 0,
			Enums.StKey.min_damage:12,
			Enums.StKey.chip_damage:10,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.counter_hit: Enums.AttackType.WallBouncer,
			Enums.StKey.counter_hitstun: 100,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*60,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*70,
			},
		8 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -3014656, Enums.StKey.Hurt1PosY : -13762562,
			Enums.StKey.Hurt1ScaleX : 536711, Enums.StKey.Hurt1ScaleY : 244563,
			Enums.StKey.Hurt2PosX : 2621439, Enums.StKey.Hurt2PosY : -17825792,
			Enums.StKey.Hurt2ScaleX : 924253, Enums.StKey.Hurt2ScaleY : -367041,
			Enums.StKey.Hurt3PosX : 11337728, Enums.StKey.Hurt3PosY : -11993086,
			Enums.StKey.Hurt3ScaleX : 1090539, Enums.StKey.Hurt3ScaleY : -321771,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("SuicopathjA")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
#	if (state[Enums.StKey.frame] == 1):
#		state[Enums.StKey.velocity_x] = SGFixed.ONE*15
#		state[Enums.StKey.velocity_y] = -SGFixed.ONE*20
#		state[Enums.StKey.accel_y] = SGFixed.ONE
#	elif (state[Enums.StKey.frame] == 5):
#		state[Enums.StKey.accel_y] = Util.GRAVITY

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "AngelJump2B"
		elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "AngelJump5B"
