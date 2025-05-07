extends HurtAirState

class_name KOState

func _init():
	endFrame = 180
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			#
			Enums.StKey.Hurt1Disable : true,
			Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt3Disable : true,
			# Enums.StKey.Hit1PosX : 2025, Enums.StKey.Hit1PosY : -13828096,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	state[Enums.StKey.cancelState] = ""
	state[Enums.StKey.drag_x] = 0
	state[Enums.StKey.comboTime] = 2
	state[Enums.StKey.accel_y] = Util.JUGGLE_GRAVITY
	state[Enums.StKey.accel_x] = 0
#	state[Enums.StKey.hitStopFrame] = 10
	anim.speed_scale = 1
	anim.play("KO")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
