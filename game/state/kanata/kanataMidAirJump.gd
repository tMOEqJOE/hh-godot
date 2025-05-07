extends "res://game/state/kanata/kanataJump.gd"

class_name KanataMidAirJumpState

const MID_AIR_JUMP_SPEED := SGFixed.ONE*-52

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_y] = MID_AIR_JUMP_SPEED
	state[Enums.StKey.leftfaceOK] = true

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
