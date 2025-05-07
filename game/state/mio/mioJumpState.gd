extends MioAirIdleState

class_name MioJumpState

const JUMP_SPEED := SGFixed.ONE*-55

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 1310720, Enums.StKey.Hurt1PosY : -19070976,
			Enums.StKey.Hurt1ScaleX : 522078, Enums.StKey.Hurt1ScaleY : 1436954,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_y] = JUMP_SPEED
	state[Enums.StKey.accel_y] = Util.GRAVITY
	anim.play("Jump")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)

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
