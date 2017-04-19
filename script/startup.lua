module("startup", package.seeall)

function Game()
	if not global.dyworld then
		global.dyworld = 
		{
			Items = {},
			Research = {},
			Players = 0,
			Chunks = 0,
			ResearchLevel = "Primitive",
		}
	debug("Created global.dyworld")
	end
	if debug_test then
		game.forces.player.maximum_following_robot_count = 500
		game.forces.player.character_trash_slot_count = 50
		game.forces.player.character_logistic_slot_count = 50
		game.forces.player.auto_character_trash_slots = true
		game.forces.player.character_health_bonus = 99900
	end
	game.forces.player.ghost_time_to_live = (60*60*60*24) -- 24 hour live time
	game.forces.player.deconstruction_time_to_live = (60*60*60*24) -- 24 hour live time
end

function startup(PLAYER, ID)
	debug("Starting Startup")
	if not global.stats then global.stats = {} debug("Created global.stats") end
	if not global.body then
		global.body = 
		{
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
		}
	debug("Created global.body")
	end
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
	debug("Created global.players, and added "..ID.."to the table with blank stats")
	else
		global.players[ID] = 
		{
			PlayerInfo = PLAYER, 
			PlayerID = ID,
			State_Stats_GUI = false,
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
	if debug_test then
		game.players[ID].insert{name="deconstruction-planner",count=1}
	end
	debug("Startup done")
end

function Prototype()
	global.dyworld.Items = {}
	for k,v in pairs(game.item_prototypes) do
		table.insert(global.dyworld.Items, v.name)
	end
end