class_name TrainingMeterRefresher

var fighter_game: FighterGame

var prevComboTime = 0

var assist_build: bool = true
var meter_reset_option: bool = true

func try_meter_refresh(super_meter:int, assist_meter:int, sync_rate:int):
	if (prevComboTime > 0 and 
			fighter_game.ServerPlayer.currentState.get(Enums.StKey.comboTime, 0) <= 0 and
			fighter_game.ClientPlayer.currentState.get(Enums.StKey.comboTime, 0) <= 0):
		if (meter_reset_option):
			refresh_meter(super_meter, assist_meter, sync_rate)
	elif (prevComboTime > 0):
		fighter_game.ServerPlayer.assist_meter_build_frozen = false
		fighter_game.ClientPlayer.assist_meter_build_frozen = false
	else:
		prevComboTime = fighter_game.ServerPlayer.currentState.get(Enums.StKey.comboTime, 0) + fighter_game.ClientPlayer.currentState.get(Enums.StKey.comboTime, 0)

func tick(super_meter:int, assist_meter:int, sync_rate:int):
	if (not fighter_game.preround):
		try_meter_refresh(super_meter, assist_meter, sync_rate)
	fighter_game.get_node("Camera3D/BattleUI/RoundTimer").reset_time()

func refresh_meter(super_meter:int, assist_meter:int, sync_rate:int):
	fighter_game.ServerPlayer.currentState[Enums.StKey.super_meter] = super_meter
	fighter_game.ClientPlayer.currentState[Enums.StKey.super_meter] = super_meter
	fighter_game.ServerPlayer.currentState[Enums.StKey.assist_meter] = assist_meter
	fighter_game.ClientPlayer.currentState[Enums.StKey.assist_meter] = assist_meter
	fighter_game.ServerPlayer.currentState[Enums.StKey.sync_rate] = sync_rate
	fighter_game.ClientPlayer.currentState[Enums.StKey.sync_rate] = sync_rate
	fighter_game.ServerPlayer.currentState[Enums.StKey.burst_cost] = 1
	fighter_game.ClientPlayer.currentState[Enums.StKey.burst_cost] = 1
	fighter_game.get_node("Camera3D/BattleUI/ClientHPBar").reset_hp()
	fighter_game.get_node("Camera3D/BattleUI/ServerHPBar").reset_hp()
	fighter_game.get_node("Camera3D/BattleUI/RoundTimer").reset_time()
	fighter_game.ServerPlayer.assist_meter_build_frozen = not assist_build
	fighter_game.ClientPlayer.assist_meter_build_frozen = not assist_build
	prevComboTime = 0
