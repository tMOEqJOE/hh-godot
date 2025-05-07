extends AssistDormantState

class_name OkakoroDormantState

func tag_cancel(state: Dictionary, interpreter: InputInterpreter):
	super.tag_cancel(state, interpreter)
	if (state["tag_grounded"]):
		if (state["tag_attack"] == 2 or state["tag_attack"] == 1 or state["tag_attack"] == 3):
			change_state.call("AssistAttack2")
		
	else:
		if (state["tag_attack"] == 2 or state["tag_attack"] == 1 or state["tag_attack"] == 3):
			change_state.call("AssistAirAttack2")
