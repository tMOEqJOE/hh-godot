extends OgaAirAttackState

class_name OgaAirThrowWhiffState

func _init():
	endFrame = 25
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : false,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 3080193, Enums.StKey.Hurt1PosY : -25755648,
			Enums.StKey.Hurt1ScaleX : 1319752, Enums.StKey.Hurt1ScaleY : 585786,
			Enums.StKey.Hurt2PosX : -3473408, Enums.StKey.Hurt2PosY : -14745600,
			Enums.StKey.Hurt2ScaleX : 1473239, Enums.StKey.Hurt2ScaleY : 563361,
			Enums.StKey.Hurt3PosX : 6881280, Enums.StKey.Hurt3PosY : -4390912,
			Enums.StKey.Hurt3ScaleX : 501320, Enums.StKey.Hurt3ScaleY : 476368,
			},
		1 : {
			Enums.StKey.counterOK : false,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 3080193, Enums.StKey.Hurt1PosY : -25755648,
			Enums.StKey.Hurt1ScaleX : 1319752, Enums.StKey.Hurt1ScaleY : 585786,
			Enums.StKey.Hurt2PosX : -3473408, Enums.StKey.Hurt2PosY : -14745600,
			Enums.StKey.Hurt2ScaleX : 1473239, Enums.StKey.Hurt2ScaleY : 563361,
			Enums.StKey.Hurt3PosX : 6881280, Enums.StKey.Hurt3PosY : -4390912,
			Enums.StKey.Hurt3ScaleX : 501320, Enums.StKey.Hurt3ScaleY : 476368,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 0, Enums.StKey.Hit1PosY : -24248320,
			Enums.StKey.Hit1ScaleX : 1082862, Enums.StKey.Hit1ScaleY : 547317,
			Enums.StKey.attack_type : Enums.AttackType.AirThrow,
			Enums.StKey.counter_hit: Enums.AttackType.AirThrow,
			Enums.StKey.burst_OK: false,
			Enums.StKey.launch_dir_x : 0,
			Enums.StKey.launch_dir_y : 0,
			Enums.StKey.counter_launch_dir_x: 0,
			Enums.StKey.counter_launch_dir_y: 0,
			Enums.StKey.hitstun : 30,
			Enums.StKey.hitstop: 0,
			},
		2 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 3080193, Enums.StKey.Hurt1PosY : -25755648,
			Enums.StKey.Hurt1ScaleX : 1319752, Enums.StKey.Hurt1ScaleY : 585786,
			Enums.StKey.Hurt2PosX : -3473408, Enums.StKey.Hurt2PosY : -14745600,
			Enums.StKey.Hurt2ScaleX : 1473239, Enums.StKey.Hurt2ScaleY : 563361,
			Enums.StKey.Hurt3PosX : 6881280, Enums.StKey.Hurt3PosY : -4390912,
			Enums.StKey.Hurt3ScaleX : 501320, Enums.StKey.Hurt3ScaleY : 476368,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("AirThrowWhiff")

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
	
func meter_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (boost_OK(state, interpreter)):
		change_state.call("AirBoostCancel")

func reaction(state: Dictionary, interpreter: InputInterpreter,event_cause: int) -> void:
	super.reaction(state, interpreter, event_cause)
	if (event_cause == Enums.Reaction.ThrowHit):
		change_state.call("AirThrowHit")
