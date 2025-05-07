extends SuicopathAttackState

class_name Suicopath5AState

func _init():
	endFrame = 32
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 1572864, Enums.StKey.Hurt1PosY : -10485762,
			Enums.StKey.Hurt1ScaleX : 554342, Enums.StKey.Hurt1ScaleY : -1021119,
			Enums.StKey.Hurt2PosX : 6946816, Enums.StKey.Hurt2PosY : -19005440,
			Enums.StKey.Hurt2ScaleX : 505049, Enums.StKey.Hurt2ScaleY : 482913,
			Enums.StKey.Hurt3PosX : -1048576, Enums.StKey.Hurt3PosY : -23789568,
			Enums.StKey.Hurt3ScaleX : 618677, Enums.StKey.Hurt3ScaleY : -386558,
			},
		13 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit1PosX : 25231360, Enums.StKey.Hit1PosY : -33816576,
			Enums.StKey.Hit1ScaleX : 1257207, Enums.StKey.Hit1ScaleY : 351803,
			Enums.StKey.Hit2PosX : 11665410, Enums.StKey.Hit2PosY : -28114944,
			Enums.StKey.Hit2ScaleX : 1069076, Enums.StKey.Hit2ScaleY : 474809,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 1572864, Enums.StKey.Hurt1PosY : -10485762,
			Enums.StKey.Hurt1ScaleX : 554342, Enums.StKey.Hurt1ScaleY : -1021119,
			Enums.StKey.Hurt2PosX : 6946816, Enums.StKey.Hurt2PosY : -19005440,
			Enums.StKey.Hurt2ScaleX : 505049, Enums.StKey.Hurt2ScaleY : 482913,
			Enums.StKey.Hurt3PosX : -1048576, Enums.StKey.Hurt3PosY : -23789568,
			Enums.StKey.Hurt3ScaleX : 618677, Enums.StKey.Hurt3ScaleY : -386558,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.attack_damage: 52,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*30,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*30,
			Enums.StKey.meter_build: 0,
			Enums.StKey.hitstop: 7,
			Enums.StKey.min_damage:4,
			Enums.StKey.chip_damage:4,
			Enums.StKey.hitstun: 50,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 50,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*10,
			Enums.StKey.counter_launch_dir_y: SGFixed.ONE*50,
			},
		19 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 1572864, Enums.StKey.Hurt1PosY : -10485762,
			Enums.StKey.Hurt1ScaleX : 554342, Enums.StKey.Hurt1ScaleY : -1021119,
			Enums.StKey.Hurt2PosX : 6946816, Enums.StKey.Hurt2PosY : -19005440,
			Enums.StKey.Hurt2ScaleX : 505049, Enums.StKey.Hurt2ScaleY : 482913,
			Enums.StKey.Hurt3PosX : -1048576, Enums.StKey.Hurt3PosY : -23789568,
			Enums.StKey.Hurt3ScaleX : 618677, Enums.StKey.Hurt3ScaleY : -386558,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("Suicopath5A")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N6, state[Enums.StKey.leftface]) and 
				interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "AngelStand6A"
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "AngelCrouch2B"
		elif ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.ADown)):
			state[Enums.StKey.cancelState] = "AngelCrouch2A"
		elif (state[Enums.StKey.distance_to_opponent] <= Util.PROXY_NORMAL and
				interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "AngelStandcB"
		elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
			state[Enums.StKey.cancelState] = "AngelStand5B"
