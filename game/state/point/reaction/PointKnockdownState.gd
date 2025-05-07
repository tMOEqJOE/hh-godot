extends KnockdownState

class_name PointKnockdownState

func _init():
	endFrame = 20
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,
			Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -3145729,
			Enums.StKey.Hurt1ScaleX : 1310325, Enums.StKey.Hurt1ScaleY : -514394,
			Enums.StKey.Summon: "knockdowndust",
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.kara_OK] = true

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.StrikeHurt):
		change_state.call("HurtOTG")
	elif (event_cause == Enums.Reaction.BlockHurt):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])):
			change_state.call("CrouchBlock")
		else:
			change_state.call("StandBlock")
	elif (event_cause == Enums.Reaction.JustBlockHurt):
		if (interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])):
			change_state.call("JustCrouchBlock")
		else:
			change_state.call("JustStandBlock")
	elif (event_cause == Enums.Reaction.ThrowHurt):
		change_state.call("HurtThrow")
	elif (event_cause == Enums.Reaction.LaunchHurt):
		change_state.call("HurtOTG")
	elif (event_cause == Enums.Reaction.KOHurt):
		change_state.call("KO")
	elif (event_cause == Enums.Reaction.BurstLockHurt):
		state[Enums.StKey.burst_OK] = false

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.OTG:
			return true
		_:
			return super.has_property(state, property)
