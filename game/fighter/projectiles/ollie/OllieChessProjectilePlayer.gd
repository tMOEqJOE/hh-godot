extends ProjectilePlayer

class_name OllieChessProjectilePlayer

func setup(playerData:PlayerSetup):
	if (fighterState == null):
		var state_factory: StateFactory
		match playerData.point_chara:
			Enums.Projectiles.OllieBishop:
				state_factory = BishopStateFactory.new()
			Enums.Projectiles.OllieKnight:
				state_factory = KnightStateFactory.new()
			Enums.Projectiles.OllieAirKnight:
				state_factory = preload("res://game/state/projectiles/ollie/AirKnightStateFactory.gd").new()
			Enums.Projectiles.OllieRook:
				state_factory = RookStateFactory.new()
			Enums.Projectiles.OllieChargeBishop:
				state_factory = preload("res://game/state/projectiles/ollie/ChargeBishopStateFactory.gd").new()
			Enums.Projectiles.OllieChargeKnight:
				state_factory = preload("res://game/state/projectiles/ollie/ChargeKnightStateFactory.gd").new()
			Enums.Projectiles.OllieChargeRook:
				state_factory = preload("res://game/state/projectiles/ollie/ChargeRookStateFactory.gd").new()
			Enums.Projectiles.OllieQueen:
				state_factory = QueenStateFactory.new()
			Enums.Projectiles.OllieProtonCannon:
				state_factory = preload("res://game/state/projectiles/ollie/ProtonCannonStateFactory.gd").new()
			Enums.Projectiles.AssistOllieProtonCannon:
				state_factory = preload("res://game/state/projectiles/ollie/AssistProtonCannonStateFactory.gd").new()
			_:
				printerr("invalid projectile character given")
		super.state_factory_setup(state_factory)
	super.setup(playerData)
