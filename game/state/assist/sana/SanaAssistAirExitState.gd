extends AssistAirExitState

class_name SanaAssistAirExitState

func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.GroundLand):
		pass
	elif (event_cause == Enums.Reaction.ForceTagOut):
		exit_state()
	else:
		super.reaction(state, interpreter, event_cause)
