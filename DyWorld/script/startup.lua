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
			Version = "0.9.0",
			Items = {},
			Research = {},
			Guide = {},
			Players = 0,
			Chunks = 0,
			Chunks_Generation_1 = 1500,
			Generation_Ship_1 = false,
			Generation_Ship_1_PosX = 0,
			Generation_Ship_1_PosY = 0,
			Generation_Ship_2 = false,
			Generation_Ship_2_PosX = 0,
			Generation_Ship_2_PosY = 0,
			Generation_Ship_3 = false,
			Generation_Ship_3_PosX = 0,
			Generation_Ship_3_PosY = 0,
			Generation_Ship_4 = false,
			Generation_Ship_4_PosX = 0,
			Generation_Ship_4_PosY = 0,
			Generation_Ship_5 = false,
			Generation_Ship_5_PosX = 0,
			Generation_Ship_5_PosY = 0,
			Generation_Ores = {},
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
	debug("Created global.dyworld at version: "..global.dyworld.Version)
	end
	if settings.startup["DyWorld_Debug"].value then
		game.forces.player.maximum_following_robot_count = 500
		game.forces.player.character_health_bonus = 99750
	end
	if remote.interfaces["silo_script"] then
		remote.call("silo_script", "set_no_victory", true)
		local tracked_items = remote.call("silo_script", "get_tracked_items")
		if not tracked_items["automation-science-pack"] then
			remote.call("silo_script", "add_tracked_item", "automation-science-pack")
		end
		if not tracked_items["logistic-science-pack"] then
			remote.call("silo_script", "add_tracked_item", "logistic-science-pack")
		end
		if not tracked_items["chemical-science-pack"] then
			remote.call("silo_script", "add_tracked_item", "chemical-science-pack")
		end
		if not tracked_items["military-science-pack"] then
			remote.call("silo_script", "add_tracked_item", "military-science-pack")
		end
		if not tracked_items["production-science-pack"] then
			remote.call("silo_script", "add_tracked_item", "production-science-pack")
		end
		if not tracked_items["utility-science-pack"] then
			remote.call("silo_script", "add_tracked_item", "utility-science-pack")
		end
		if not tracked_items["space-science-pack"] then
			remote.call("silo_script", "add_tracked_item", "space-science-pack")
		end
	end
	game.forces.player.ghost_time_to_live = (60*60*60*172)
	game.forces.player.deconstruction_time_to_live = (60*60*60*172)
end

function Player_Startup(PLAYER, ID, FORCE)
	debug("Starting Startup")
	if not global.stats then global.stats = {} debug("Created global.stats") end
	global.dyworld.Players = global.dyworld.Players + 1
	global.dyworld.Level = global.dyworld.Level + 1
	if not global.players then
	debug("No global.players, creating new one")
		global.players = 
		{
			[ID] = 
			{
				PlayerInfo = PLAYER, 
				PlayerID = ID,
				Force = FORCE,
				State_Stats_GUI = false,
				State_Skills_GUI = false,
				State_Distance_GUI = false,
				Ship_1_Visited = false,
				Ship_2_Visited = false,
				Ship_3_Visited = false,
				Ship_4_Visited = false,
				Ship_5_Visited = false,
				Alive = true,
				Playing = true,
				Speed_Boost = true,
				Mining_Boost = true,
				Level = 1,
				XP = 0,
				Skill_Points = 0,
				Skill_Points_Gain = 
				{
					Killed = 0,
					Killed_Gain = 100,
					Scanned = 0,
					Scanned_Gain = 150,
				},
				Skills = 
				{
					["dyworld-running-skill"] = {CD_On = false, CD_Time = 600, CD = 0, Name = "dyworld-running-skill", SP_Usage = 50, Active_Time = 60, Active = false, Active_Time_Left = 0, Level = 5},
					["dyworld-chart-skill"] = {CD_On = false, CD_Time = 3600, CD = 0, Name = "dyworld-chart-skill", SP_Usage = 250, Strength = 500, Active = false, Level = 15},
				},
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
				physical_mod =
				{
					strength = 0,
					endurance = 0,
					speed = 0,
					creations = 0,
					implants = 0,
				},
				mystical_mod = 
				{ 
					spirit = 0,
					intelligence = 0,
					wisdom = 0,
					guile = 0,
					knowledge = 0,
				},
				stats = {},
				crafted = {},
				mined = {},
				build = {},
			}
		}
	debug("Created global.players, and added "..game.players[ID].name.." to the table with blank stats with ID: "..ID)
	else
		global.players[ID] = 
		{
			PlayerInfo = PLAYER, 
			PlayerID = ID,
			Force = FORCE,
			State_Stats_GUI = false,
			State_Skills_GUI = false,
			State_Distance_GUI = false,
			Ship_1_Visited = false,
			Ship_2_Visited = false,
			Ship_3_Visited = false,
			Ship_4_Visited = false,
			Ship_5_Visited = false,
			Alive = true,
			Playing = true,
			Speed_Boost = true,
			Mining_Boost = true,
			Level = 1,
			XP = 0,
			Skill_Points = 0,
			Skill_Points_Gain = 
			{
				Killed = 0,
				Killed_Gain = 100,
				Scanned = 0,
				Scanned_Gain = 150,
			},
			Skills = 
			{
				["dyworld-running-skill"] = {CD_On = false, CD_Time = 600, CD = 0, Name = "dyworld-running-skill", SP_Usage = 50, Active_Time = 60, Active = false, Active_Time_Left = 0, Level = 5},
				["dyworld-chart-skill"] = {CD_On = false, CD_Time = 3600, CD = 0, Name = "dyworld-chart-skill", SP_Usage = 250, Strength = 500, Active = false, Level = 15},
			},
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
			physical_mod =
			{
				strength = 0,
				endurance = 0,
				speed = 0,
				creations = 0,
				implants = 0,
			},
			mystical_mod = 
			{ 
				spirit = 0,
				intelligence = 0,
				wisdom = 0,
				guile = 0,
				knowledge = 0,
			},
			stats = {},
			crafted = {},
			mined = {},
			build = {},
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