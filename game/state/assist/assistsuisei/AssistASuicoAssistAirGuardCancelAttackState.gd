extends AssistASuicoBaseAirAttackState

class_name AssistASuicoAssistAirGuardCancelAttackState

func _init():
	endFrame = 30
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : true,
			},
		11 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hit1PosX : 13893633, Enums.StKey.Hit1PosY : -13107199,
			Enums.StKey.Hit1ScaleX : 1770297, Enums.StKey.Hit1ScaleY : 269438,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -9109504,
			Enums.StKey.Hurt1ScaleX : 1249216, Enums.StKey.Hurt1ScaleY : 870269,
			Enums.StKey.Hurt2PosX : -1572863, Enums.StKey.Hurt2PosY : -18677760,
			Enums.StKey.Hurt2ScaleX : 577283, Enums.StKey.Hurt2ScaleY : 391120,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.guard: Enums.GuardType.Mid,
			Enums.StKey.attack_type : Enums.AttackType.WallBouncer,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*30,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*30,
			Enums.StKey.hitstop: 7,
			Enums.StKey.attack_damage: 0,
			Enums.StKey.min_damage:0,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*20,
			Enums.StKey.counter_launch_dir_y: SGFixed.ONE*50,
			},
		16 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -9109504,
			Enums.StKey.Hurt1ScaleX : 1249216, Enums.StKey.Hurt1ScaleY : 870269,
			Enums.StKey.Hurt2PosX : -1572863, Enums.StKey.Hurt2PosY : -18677760,
			Enums.StKey.Hurt2ScaleX : 577283, Enums.StKey.Hurt2ScaleY : 391120,
			},
	}
# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	state[Enums.StKey.accel_x] = 0
	state[Enums.StKey.cancelState] = ""
	state[Enums.StKey.leftfaceOK] = true
	state[Enums.StKey.hitStopFrame] = -1 # whiff cancel OK
	
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.drag_x] = Util.FRICTION
	state[Enums.StKey.accel_y] = 0
	anim.stop(true)
	anim.play("ASuicoGuardCancel")

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.StrikeHurt):
		change_state.call("ASuicoHurtAir")
	elif (event_cause == Enums.Reaction.LaunchHurt):
		change_state.call("ASuicoHurtLaunch")
	elif (event_cause == Enums.Reaction.GroundLand):
		if (state[Enums.StKey.hitStopFrame] <= 0):
			change_state.call("ASuicoLandAttackRecovery")
	elif (event_cause == Enums.Reaction.TagCall):
		tag_cancel(state, interpreter)

func tag_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state["tag_attack"] == 12 or state["tag_attack"] == 13):
		change_state.call("ASuicoAssistBurst")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
