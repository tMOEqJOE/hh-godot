extends "res://game/menus/rematchmenu/RematchControl.gd"

func _ready():
	$P1Cursor.connect("select_chara", Callable(self, "select_p1"))
	$P2Cursor.connect("select_chara", Callable(self, "select_p2"))
	$P1Cursor.connect("deselect_chara", Callable(self, "deselect_p1"))
	$P2Cursor.connect("deselect_chara", Callable(self, "deselect_p2"))
	
	if (not Global.TRAINING_P1):
		$P1Cursor.visible = false
	else:
		$P2Cursor.visible = false
	$CanvasLayer/RemainingTime.visible = false

func deselect_ok():
	$P1Cursor.deselect_ok = true
	$P2Cursor.deselect_ok = true

func select_p1():
	select_data[0] = $P1Cursor.row
	peer_ready[0] = true
	select_data[1] = $P1Cursor.row
	peer_ready[1] = true
	if (Global.NETPLAY_MODE != Global.NETPLAY_MODES.OFFLINE):
		$Timer.start($Timer.time_left + 2)
		rpc("select_p", select_data[0])

func select_p2():
	select_data[1] = $P2Cursor.row
	peer_ready[1] = true
	select_data[0] = $P2Cursor.row
	peer_ready[0] = true
	if (Global.NETPLAY_MODE != Global.NETPLAY_MODES.OFFLINE):
		$Timer.start($Timer.time_left + 2)
		rpc("select_p", select_data[1])

func deselect_p1():
	select_data[0] = -1
	peer_ready[0] = false
	if (Global.NETPLAY_MODE != Global.NETPLAY_MODES.OFFLINE):
		rpc("deselect_p")

func deselect_p2():
	select_data[1] = -1
	peer_ready[1] = false
	if (Global.NETPLAY_MODE != Global.NETPLAY_MODES.OFFLINE):
		rpc("deselect_p")

func rematch_ready() -> bool:
	return peer_ready[0] and peer_ready[1] and select_data[0] == 0 and select_data[1] == 0

func _physics_process(_delta):
	if ($CanvasLayer/RemainingTime.visible):
		$CanvasLayer/RemainingTime.text = str(int($Timer.time_left+1))
	
	if (rematch_ready()):
		emit_signal("rematch")
		if (Global.NETPLAY_MODE != Global.NETPLAY_MODES.OFFLINE):
			rpc("remote_rematch")
	elif (peer_ready[0] and select_data[0] == 1):
		emit_signal("chara_select")
		if (Global.NETPLAY_MODE != Global.NETPLAY_MODES.OFFLINE):
			rpc("remote_chara_select")
	elif (peer_ready[0] and select_data[0] == 2):
		emit_signal("main_menu")
		if (Global.NETPLAY_MODE != Global.NETPLAY_MODES.OFFLINE):
			rpc("remote_main_menu")
	elif (peer_ready[1] and select_data[1] == 1):
		emit_signal("chara_select")
		if (Global.NETPLAY_MODE != Global.NETPLAY_MODES.OFFLINE):
			rpc("remote_chara_select")
	elif (peer_ready[1] and select_data[1] == 2):
		emit_signal("main_menu")
		if (Global.NETPLAY_MODE != Global.NETPLAY_MODES.OFFLINE):
			rpc("remote_main_menu")

func _on_Timer_timeout():
	pass
