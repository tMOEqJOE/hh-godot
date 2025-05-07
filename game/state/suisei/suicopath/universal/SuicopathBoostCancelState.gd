extends SuicopathAttackState

class_name SuicopathBoostCancelState

func _init():
	endFrame = Util.BOOST_CANCEL_RECOVERY

	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			#
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -262144, Enums.StKey.Hurt1PosY : -7471104,
			Enums.StKey.Hurt1ScaleX : 522078, Enums.StKey.Hurt1ScaleY : 1436954,
			},
		Util.BOOST_CANCEL_RECOVERY : {
			Enums.StKey.Summon : "RCVFX"
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.drag_x] = 0
	anim.play("AngelBurst")

func handle_input(state: Dictionary, interpreter: InputInterpreter) -> void:
	if (state[Enums.StKey.frame] == endFrame):
		state[Enums.StKey.super_meter] -= Util.LEVEL_ONE_SUPER
		state[Enums.StKey.sync_rate] += Util.BOOST_CANCEL_SYNC_RATE_UP
		change_state.call("AngelStand")
		SyncManager.play_sound("rc", Global.RCSound, {"bus": "Sound"})
	if (state[Enums.StKey.frame] == 0):
		if (state[Enums.StKey.kara_OK]):
			# Kara Cancel section
			state[Enums.StKey.kara_OK] = false
		if (burst_OK(state, interpreter)):
			change_state.call("AngelBurst")
