extends AngelAirIdleState

class_name AngelMidAirPreJumpState

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -393216, Enums.StKey.Hurt1PosY : -16449537,
			Enums.StKey.Hurt1ScaleX : 536711, Enums.StKey.Hurt1ScaleY : 244563,
			Enums.StKey.Hurt2PosX : -262142, Enums.StKey.Hurt2PosY : -3014656,
			Enums.StKey.Hurt2ScaleX : 924253, Enums.StKey.Hurt2ScaleY : -367041,
			Enums.StKey.Hurt3PosX : -458752, Enums.StKey.Hurt3PosY : -9568257,
			Enums.StKey.Hurt3ScaleX : 608053, Enums.StKey.Hurt3ScaleY : -670102,
			},
	}
	endFrame = 3  # endFrame + 1 = X frame jump squat

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.doubleJump] -= 1
	anim.play("AngelPreJump")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	anim.play()

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == endFrame):
		state[Enums.StKey.velocity_x] = SGFixed.mul(state[Enums.StKey.velocity_x], 18768)
		change_state.call("AngelMidAirJump")
