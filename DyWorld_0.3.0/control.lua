require "roadmap"
require "script/startup"
require "script/migration"
require "script/gui/gui_0"
require "script/gui/gui_1"
require "script/gui/gui_2"
require "script/gui/gui_3"
require "script/gui/gui_click"
require "script/stats/functions"
require "script/generation/noise"
require "script/generation/world-generation"

debugger = false
debug_test = false

function debug(str, statement)
local seconds = math.floor(game.tick/60)
local minutes = math.floor(seconds/60)
local hours = math.floor(minutes/60)
	if not global.debug then global.debug = {} end
	table.insert(global.debug, ("("..hours..":"..(minutes-(hours*60))..":"..(seconds-(minutes*60))..") = "..str))
	if debugger then
		PlayerPrint("("..hours..":"..(minutes-(hours*60))..":"..(seconds-(minutes*60))..") = "..str)
	end
end

function PlayerPrint(message)
	for _,player in pairs(game.players) do
		player.print(message)
	end
end

-- game start hooks
script.on_init(function()
	startup.Game()
end)

script.on_configuration_changed(function()
	migration.Migrate_To_Next_Version()
end)

-- player hooks
script.on_event(defines.events.on_player_created, function(event)
	local player = game.players[event.player_index]
	player.print({"dyworld-startup-1"})
	startup.startup(player, event.player_index)
	player.print({"dyworld-startup-2"})
end)

script.on_event(defines.events.on_player_respawned, function(event)
	local player = game.players[event.player_index]	
	local ID = event.player_index
	global.players[ID].Alive = true
	game.players[ID].get_inventory(defines.inventory.player_main).clear()
	game.players[ID].get_inventory(defines.inventory.player_quickbar).clear()
	game.players[ID].get_inventory(defines.inventory.player_guns).clear()
	game.players[ID].get_inventory(defines.inventory.player_ammo).clear()
end)

script.on_event(defines.events.on_player_died, function(event)
	local player = game.players[event.player_index]	
	local ID = event.player_index
	global.players[ID].Alive = false
end)

-- game event hooks
script.on_event(defines.events.on_player_crafted_item, function(event)
	stats_functions.IncrementerGlobal("crafted", event.item_stack.count, event.item_stack.name)
	stats_functions.IncrementerPersonal("crafted", event.item_stack.count, event.player_index, event.item_stack.name)
	stats_functions.XP_Level(event.player_index)
end)

script.on_event(defines.events.on_player_mined_item, function(event)
	stats_functions.IncrementerGlobal("mined", event.item_stack.count, event.item_stack.name)
	stats_functions.IncrementerPersonal("mined", event.item_stack.count, event.player_index, event.item_stack.name)
	stats_functions.XP_Level(event.player_index)
end)

script.on_event(defines.events.on_picked_up_item, function(event)
	stats_functions.IncrementerGlobal("pickup", event.item_stack.count, event.item_stack.name)
	stats_functions.IncrementerPersonal("pickup", event.item_stack.count, event.player_index, event.item_stack.name)
	stats_functions.XP_Level(event.player_index)
end)

script.on_event(defines.events.on_built_entity, function(event)
	stats_functions.IncrementerGlobal("build", 1)
	stats_functions.IncrementerPersonal("build", 1, event.player_index)
	stats_functions.XP_Level(event.player_index)
end)

script.on_event(defines.events.on_robot_mined, function(event)
	stats_functions.IncrementerGlobal("ghostmined", event.item_stack.count, event.item_stack.name)
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
	stats_functions.IncrementerGlobal("ghostbuild", 1)
end)

script.on_event(defines.events.on_sector_scanned, function(event)
	stats_functions.IncrementerGlobal("scanned", 1)
end)

script.on_event(defines.events.on_entity_died, function(event)
	if event.force.name == "player" then
		stats_functions.IncrementerGlobal("killed", 1)
	end
end)

