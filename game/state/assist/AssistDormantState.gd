extends DormantState

class_name AssistDormantState

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			#
			Enums.StKey.Hurt1Disable : true,
			Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hurt3Disable : true,
			Enums.StKey.WarpOffScreen : true,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("Idle")
	state[Enums.StKey.ground_bounce] = 0
	state[Enums.StKey.wall_bounce] = 0
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = 0

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = 0

func handle_input(_state: Dictionary, _interpreter: InputInterpreter) -> void:
	pass

func has_property(_state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.DormantAssist:
			return true
		_:
			return false

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.TagCall):
		tag_cancel(state, interpreter)

func tag_cancel(state: Dictionary, _interpreter: InputInterpreter):
	if (state["tag_grounded"]):
		if (state["tag_attack"] == 0):
			change_state.call("AssistSuper")
		elif (state["tag_attack"] == 10):
			change_state.call("AssistGuardCancelAttack")
		elif (state["tag_attack"] == 11):
			change_state.call("AssistWeakGuardCancelAttack")
		elif (state["tag_attack"] == 12):
			pass # normal burst can't initiate summon
		elif (state["tag_attack"] == 13):
			change_state.call("AssistBurst")
		else:
			change_state.call("AssistAttack")
			if (state["tag_attack"] == 2 or state["tag_attack"] == 1 or state["tag_attack"] == 3):
				change_state.call("AssistAttack2")
	else:
		if (state["tag_attack"] == 0):
			change_state.call("AssistAirSuper")
		elif (state["tag_attack"] == 10):
			change_state.call("AssistAirGuardCancelAttack")
		elif (state["tag_attack"] == 11):
			change_state.call("AssistAirWeakGuardCancelAttack")
		elif (state["tag_attack"] == 12):
			pass # normal burst can't initiate summon
		elif (state["tag_attack"] == 13):
			change_state.call("AssistBurst")
		else:
			change_state.call("AssistAirAttack")
			if (state["tag_attack"] == 2 or state["tag_attack"] == 1 or state["tag_attack"] == 3):
				change_state.call("AssistAirAttack2")
