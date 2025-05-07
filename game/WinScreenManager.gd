extends Node2D

signal freeze_game ()
signal rematch_ok ()

const post_round_frames:int = 210
const rematchOK:int = 212 # 330
var frame:int
var isCounting:bool

enum State {
	isCounting,
	frame,
}

func _ready():
	add_to_group("network_sync")
	reset()

func _save_state() -> Dictionary:
	var state : Dictionary = {
		State.isCounting : isCounting,
		State.frame : frame,
	}
	return state

func _load_state(state: Dictionary) -> void:
	isCounting = state[State.isCounting]
	frame = state[State.frame]

func reset() -> void:
	frame = 0
	isCounting = false
	$FadeFreezeFrame.visible = false
	$WinSprite.visible = false

func start_win_process() -> void:
	isCounting = true

func _network_process(input: Dictionary) -> void:
	if (isCounting):
		frame += 1
		if (frame == post_round_frames):
			emit_signal("freeze_game")
			$FadeFreezeFrame.visible = true
			$WinSprite.visible = true
			$NetworkTimer.start()
			$AnimationPlayer.play("gameWIN")
		if (frame == rematchOK):
			emit_signal("rematch_ok")
			isCounting = false

func _on_NetworkTimer_timeout():
	$AnimationPlayer.stop()
	$NetworkTimer.stop()
