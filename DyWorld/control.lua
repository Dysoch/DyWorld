require "roadmap"
require "script/functions"
require "script/startup"
require "script/migration"
require "script/gui/gui_0"
require "script/gui/gui_1"
require "script/gui/gui_2"
require "script/gui/gui_3"
require "script/gui/gui_4"
require "script/gui/gui_5"
require "script/gui/gui_6"
require "script/gui/gui_click"
require "script/stats/functions"
require "script/generation/noise"
require "script/generation/world-generation"

debugger = false
debug_test = settings.startup["DyWorld_Debug"].value
Migrate_Debug = true

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

-- setting hooks

script.on_configuration_changed(function()
	migration.Migrate_To_Next_Version()
	if Migrate_Debug then
		migration.Migrate_Debug()
	end
end)

-- player hooks
script.on_event(defines.events.on_player_created, function(event)
	local player = game.players[event.player_index]
	startup.startup(player, event.player_index)
	if not game.players[event.player_index].name == "Dysoch" then
		player.print({"dyworld.startup-1", (game.players[event.player_index].name)})
		if settings.startup["DyWorld_Story"].value then
			player.print({"dyworld.startup-story-wip"})
		end
	end
	PlayerPrint({"dyworld_guide_gui.message"})
	debug(game.players[event.player_index].name.." created")
end)

script.on_event(defines.events.on_player_respawned, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		local player = game.players[event.player_index]	
		local ID = event.player_index
		global.players[ID].Alive = true
		game.players[ID].get_inventory(defines.inventory.player_main).clear()
		game.players[ID].get_inventory(defines.inventory.player_quickbar).clear()
		game.players[ID].get_inventory(defines.inventory.player_guns).clear()
		game.players[ID].get_inventory(defines.inventory.player_ammo).clear()
		global.players[ID].Food = 100
		global.players[ID].Water = 100
		debug(game.players[event.player_index].name.." respawned")
	end
end)

script.on_event(defines.events.on_player_died, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		local ID = event.player_index
		global.players[ID].Alive = false
		debug(game.players[event.player_index].name.." died")
	end
end)

script.on_event(defines.events.on_player_joined_game, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		local ID = event.player_index
		global.players[ID].Playing = true
		debug(game.players[event.player_index].name.." joined game")
	end
end)

script.on_event(defines.events.on_player_left_game, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		local ID = event.player_index
		global.players[ID].Playing = false
		debug(game.players[event.player_index].name.." left game")
	end
end)

-- game event hooks
script.on_event(defines.events.on_player_crafted_item, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		stats_functions.IncrementerGlobal("crafted", event.item_stack.count, event.item_stack.name)
		stats_functions.IncrementerPersonal("crafted", event.item_stack.count, event.player_index, event.item_stack.name)
		stats_functions.XP_Full(event.player_index)
		stats_functions.Needs_Work(event.player_index, (event.item_stack.count*0.1), (event.item_stack.count*0.15))
	end
end)

script.on_event(defines.events.on_player_mined_item, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		if event.item_stack.count >= 100 then
			stats_functions.IncrementerGlobal("mined", 100, event.item_stack.name)
			stats_functions.IncrementerPersonal("mined", 100, event.player_index, event.item_stack.name)
			stats_functions.XP_Full(event.player_index)
			stats_functions.Needs_Work(event.player_index, (100*0.15), (100*0.25))
		else
			stats_functions.IncrementerGlobal("mined", event.item_stack.count, event.item_stack.name)
			stats_functions.IncrementerPersonal("mined", event.item_stack.count, event.player_index, event.item_stack.name)
			stats_functions.XP_Full(event.player_index)
			stats_functions.Needs_Work(event.player_index, (event.item_stack.count*0.15), (event.item_stack.count*0.25))
		end
	end
end)

