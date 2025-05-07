extends HatoAttackState

class_name HatoStand5BState

func _init():
	endFrame = 50
	
	anim_data = {
		0 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : true,
			Enums.StKey.Hurt1PosX : 2490369, Enums.StKey.Hurt1PosY : -10944513,
			Enums.StKey.Hurt1ScaleX : 1232784, Enums.StKey.Hurt1ScaleY : 706227,
			},
		8 : {
			Enums.StKey.Hit1Disable : false,
			Enums.StKey.Hurt1Disable : true,
			Enums.StKey.hit_box_colliding_frame : 254, 
			Enums.StKey.Hit1PosX : -65536, Enums.StKey.Hit1PosY : -98304000,
			Enums.StKey.Hit1ScaleX : 1070702, Enums.StKey.Hit1ScaleY : 10975689,
			Enums.StKey.attack_type : Enums.AttackType.GroundBouncer,
			Enums.StKey.launch_dir_x : -SGFixed.ONE*5,
			Enums.StKey.launch_dir_y : SGFixed.ONE*60,
			Enums.StKey.hitstun : 30,
			Enums.StKey.blockstun : 20,
			Enums.StKey.attack_damage: 60,
			Enums.StKey.min_damage:12,
			Enums.StKey.chip_damage:9,
			Enums.StKey.counter_hit: Enums.AttackType.GroundBouncer,
			Enums.StKey.counter_hitstun: 80,
			Enums.StKey.counter_launch_dir_x: -SGFixed.ONE*0,
			Enums.StKey.counter_launch_dir_y: -SGFixed.ONE*20,
			},
		14 : {
			Enums.StKey.Hit1Disable : true,
			Enums.StKey.Hurt1Disable : false,
			Enums.StKey.Hurt1PosX : -327680, Enums.StKey.Hurt1PosY : -20447234,
			Enums.StKey.Hurt1ScaleX : 841262, Enums.StKey.Hurt1ScaleY : 1777410,
			# Enums.StKey.Hit1PosX : 2025, Enums.StKey.Hit1PosY : -13828096,
			},
	}

# Writing _delta instead of delta here prevents the unused variable warning.
func enter(state: Dictionary) -> void:
	super.enter(state)
	anim.play("5B")

func physics_tick(state: Dictionary) -> void:
	super.physics_tick(state)
	if (state[Enums.StKey.frame] <= 8):
		state[Enums.StKey.drag_x] = 0
	else:
		state[Enums.StKey.drag_x] = Util.ICE_FRICTION	

const ICE_FRICTION := 55536
