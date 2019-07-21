function Research_Calc()
	local var = 0
	for k,v in pairs(game.forces.player.technologies) do
		var = var + 1
	end
	return var
end

function Game_Startup()
	if not global.dyworld then
		global.dyworld = 
		{
			Version = "0.7.80",
			Items = {},
			Research = {},
			Guide = {},
			Players = 0,
			Chunks = 0,
			Generation_Ship_1 = false,
			Generation_Ship_1_PosX = 0,
			Generation_Ship_1_PosY = 0,
			Generation_Ship_2 = false,
			Generation_Ship_2_PosX = 0,
			Generation_Ship_2_PosY = 0,
			Generation_Ship_3 = false,
			Generation_Ship_3_PosX = 0,
			Generation_Ship_3_PosY = 0,
			Research_Level_String = "Primitive",
			Research_Level_Var = 1,
			Research_Done = 0,
			Max_Research = Research_Calc(),
			Migration_Check = false,
			Strength = 0,
			Endurance = 0,
			Speed = 0,
			Creations = 0,
			Implants = 0,
			Spirit = 0,
			Intelligence = 0,
			Wisdom = 0,
			Guile = 0,
			Knowledge = 0,
			Level = 0,
			XP = 0,
			RPG_Mode = global.RPG or "normal",
            Warfare = {Location = {}},
		}
	debug("Created global.dyworld")
	end
	if settings.startup["DyWorld_Debug"].value then
		game.forces.player.maximum_following_robot_count = 500
		game.forces.player.character_health_bonus = 99750
	end
	game.forces.player.ghost_time_to_live = (60*60*60*24) -- 24 hour live time
	game.forces.player.deconstruction_time_to_live = (60*60*60*24) -- 24 hour live time
	--remote.call("silo_script", "set_show_launched_without_satellite", false)
	--remote.call("silo_script", "set_finish_on_launch", false)
	--remote.call("silo_script", "remove_tracked_item", "satellite")
	--remote.call("silo_script", "add_tracked_item", "dyworld-dtx-001-spaceship")
end

function Player_Startup(PLAYER, ID)
	debug("Starting Startup")
	if not global.stats then global.stats = {} debug("Created global.stats") end
	global.dyworld.Players = global.dyworld.Players + 1
	global.dyworld.Level = global.dyworld.Level + 1
	--Prototype()
	if not global.players then
	debug("No global.players, creating new one")
		global.players = 
		{
			[ID] = 
			{
				PlayerInfo = PLAYER, 
				PlayerID = ID,
				State_Stats_GUI = false,
				State_Distance_GUI = false,
				Ship_1_Visited = false,
				Ship_2_Visited = false,
				Ship_3_Visited = false,
				Alive = true,
				Playing = true,
				Speed_Boost = true,
				Mining_Boost = true,
				Level = 1,
				XP = 0,
				XP_LevelUp = (100 + math.random(100)),
				PosX = 0,
				PosY = 0,
				physical =
				{
					strength = 1,
					endurance = 1,
					speed = 1,
					creations = 0,
					implants = 0,
				},
				mystical = 
				{ 
					spirit = 1,
					intelligence = 1,
					wisdom = 1,
					guile = 1,
					knowledge = 1,
				},
				stats = {},
				crafted = {},
				mined = {},
			}
		}
	debug("Created global.players, and added "..game.players[ID].name.." to the table with blank stats with ID: "..ID)
	else
		global.players[ID] = 
		{
			PlayerInfo = PLAYER, 
			PlayerID = ID,
			State_Stats_GUI = false,
			State_Distance_GUI = false,
			Ship_1_Visited = false,
			Ship_2_Visited = false,
			Ship_3_Visited = false,
			Alive = true,
			Playing = true,
			Speed_Boost = true,
			Mining_Boost = true,
			Level = 1,
			XP = 0,
			XP_LevelUp = (100 + math.random(100)),
			PosX = 0,
			PosY = 0,
			physical =
			{
				strength = 1,
				endurance = 1,
				speed = 1,
				creations = 0,
				implants = 0,
			},
			mystical = 
			{ 
				spirit = 1,
				intelligence = 1,
				wisdom = 1,
				guile = 1,
				knowledge = 1,
			},
			stats = {},
			crafted = {},
			mined = {},
		}
	debug("New player created, and added "..game.players[ID].name.." to global.players with blank stats with ID: "..ID)
	end
	if game.players[ID].character then
		game.players[ID].get_inventory(defines.inventory.character_main).clear()
		game.players[ID].get_inventory(defines.inventory.character_guns).clear()
		game.players[ID].get_inventory(defines.inventory.character_ammo).clear()
	end
	if settings.startup["DyWorld_Debug"].value then
		game.players[ID].insert{name="substation",count=100}
		game.players[ID].insert{name="logistic-chest-storage",count=100}
		game.players[ID].insert{name="logistic-chest-requester",count=100}
		game.players[ID].insert{name="logistic-chest-passive-provider",count=100}
		game.players[ID].insert{name="medium-electric-pole",count=100}
	end
	debug("Startup done")
end

function Prototype()
	global.dyworld.Items = {}
	for k,v in pairs(game.item_prototypes) do
		table.insert(global.dyworld.Items, v.name)
	end
	debug("Exported Item Prototypes")
end