script.on_event(defines.events.on_picked_up_item, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		if event.item_stack.count >= 100 then
			stats_functions.IncrementerGlobal("pickup", 100, event.item_stack.name)
			stats_functions.IncrementerPersonal("pickup", 100, event.player_index, event.item_stack.name)
			stats_functions.XP_Full(event.player_index)
			stats_functions.Needs_Work(event.player_index, (100*0.05), (100*0.025))
		else
			stats_functions.IncrementerGlobal("pickup", event.item_stack.count, event.item_stack.name)
			stats_functions.IncrementerPersonal("pickup", event.item_stack.count, event.player_index, event.item_stack.name)
			stats_functions.XP_Full(event.player_index)
			stats_functions.Needs_Work(event.player_index, (event.item_stack.count*0.05), (event.item_stack.count*0.025))
		end
	end
end)

script.on_event(defines.events.on_built_entity, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		stats_functions.IncrementerGlobal("build", 1)
		stats_functions.IncrementerPersonal("build", 1, event.player_index)
		stats_functions.XP_Full(event.player_index)
		stats_functions.Needs_Work(event.player_index, 0.1, 0.05)
		functions.Mark_Warfare_Location(event.created_entity.position.x, event.created_entity.position.y, true)
	end
	if not global.dyworld.Guide then global.dyworld.Guide = {} end
	if not global.dyworld.Guide[event.created_entity.type] then
		global.dyworld.Guide[event.created_entity.type] = true
	end
end)

script.on_event(defines.events.on_player_mined_entity, function(event)
    functions.Mark_Warfare_Location(event.entity.position.x, event.entity.position.y, false)
end)

script.on_event(defines.events.on_robot_mined_entity, function(event)
    functions.Mark_Warfare_Location(event.entity.position.x, event.entity.position.y, false)
end)

script.on_event(defines.events.on_robot_mined, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		stats_functions.IncrementerGlobal("ghostmined", event.item_stack.count, event.item_stack.name)
		stats_functions.XP_All_Small()
	end
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		stats_functions.IncrementerGlobal("ghostbuild", 1)
		stats_functions.XP_All_Small()
		functions.Mark_Warfare_Location(event.created_entity.position.x, event.created_entity.position.y, true)
	end
	if not global.dyworld.Guide then global.dyworld.Guide = {} end
	if not global.dyworld.Guide[event.created_entity.type] then
		global.dyworld.Guide[event.created_entity.type] = true
	end
end)

script.on_event(defines.events.on_sector_scanned, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		stats_functions.IncrementerGlobal("scanned", 1)
		stats_functions.XP_All_Small()
	end
end)

script.on_event(defines.events.on_entity_died, function(event)
	if event.force.name == "player" then
		if global.dyworld.RPG_Mode == "normal" then
		stats_functions.IncrementerGlobal("killed", 1)
		stats_functions.XP_All_Small()
		end
	end
end)

script.on_event(defines.events.on_research_finished, function(event)
	stats_functions.IncrementerGlobal("research", game.forces.player.technologies[event.research.name].research_unit_count, event.research.name)
	for i=1,(game.forces.player.technologies[event.research.name].research_unit_count) do
		if global.dyworld.RPG_Mode == "normal" then
			stats_functions.XP_All_Full()
		end
	end
	debug("Finished "..event.research.name.." research")
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
		if global.dyworld.RPG_Mode == "normal" then
			stats_functions.GlobalSkillsReset()
			for k,v in pairs(global.players) do
				if v.Alive and v.Playing then
					stats_functions.BodySkills(v.PlayerID)
					stats_functions.GlobalSkills(v.PlayerID)
				end
			end
		end
	end
	if event.tick%(60*60*1)==1 and global.dyworld.Players ~= 0 then
		for k,v in pairs(global.players) do
			if v.Alive and v.Playing then
				if settings.startup["DyWorld_Story"].value or settings.startup["DyWorld_Needs"].value then
					stats_functions.Needs_Timed(v.PlayerID)
				end
			end
		end
	end
	if event.tick%(60*1)==1 and global.dyworld.Players ~= 0 then
		for k,v in pairs(global.players) do
			if v.Alive and v.Playing then
				if settings.startup["DyWorld_Story"].value or settings.startup["DyWorld_Needs"].value then
					if not v.State_Stats_GUI then
						local player = game.players[v.PlayerID]
						gui_4.RefreshGUI(player, v.PlayerID)
					else
						local player = game.players[v.PlayerID]
						gui_4.CloseGUI(player, v.PlayerID)
					end
				end
				--v.PosX = game.players[v.PlayerID].position.x
				--v.PosY = game.players[v.PlayerID].position.y
			end
		end
	end
	if global.dyworld.Players ~= 0 and event.tick%(15*1)==1 then --might be script heavy, but updates always instantly
		for k,v in pairs(global.players) do
			if v.Alive and v.Playing then
				v.PosX = game.players[v.PlayerID].position.x
				v.PosY = game.players[v.PlayerID].position.y
				if v.State_Distance_GUI then
					local player = game.players[v.PlayerID]
					gui_5.RefreshGUI(player, v.PlayerID)
				end
			end
		end
	end
	if event.tick%(60*1)==1 then
		if global.dyworld.RPG_Mode == "normal" then
			for k,v in pairs(global.players) do
				if v.State_Stats_GUI and v.Alive and v.Playing then
				local player = game.players[v.PlayerID]
					gui_1.closeGUI(player, v.PlayerID)
					gui_1.openGui(player, v.PlayerID)
				end
			end
		end
	end
end)

