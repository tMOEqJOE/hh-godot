extends AssistAttackState

class_name AssistGuardCancelAttackState

func _init():
	endFrame = 45
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true, Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : true,
			Enums.StKey.Hit1PosX : 0, Enums.StKey.Hit1PosY : -11337728,
			Enums.StKey.Hit1ScaleX : 686985, Enums.StKey.Hit1ScaleY : 1074037,
			}
	}
func reaction(state: Dictionary, interpreter: InputInterpreter, event_cause: int) -> void:
	if (event_cause == Enums.Reaction.StrikeHurt):
		
		change_state.call("HurtStand")
	elif (event_cause == Enums.Reaction.LaunchHurt):
		
		change_state.call("HurtLaunch")
	elif (event_cause == Enums.Reaction.TagCall):
		tag_cancel(state, interpreter)

func tag_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state["tag_attack"] == 12 or state["tag_attack"] == 13):
		change_state.call("AssistBurst")

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
