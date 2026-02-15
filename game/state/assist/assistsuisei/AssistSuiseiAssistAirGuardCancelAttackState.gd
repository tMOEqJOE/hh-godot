extends AssistAirGuardCancelAttackState

class_name AssistSuiseiAssistAirGuardCancelAttackState

func _init():
	endFrame = 35
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : true,
			},
		11 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hit1PosX : 12058625, Enums.StKey.Hit1PosY : -21889026,
			Enums.StKey.Hit1ScaleX : 1220205, Enums.StKey.Hit1ScaleY : 646265,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : true,
			Enums.StKey.attack_damage: 0,
			Enums.StKey.min_damage: 0,
			Enums.StKey.hit_box_colliding_frame : 254,
			},
		15 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,
			},
		21 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit2Disable : false,
			Enums.StKey.Hit1PosX : 8585215, Enums.StKey.Hit1PosY : -20316160,
			Enums.StKey.Hit1ScaleX : 1220205, Enums.StKey.Hit1ScaleY : 646265,
			Enums.StKey.Hit2PosX : 17235968, Enums.StKey.Hit2PosY : -10354688,
			Enums.StKey.Hit2ScaleX : 1139031, Enums.StKey.Hit2ScaleY : 231125,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,
			Enums.StKey.attack_damage: 0,
			Enums.StKey.min_damage: 0, 
			Enums.StKey.counter_hitstun: 10,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*40,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*35,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_launch_dir_x : -SGFixed.ONE*40,
			Enums.StKey.counter_launch_dir_y : -SGFixed.ONE*25,
			Enums.StKey.hit_box_colliding_frame : 254,
			},
		25 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.drag_x] = Util.FRICTION
	state[Enums.StKey.accel_y] = 0
	anim.stop(true)
	anim.play("GuardCancel")