script.on_event(defines.events.on_research_finished, function(event)
	stats_functions.IncrementerGlobal("research", game.forces.player.technologies[event.research.name].research_unit_count, event.research.name)
	if event.research.name == "dyworld-tech-basic" then
		global.dyworld.Research_Level_String = "Basic"
		global.dyworld.Research_Level_Var = 2
		for _,player in pairs(game.players) do
			player.enable_flashlight()
		end
	elseif event.research.name == "dyworld-tech-intermediate" then
		global.dyworld.Research_Level_String = "Intermediate"
		global.dyworld.Research_Level_Var = 3
	elseif event.research.name == "dyworld-tech-enhanced" then
		global.dyworld.Research_Level_String = "Enhanced"
		global.dyworld.Research_Level_Var = 4
	elseif event.research.name == "dyworld-tech-advanced" then
		global.dyworld.Research_Level_String = "Advanced"
		global.dyworld.Research_Level_Var = 5
	elseif event.research.name == "dyworld-tech-godlike" then
		global.dyworld.Research_Level_String = "Godlike"
		global.dyworld.Research_Level_Var = 6
	end
end)

-- random generation
script.on_event(defines.events.on_chunk_generated, function(event)
	global.dyworld.Chunks = global.dyworld.Chunks + 1
	if math.random(1,5)==3 then
		generation.Ruins_Spawner(event)
	end
	if global.dyworld.Chunks <= 100 then
		generation.Ship_Spawner(event)
	end
end)

--script.on_event(defines.events.on_gui_click, gui_click.onClick)

-- ontick hooks
script.on_event(defines.events.on_tick, function(event)
	if event.tick%(60*60*5)==1 and global.dyworld.Players ~= 0 then
		for k,v in pairs(global.players) do
			if v.Alive then
				stats_functions.BodySkills(v.PlayerID)
				stats_functions.GlobalSkillsReset()
				stats_functions.GlobalSkills(v.PlayerID)
			end
		end
	end
end)

-- keybinding hooks
script.on_event("DyWorld_Stats", function(event)
	local player = game.players[event.player_index]
	gui_1.toggleGui(player, event.player_index)
end)
script.on_event("DyWorld_RoadMap", function(event)
    local player = game.players[event.player_index]
    gui_3.toggleGui(player)
end)
script.on_event("DyWorld_Skills", function(event)
    local player = game.players[event.player_index]
    gui_2.toggleGui(player)
	stats_functions.BodySkills(event.player_index)
end)
script.on_event("DyWorld_Running_Speed_Toggle", function(event)
    local player = game.players[event.player_index]
	if global.players[event.player_index].Speed_Boost then
		global.players[event.player_index].Speed_Boost = false
	else
		global.players[event.player_index].Speed_Boost = true
	end
	stats_functions.BodySkills(event.player_index)
end)
script.on_event("DyWorld_Mining_Speed_Toggle", function(event)
    local player = game.players[event.player_index]
	if global.players[event.player_index].Mining_Boost then
		global.players[event.player_index].Mining_Boost = false
	else
		global.players[event.player_index].Mining_Boost = true
	end
	stats_functions.BodySkills(event.player_index)
end)
if settings.startup["DyWorld-debug"].value then
script.on_event("DyWorld_Debug_LOG", function(event)
    local player = game.players[event.player_index]
    gui_0.toggleGui(player)
end)
script.on_event("DyWorld_Debug", function(event)
    local player = game.players[event.player_index]
	global.DyWorld_Debug = {}
	global.DyWorld_Debug.Tech = {}
    for _, v in pairs(game.forces.player.technologies) do
		table.insert(global.DyWorld_Debug.Tech,v.name)
		game.write_file("DyWorld/Debug/Techs.txt", v.name.."\n", true, event.player_index)
	end
	--game.write_file("DyWorld/Debug/Techs.txt", tostring(global.DyWorld_Debug.Tech))
end)
end