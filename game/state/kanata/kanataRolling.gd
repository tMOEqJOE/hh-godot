extends "res://game/state/kanata/mainstates/kanataAttackState.gd"

class_name KanataRollingState

func _init():
	endFrame = 30
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
	anim.play("DodgeRoll")


func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] >= 2):
		state[Enums.StKey.hitStopFrame] = 0
		state[Enums.StKey.drag_x] = Util.ICE_FRICTION
	else:
		state[Enums.StKey.velocity_x] = Util.fixed_max(SGFixed.ONE*25, state[Enums.StKey.velocity_x])

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	var next_state = self.persistent_state.state_factory.special_cancel(state, interpreter)
	if (next_state != "" and next_state != "KanataRolling"):
		state[Enums.StKey.cancelState] = next_state
