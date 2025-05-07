extends OgaAirAttackState

class_name Ogaj8CState

var voice = preload("res://game/assets/voice/oga/sei.wav")
var sound = preload("res://game/assets/sfx/Parry8Bit.wav")


func _init():
	endFrame = 22
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 1245184, Enums.StKey.Hurt1PosY : -26542082,
			Enums.StKey.Hurt1ScaleX : 1414488, Enums.StKey.Hurt1ScaleY : 373717,
			Enums.StKey.Hurt2PosX : 4653056, Enums.StKey.Hurt2PosY : -22937600,
			Enums.StKey.Hurt2ScaleX : 841985, Enums.StKey.Hurt2ScaleY : -836808,
			Enums.StKey.Hurt3PosX : 2162688, Enums.StKey.Hurt3PosY : -14155776,
			Enums.StKey.Hurt3ScaleX : 838252, Enums.StKey.Hurt3ScaleY : 402529,
			},
		6 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 10092544, Enums.StKey.Hurt1PosY : -35061756,
			Enums.StKey.Hurt1ScaleX : 377195, Enums.StKey.Hurt1ScaleY : 432317,
			Enums.StKey.Hurt2PosX : -65535, Enums.StKey.Hurt2PosY : -22609920,
			Enums.StKey.Hurt2ScaleX : 841985, Enums.StKey.Hurt2ScaleY : -836808,
			Enums.StKey.Hurt3PosX : -3276800, Enums.StKey.Hurt3PosY : -13434882,
			Enums.StKey.Hurt3ScaleX : 838252, Enums.StKey.Hurt3ScaleY : 402529,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : 18087936, Enums.StKey.Hit1PosY : -42205188,
			Enums.StKey.Hit1ScaleX : 1394011, Enums.StKey.Hit1ScaleY : -1271965,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*9,
			Enums.StKey.launch_dir_y : -SGFixed.ONE*30,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.counter_hit: Enums.AttackType.Launcher,
			Enums.StKey.hitstun: 22 - Util.BONUS_JUGGLE_HITSTUN, 
			Enums.StKey.counter_hitstun: 35,
			Enums.StKey.attack_damage: 72,
			Enums.StKey.min_damage: 7,
			},
		12 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : 10092544, Enums.StKey.Hurt1PosY : -35061756,
			Enums.StKey.Hurt1ScaleX : 377195, Enums.StKey.Hurt1ScaleY : 432317,
			Enums.StKey.Hurt2PosX : -65535, Enums.StKey.Hurt2PosY : -22609920,
			Enums.StKey.Hurt2ScaleX : 841985, Enums.StKey.Hurt2ScaleY : -836808,
			Enums.StKey.Hurt3PosX : -3276800, Enums.StKey.Hurt3PosY : -13434882,
			Enums.StKey.Hurt3ScaleX : 838252, Enums.StKey.Hurt3ScaleY : 402529,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("j8C")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 3):
		SyncManager.play_sound("OgaVoice", voice, {"bus": "Voice"})
	elif (state[Enums.StKey.frame] == 5):
		SyncManager.play_sound("ogaJ8CSound", sound, {"bus": "Voice"})

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	if (state[Enums.StKey.hitStopFrame] >= 0):
		if ((interpreter.is_holding_a_direction(Enums.Numpad.N1, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N2, state[Enums.StKey.leftface]) or
				interpreter.is_holding_a_direction(Enums.Numpad.N3, state[Enums.StKey.leftface])) and 
				interpreter.is_button_down(Enums.InputFlags.CDown)):
			state[Enums.StKey.cancelState] = "Jump2C"
