class_name TrainingMeterRefresher

var fighter_game: FighterGame

var prevComboTime = 0

func try_meter_refresh(super_meter:int, assist_meter:int, sync_rate:int):
	if (prevComboTime > 0 and 
			fighter_game.ServerPlayer.currentState.get(Enums.StKey.comboTime, 0) <= 0 and
			fighter_game.ClientPlayer.currentState.get(Enums.StKey.comboTime, 0) <= 0):
		refresh_meter(super_meter, assist_meter, sync_rate)
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
	prevComboTime = 0
