extends OgaAirIdleState

class_name OgaJumpState

const JUMP_SPEED := SGFixed.ONE*-55

func _init():
	anim_data = {
		0 : {
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -8126464, Enums.StKey.Hurt1PosY : -6029311,
			Enums.StKey.Hurt1ScaleX : 498353, Enums.StKey.Hurt1ScaleY : 442051,
			Enums.StKey.Hurt2PosX : -1441792, Enums.StKey.Hurt2PosY : -43384832,
			Enums.StKey.Hurt2ScaleX : 896391, Enums.StKey.Hurt2ScaleY : -1190856,
			Enums.StKey.Hurt3PosX : -2293760, Enums.StKey.Hurt3PosY : -23658496,
			Enums.StKey.Hurt3ScaleX : 519088, Enums.StKey.Hurt3ScaleY : 1416473,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_y] = JUMP_SPEED
	state[Enums.StKey.accel_y] = Util.GRAVITY
	anim.play("Jump")

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	common_jump_transitions_default(state, interpreter)

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.BlockingOK:
			return true
		Enums.StateProperty.GroundThrowOK:
			return false
		_:
			return super.has_property(state,property)
