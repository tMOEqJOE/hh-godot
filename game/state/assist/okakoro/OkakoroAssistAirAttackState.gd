extends AssistAirAttackState

class_name OkakoroAirAssistAttackState

var voice = preload("res://game/assets/voice/korone/kor_huh(q).wav")
var voice2 = preload("res://game/assets/voice/korone/kor_ko'one.wav")

func _init():
	endFrame = 75
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false, Enums.StKey.Hurt2Disable : false,
			Enums.StKey.Hurt1PosX : 0, Enums.StKey.Hurt1PosY : -11337728,
			Enums.StKey.Hurt1ScaleX : 586985, Enums.StKey.Hurt1ScaleY : 1074037,
			Enums.StKey.Hurt2PosX : -6605536, Enums.StKey.Hurt2PosY : -20993090,
			Enums.StKey.Hurt2ScaleX : 1208108, Enums.StKey.Hurt2ScaleY : 687212,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.velocity_x] = 0
	state[Enums.StKey.velocity_y] = 0
	state[Enums.StKey.drag_x] = Util.FRICTION
	anim.stop(true)
	anim.play("AssistAttack")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 15):
		SyncManager.play_sound("OkakoroHammerCount", voice, {"bus": "Voice"})
	elif (state[Enums.StKey.frame] == 30):
		SyncManager.play_sound("OkakoroHammerCount", voice, {"bus": "Voice"})
	elif (state[Enums.StKey.frame] == 45):
		SyncManager.play_sound("OkakoroHammerCount", voice, {"bus": "Voice"})
	elif (state[Enums.StKey.frame] == 60):
		SyncManager.play_sound("OkakoroHammerGo", voice2, {"bus": "Voice"})

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	# USE WITH CAUTION! This is "meterless" stuff
	if (not interpreter.is_blocking(state[Enums.StKey.leftface])):
		if (state[Enums.StKey.frame] >= 60):
			change_state.call("AirHammerJustFollowup")
		elif (state[Enums.StKey.frame] >= 10):
			change_state.call("AirHammerFollowup")
		else:
			pass

func tag_cancel(state: Dictionary, interpreter: InputInterpreter):
	super.tag_cancel(state, interpreter)
	if (state["tag_attack"] == 2 or state["tag_attack"] == 1 or state["tag_attack"] == 3):
		change_state.call("AssistAirAttack2")
