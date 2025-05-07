extends "res://game/state/ollie/mainstates/ollieAttackState.gd"

class_name OllieChargeRookState

func _init():
	endFrame = 33
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 65536, Enums.StKey.Hurt1PosY : -15597568,
			Enums.StKey.Hurt1ScaleX : 638999, Enums.StKey.Hurt1ScaleY : 1587430,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("ChessCharge")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 3):
		state[Enums.StKey.hitStopFrame] = 0

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	super.handle_input(state, interpreter)
	if (state[Enums.StKey.frame] == endFrame - 1):
		change_state.call("ChessAChargeThrow")
	if (not interpreter.is_button_down(Enums.InputFlags.AHold)):
		change_state.call("ChessAThrow")

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
