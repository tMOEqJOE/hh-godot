extends "res://game/state/kanata/mainstates/kanataAirAttackState.gd"

class_name KanataBackAirThrowHitState

func _init():
	endFrame = 300
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -262144, Enums.StKey.Hurt1PosY : -7471104,
			Enums.StKey.Hurt1ScaleX : 522078, Enums.StKey.Hurt1ScaleY : 1436954,
			},
		20 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 2359296, Enums.StKey.Hit1PosY : -12976128,
			Enums.StKey.Hit1ScaleX : 2503512, Enums.StKey.Hit1ScaleY : 2516269,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.burst_OK: false,
			Enums.StKey.launch_dir_x : SGFixed.ONE*30,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*50,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.counter_launch_dir_x: SGFixed.ONE*30,
			Enums.StKey.counter_launch_dir_y: SGFixed.ONE*50,
			Enums.StKey.attack_damage: 20,
			Enums.StKey.hitstun : 120,
			},
		22 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_x] = -SGFixed.ONE*10
	state[Enums.StKey.velocity_y] = -SGFixed.ONE*40
	state[Enums.StKey.accel_y] = Util.GRAVITY
	state[Enums.StKey.sync_rate] += SGFixed.ONE*12
#	state[Enums.StKey.leftface] = not state[Enums.StKey.leftface]
	anim.play("AirThrowHit")

# Writing _delta instead of delta here prevents the unused variable warning.
func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
#	if (state[Enums.StKey.frame] <= 20 and state[Enums.StKey.frame] % 8 == 0):
#		state[Enums.StKey.leftface] = not state[Enums.StKey.leftface]
#		state[Enums.StKey.velocity_x] = -state[Enums.StKey.velocity_x]
	
	if (state[Enums.StKey.frame] == 20):
		state[Enums.StKey.velocity_x] = 0
		state[Enums.StKey.velocity_y] = 0
		state[Enums.StKey.accel_y] = 0
	elif (state[Enums.StKey.frame] == 30):
		state[Enums.StKey.accel_y] = Util.GRAVITY

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func meter_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if (boost_OK(state, interpreter)):
			state[Enums.StKey.cancelState] = "AirBoostCancel"
		elif (assist_ok(state, interpreter)):
			if (interpreter.is_low_blocking(state[Enums.StKey.leftface])):
				state[Enums.StKey.cancelState] = "AirAssistCall2"
			elif (level_1_OK(state) and super_assist_meter_ok(state)  and interpreter.special_input_button(Enums.SpecialInput.M236, Enums.InputFlags.DDown, state[Enums.StKey.leftface])):
				state[Enums.StKey.cancelState] = "AirAssistCallSuper"
			else:
				state[Enums.StKey.cancelState] = "AirAssistCall"

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand and state[Enums.StKey.frame] <= 23):
		pass
	else:
		super.reaction(state, interpreter, event_cause)
