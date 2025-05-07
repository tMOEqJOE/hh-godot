class_name StateFactory

var states : Dictionary
var states_instance : Dictionary

func _init():
	states = {
		"Neutral": NeutralState,
		"HurtStand": HurtGroundState,
		"HurtCrouch": HurtCrouchState,
		"HurtAir": HurtAirState,
		"HurtThrow": AirThrowHurtState,
		"HurtAirThrow": AirThrowHurtState,
		"HurtLaunch": HurtLaunchState,
		"GroundBounce": HurtGroundBounceState,
		"WallBounce": HurtWallBounceState,
		"Knockdown": KnockdownState,
		"Wakeup": WakeupState,
		"KO": KOState,
	}

func instantiate_states():
	for key in states:
		if ((not states_instance.has(key)) or states_instance[key] == null):
			states_instance[key] = states[key].new()

func free_states():
	for key in states_instance:
		states_instance[key].free()
		states_instance[key] = null

func get_state(state_name):
	if states_instance.has(state_name):
		return states_instance.get(state_name)
	else:
		printerr("No state ", state_name, " in state factory!")
		return states_instance.get("Neutral")

func merge_state_dictionary(new_states: Dictionary):
	for state_name in new_states.keys():
		states[state_name] = new_states[state_name]
