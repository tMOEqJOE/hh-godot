extends "res://game/state/kanata/mainstates/kanataAirAttackState.gd"

class_name KanataAirRollingState

func _init():
	endFrame = 35
	anim_data = {
		0 : {
			Enums.StKey.counterOK: true,
			Enums.StKey.Summon : "rundust",
			Enums.StKey.Hit1Disable : true, Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true, Enums.StKey.Hurt2Disable : true, Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -3145729,
			Enums.StKey.Hurt1ScaleX : 1310325, Enums.StKey.Hurt1ScaleY : 714394,
		},
		10 : {
			Enums.StKey.counterOK: true, 
			Enums.StKey.Hit1Disable : true, Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true, Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -3145729,
			Enums.StKey.Hurt1ScaleX : 1310325, Enums.StKey.Hurt1ScaleY : 714394,
		},
	}
	
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.accel_y] = 0
	state[Enums.StKey.velocity_y] = 0
	anim.play("DodgeRoll")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] >= 2):
		state[Enums.StKey.hitStopFrame] = 0
		state[Enums.StKey.drag_x] = Util.ICE_FRICTION
	else:
		state[Enums.StKey.velocity_x] = Util.fixed_max(SGFixed.ONE*20, state[Enums.StKey.velocity_x])
	
	if (state[Enums.StKey.frame] == 30):
		state[Enums.StKey.accel_y] = Util.KANATA_GRAVITY
	
func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	var next_state = self.persistent_state.state_factory.air_special_cancel(state, interpreter)
	if (next_state != "" and next_state != "AirKanataRolling"):
		state[Enums.StKey.cancelState] = next_state
