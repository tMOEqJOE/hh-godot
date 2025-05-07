extends "res://game/state/kanata/mainstates/kanataAirAttackState.gd"

class_name KanataAirWingStanceState

var voice = Global.AirTechSound

func _init():
	endFrame = 99
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -655360, Enums.StKey.Hurt1PosY : -23855102,
			Enums.StKey.Hurt1ScaleX : 497627, Enums.StKey.Hurt1ScaleY : 523538,
			Enums.StKey.Hurt2PosX : 3211265, Enums.StKey.Hurt2PosY : -15269887,
			Enums.StKey.Hurt2ScaleX : 964115, Enums.StKey.Hurt2ScaleY : 370909,
			Enums.StKey.Hurt3PosX : 65, Enums.StKey.Hurt3PosY : -10485760,
			Enums.StKey.Hurt3ScaleX : 871288, Enums.StKey.Hurt3ScaleY : 1034829,
			Enums.StKey.Summon: "knockdowndust",
			},
		25 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -655360, Enums.StKey.Hurt1PosY : -23855102,
			Enums.StKey.Hurt1ScaleX : 497627, Enums.StKey.Hurt1ScaleY : 523538,
			Enums.StKey.Hurt2PosX : 3211265, Enums.StKey.Hurt2PosY : -15269887,
			Enums.StKey.Hurt2ScaleX : 964115, Enums.StKey.Hurt2ScaleY : 370909,
			Enums.StKey.Hurt3PosX : 65, Enums.StKey.Hurt3PosY : -10485760,
			Enums.StKey.Hurt3ScaleX : 871288, Enums.StKey.Hurt3ScaleY : 1034829,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	state[Enums.StKey.accel_y] = SGFixed.ONE*1
	state[Enums.StKey.velocity_y] = Util.fixed_min(-SGFixed.ONE*10, state[Enums.StKey.velocity_y])
	state[Enums.StKey.super_meter] += SGFixed.ONE*2
	anim.play("WingStance")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 0):
		SyncManager.play_sound("KanataWingStanceEnter", voice, {"bus": "Voice"})
	elif (state[Enums.StKey.frame] == 26):
		state[Enums.StKey.frame] = 3

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.frame] >= Util.INPUT_BUFFER_LENIANCY):
		if (level_1_OK(state) and interpreter.is_button_down(Enums.InputFlags.CDown)):
			change_state.call("KanataAirWingStanceC")
		elif (interpreter.is_button_down(Enums.InputFlags.BDown)):
			change_state.call("KanataAirWingStanceB")
		elif (interpreter.is_button_down(Enums.InputFlags.ADown)):
			change_state.call("KanataAirWingStanceA")
		elif (interpreter.is_button_down(Enums.InputFlags.DDown)):
			change_state.call("KanataAirWingStanceExit")

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func meter_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (boost_OK(state, interpreter)):
		change_state.call("AirBoostCancel")

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
