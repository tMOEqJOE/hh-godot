extends "res://game/state/ollie/mainstates/ollieAttackState.gd"

class_name OllieBishopState

var sound = preload("res://game/assets/sfx/Parry8Bit.wav")

func _init():
	endFrame = 33
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 65536, Enums.StKey.Hurt1PosY : -15597568,
			Enums.StKey.Hurt1ScaleX : 638999, Enums.StKey.Hurt1ScaleY : 1587430,
			},
		7 : {
			Enums.StKey.Summon : "bishop",
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : true,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : 65536, Enums.StKey.Hurt1PosY : -15597568,
			Enums.StKey.Hurt1ScaleX : 638999, Enums.StKey.Hurt1ScaleY : 1587430,
			},
	}

func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("ChessSet")
	state[Enums.StKey.super_meter] += SGFixed.ONE*200

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 3):
		state[Enums.StKey.hitStopFrame] = 0
	elif (state[Enums.StKey.frame] == 6):
		SyncManager.play_sound("SubaruStarBallSound", sound, {"bus": "Sound"})

func special_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func jump_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
