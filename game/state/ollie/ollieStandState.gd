extends "res://game/state/ollie/mainstates/ollieIdleState.gd"

class_name OllieStandState

func _init():
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 845184, Enums.StKey.Hurt1PosY : -11107200,
			Enums.StKey.Hurt1ScaleX : 1091502, Enums.StKey.Hurt1ScaleY : 1088738,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.drag_x] = Util.FRICTION
	anim.play("Idle")
