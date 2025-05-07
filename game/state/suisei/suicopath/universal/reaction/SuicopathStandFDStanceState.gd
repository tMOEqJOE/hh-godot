extends SuicopathIdleState

class_name SuicopathStandFDStanceState

func _init():
	anim_data = {
		0 : { 
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt2PosX : 1572864, Enums.StKey.Hurt2PosY : -24641536,
			Enums.StKey.Hurt2ScaleX : 1185327, Enums.StKey.Hurt2ScaleY : 1324647,
			Enums.StKey.Hurt3PosX : -1441792, Enums.StKey.Hurt3PosY : -5898240,
			Enums.StKey.Hurt3ScaleX : 1098168, Enums.StKey.Hurt3ScaleY : 626962,Enums.StKey.Summon : "FDBubble",
			},
		12 : {
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt2PosX : 1572864, Enums.StKey.Hurt2PosY : -24641536,
			Enums.StKey.Hurt2ScaleX : 1185327, Enums.StKey.Hurt2ScaleY : 1324647,
			Enums.StKey.Hurt3PosX : -1441792, Enums.StKey.Hurt3PosY : -5898240,
			Enums.StKey.Hurt3ScaleX : 1098168, Enums.StKey.Hurt3ScaleY : 626962,
			Enums.StKey.Summon : "FDBubble",
			},
	}
	
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.drag_x] = Util.FD_FRICTION
	state[Enums.StKey.leftfaceOK] = true
	anim.play("AngelStandBlock")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	state[Enums.StKey.super_meter] -= 3000000
	if (state[Enums.StKey.frame] >= 22):
		state[Enums.StKey.frame] = 2

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == 0):
		if (state[Enums.StKey.kara_OK]):
			# Kara Cancel section
			state[Enums.StKey.kara_OK] = false
		if (burst_OK(state, interpreter)):
			change_state.call("AngelBurst")
	elif ((not interpreter.is_low_blocking(state[Enums.StKey.leftface])) and interpreter.is_blocking(state[Enums.StKey.leftface]) and interpreter.is_button_down(Enums.InputFlags.BHold | Enums.InputFlags.CHold)):
		pass
	else:
		common_idle_transitions(state, interpreter)

func has_property(state: Dictionary,property: int) -> bool:
	match property:
		Enums.StateProperty.BlockingOK:
			return true
		_:
			return super.has_property(state,property)