-- keybinding hooks
script.on_event("DyWorld_Stats", function(event)
	if global.dyworld.RPG_Mode == "normal" then
		local player = game.players[event.player_index]
		gui_1.closeGUI(player, event.player_index)
		if global.players[event.player_index].State_Stats_GUI then
			global.players[event.player_index].State_Stats_GUI = false
			gui_1.closeGUI(player, event.player_index)
		else
			global.players[event.player_index].State_Stats_GUI = true
			gui_1.openGui(player, event.player_index)
			gui_4.CloseGUI(player, event.player_index)
		end
	end
end)
script.on_event("DyWorld_Distance", function(event)
	if global.dyworld.RPG_Mode == "normal" then
		local player = game.players[event.player_index]
		if global.players[event.player_index].State_Distance_GUI then
			global.players[event.player_index].State_Distance_GUI = false
			gui_5.CloseGUI(player, event.player_index)
		else
			global.players[event.player_index].State_Distance_GUI = true
			gui_5.RefreshGUI(player, event.player_index)
		end
	end
end)
script.on_event("DyWorld_RoadMap", function(event)
	if global.dyworld.RPG_Mode == "normal" then
		local player = game.players[event.player_index]
		gui_3.toggleGui(player)
	end
end)
script.on_event("DyWorld_Skills", function(event)
	if global.dyworld.RPG_Mode == "normal" then
		local player = game.players[event.player_index]
		gui_2.toggleGui(player)
		stats_functions.BodySkills(event.player_index)
	end
end)
script.on_event("DyWorld_Guide", function(event)
	if global.dyworld.RPG_Mode == "normal" then
		local player = game.players[event.player_index]
		gui_6.toggleGui(player)
	end
end)

script.on_event("DyWorld_Debug", function(event)
	if settings.startup["DyWorld_Debug"].value or game.players[event.player_index].name == "Dysoch" then
		local player = game.players[event.player_index]
		gui_0.toggleGui(player, event.player_index)
	end
end)
script.on_event("DyWorld_Debug_LOG", function(event)
	if settings.startup["DyWorld_Debug"].value or game.players[event.player_index].name == "Dysoch" then
		local player = game.players[event.player_index]
		global.DyWorld_Debug = {}
		global.DyWorld_Debug.Tech = {}
		for _, v in pairs(game.forces.player.technologies) do
			table.insert(global.DyWorld_Debug.Tech,v.name)
			game.write_file("DyWorld/Debug/Techs.txt", v.name.."\n", true, event.player_index)
		end
		--game.write_file("DyWorld/Debug/Techs.txt", tostring(global.DyWorld_Debug.Tech))
	end
end)

--remote calls
remote.add_interface("DyWorld",
{  
	Debug_Items = function()
		functions.Debug_Items()
	end,
	
	Change_RPG_System = function(NAME)
		global.RPG = NAME
	end,
})

--commands.add_command("dyworld-debug-items", "Debug time :) (only for player 1!)", functions.Debug_Items())