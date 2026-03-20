extends OkakoroAssistExitState

class_name OkakoroAssistFailState

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("Fail")
