extends OgaAirAttackState

class_name Ogaj2CState

#var voice = preload("res://game/assets/voice/oga/sei.wav")
#var sound = preload("res://game/assets/sfx/Parry8Bit.wav")

func _init():
	endFrame = 60
	
	anim_data = {
		0 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : true,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : true,
			Enums.StKey.Hurt1PosX : -5963776, Enums.StKey.Hurt1PosY : -29687810,
			Enums.StKey.Hurt1ScaleX : 729060, Enums.StKey.Hurt1ScaleY : 675111,
			Enums.StKey.Hurt2PosX : -196607, Enums.StKey.Hurt2PosY : -18481156,
			Enums.StKey.Hurt2ScaleX : 899246, Enums.StKey.Hurt2ScaleY : 941131,
			Enums.StKey.Hurt3PosX : 6094848, Enums.StKey.Hurt3PosY : -4784128,
			Enums.StKey.Hurt3ScaleX : 545986, Enums.StKey.Hurt3ScaleY : 674092,
			},
		8 : {
			Enums.StKey.counterOK : true,
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -5963776, Enums.StKey.Hurt1PosY : -29687810,
			Enums.StKey.Hurt1ScaleX : 729060, Enums.StKey.Hurt1ScaleY : 675111,
			Enums.StKey.Hurt2PosX : -196607, Enums.StKey.Hurt2PosY : -18481156,
			Enums.StKey.Hurt2ScaleX : 899246, Enums.StKey.Hurt2ScaleY : 941131,
			Enums.StKey.Hurt3PosX : 6094848, Enums.StKey.Hurt3PosY : -4784128,
			Enums.StKey.Hurt3ScaleX : 545986, Enums.StKey.Hurt3ScaleY : 674092,
			Enums.StKey.hit_box_colliding_frame : 254,
			Enums.StKey.Hit1PosX : 6684672, Enums.StKey.Hit1PosY : -11403264,
			Enums.StKey.Hit1ScaleX : 412565, Enums.StKey.Hit1ScaleY : 1285086,
			Enums.StKey.guard: Enums.GuardType.High,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*10,
			Enums.StKey.launch_dir_y : SGFixed.ONE*20,
			Enums.StKey.attack_type : Enums.AttackType.Launcher,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_launch_dir_x : -SGFixed.ONE*10,
			Enums.StKey.counter_launch_dir_y : SGFixed.ONE*60,
			Enums.StKey.hitstun: 40,
			Enums.StKey.hitstop: 10,
			Enums.StKey.counter_hitstun: 60,
			Enums.StKey.attack_damage: 50,
			Enums.StKey.min_damage: 8,
			},
		59 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hit2Disable : true,
			Enums.StKey.Hurt1Disable : false,Enums.StKey.Hurt2Disable : false,Enums.StKey.Hurt3Disable : false,
			Enums.StKey.Hurt1PosX : -5963776, Enums.StKey.Hurt1PosY : -29687810,
			Enums.StKey.Hurt1ScaleX : 729060, Enums.StKey.Hurt1ScaleY : 675111,
			Enums.StKey.Hurt2PosX : -196607, Enums.StKey.Hurt2PosY : -18481156,
			Enums.StKey.Hurt2ScaleX : 899246, Enums.StKey.Hurt2ScaleY : 941131,
			Enums.StKey.Hurt3PosX : 6094848, Enums.StKey.Hurt3PosY : -4784128,
			Enums.StKey.Hurt3ScaleX : 545986, Enums.StKey.Hurt3ScaleY : 674092,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("j2C")
	state[Enums.StKey.accel_y] = SGFixed.ONE*12
#	state[Enums.StKey.velocity_x] = Util.fixed_max(SGFixed.ONE*0, state[Enums.StKey.velocity_x])
	state[Enums.StKey.velocity_y] = -SGFixed.ONE*20

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] == 1):
		state[Enums.StKey.velocity_y] = -SGFixed.ONE*80
	if (state[Enums.StKey.frame] == 7):
		state[Enums.StKey.velocity_x] = Util.fixed_max(SGFixed.ONE*10, state[Enums.StKey.velocity_x])
		state[Enums.StKey.accel_y] = 0
		state[Enums.StKey.velocity_y] = SGFixed.ONE*60

func gatling_cancel(state: Dictionary, interpreter: InputInterpreter):
	pass
