module("startup", package.seeall)

Forces = {
	{
		Name = "sulfoids", 
		Friends = {"enemy", "fulgura", "sanguisugea", "zeptipods"},
	},
	{
		Name = "fulgura", 
		Friends = {"enemy", "sanguisugea", "zeptipods", "acidicus"},
	},
	{
		Name = "plastumia", 
		Friends = {"enemy", "sanguisugea", "zeptipods"},
	},
	{
		Name = "zeptipods", 
		Friends = {"sulfoids", "fulgura", "plastumia", "sanguisugea"},
	},
	{
		Name = "acidicus", 
		Friends = {"racides", "fulgura", "sanguisugea"},
	},
	{
		Name = "racides", 
		Friends = {"enemy", "sanguisugea"},
	},
	{
		Name = "sanguisugea", 
		Friends = {"enemy", "racides", "acidicus", "zeptipods", "plastumia", "fulgura", "sulfoids"},
	},
}

function Game()
	if not global.dyworld then
		global.dyworld = 
		{
			Version = "0.3.0",
			Items = {},
			Research = {},
			Players = 0,
			Chunks = 0,
			Generation_Ship_1 = false,
			Generation_Ship_2 = false,
			Generation_Ship_3 = false,
			Research_Level_String = "Primitive",
			Research_Level_Var = 1,
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
			Spawner_Zeptipod = 0,
			Spawner_Plastumia = 0,
			Spawner_Fulgura = 0,
			Spawner_Acidicus = 0,
			Spawner_Racides = 0,
			Spawner_Sulfoids = 0,
			Spawner_Sanguisugea = 0,
		}
	debug("Created global.dyworld")
	end
	if settings.startup["DyWorld-debug"].value then
		game.forces.player.maximum_following_robot_count = 500
		game.forces.player.character_health_bonus = 99750
	end
	game.forces.player.ghost_time_to_live = (60*60*60*24) -- 24 hour live time
	game.forces.player.deconstruction_time_to_live = (60*60*60*24) -- 24 hour live time
	if settings.global["DyWorld-enemy-war"].value then
		for k,v in pairs(Forces) do
			game.create_force(v.Name)
		end
		for k,v in pairs(Forces) do
			for _,z in pairs(v.Friends) do
				game.forces[v.Name].set_friend(z, true)
			end
		end
	end
end

function startup(PLAYER, ID)
	debug("Starting Startup")
	if not global.stats then global.stats = {} debug("Created global.stats") end
	global.dyworld.Players = global.dyworld.Players + 1
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
				Alive = true,
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
			}
		}
	debug("Created global.players, and added "..ID.." to the table with blank stats")
	else
		global.players[ID] = 
		{
			PlayerInfo = PLAYER, 
			PlayerID = ID,
			State_Stats_GUI = false,
			Alive = true,
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
		}
	debug("New player created, and added "..ID.." to global.players with blank stats")
	end
	if global.dyworld.ResearchLevel == "Primitive" then
		game.players[ID].disable_flashlight()
	end
	game.players[ID].get_inventory(defines.inventory.player_main).clear()
	game.players[ID].get_inventory(defines.inventory.player_quickbar).clear()
	game.players[ID].get_inventory(defines.inventory.player_guns).clear()
	game.players[ID].get_inventory(defines.inventory.player_ammo).clear()
	if settings.startup["DyWorld-debug"].value then
		game.players[ID].insert{name="substation",count=100}
		game.players[ID].insert{name="logistic-chest-storage",count=100}
		game.players[ID].insert{name="logistic-chest-requester",count=100}
		game.players[ID].insert{name="logistic-chest-passive-provider",count=100}
		game.players[ID].insert{name="medium-electric-pole",count=100}
		game.players[ID].insert{name="dyworld-radar-godlike",count=50}
		game.players[ID].insert{name="dyworld-accumulator-9",count=500}
		game.players[ID].insert{name="dyworld-solar-9",count=500}
		game.players[ID].insert{name="dyworld-armor-05",count=1}
		game.players[ID].insert{name="dyworld-roboport-godlike",count=50}
		game.players[ID].insert{name="dyworld-construction-robot-godlike",count=500}
		game.players[ID].insert{name="dyworld-logistic-robot-godlike",count=500}
		game.players[ID].insert{name="dyworld-module-productivity-25",count=100}
		game.players[ID].insert{name="dyworld-module-speed-25",count=100}
	end
	debug("Startup done")
end

function Prototype()
	global.dyworld.Items = {}
	for k,v in pairs(game.item_prototypes) do
		table.insert(global.dyworld.Items, v.name)
	end
end