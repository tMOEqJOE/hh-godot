extends SuiseiAirIdleState

class_name SuiseiSuperJumpState

const JUMP_SPEED := SGFixed.ONE*-72

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt2PosX : -655360, Enums.StKey.Hurt2PosY : -20219008,
			Enums.StKey.Hurt2ScaleX : 548413, Enums.StKey.Hurt2ScaleY : 1406915,
			},
	}


func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.leftfaceOK] = true
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
