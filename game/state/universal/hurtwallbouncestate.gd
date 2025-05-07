extends HurtLaunchState

class_name HurtWallBounceState

const WallBounceSound = preload("res://game/assets/sfx/HitLvl1.wav")

func _init() -> void:
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true, Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 196607, Enums.StKey.Hurt1PosY : -9830400,
			Enums.StKey.Hurt1ScaleX : 995833, Enums.StKey.Hurt1ScaleY : 994631,
			Enums.StKey.Summon : "WallBounceDust",
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.hitStopFrame] = -1
	state[Enums.StKey.leftface] = not state[Enums.StKey.leftface]
	if (state[Enums.StKey.velocity_y] > -SGFixed.ONE*5):
		state[Enums.StKey.velocity_y] = -SGFixed.ONE*5
	SyncManager.play_sound("knockdown", WallBounceSound, {"bus": "Sound"})

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.hitStopFrame] < 0 and state[Enums.StKey.frame] == 1):
		state[Enums.StKey.hitStopFrame] = 10
		state[Enums.StKey.accel_y] = 0
	elif (state[Enums.StKey.hitStopFrame] == 1):
		state[Enums.StKey.accel_y] = Util.JUGGLE_GRAVITY
