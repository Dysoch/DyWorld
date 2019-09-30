require "roadmap"
require "script/functions"
require "script/startup"
require "script/migration"
require "script/gui/gui_0"
require "script/gui/gui_1"
require "script/gui/gui_2"
require "script/gui/gui_3"
require "script/gui/gui_5"
require "script/gui/gui_6"
require "script/gui/gui_click"
require "script/stats/functions"
require "script/generation/noise"
require "script/generation/world-generation"
require "script/functions/side-inserter"
require "script/functions/heated-entities"

debugger_extensive = settings.startup["DyWorld_Debug_Extra"].value
debugger = settings.startup["DyWorld_Debug"].value
debug_test = settings.startup["DyWorld_Debug"].value
Migrate_Debug = false

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

function debug2(str, statement)
local seconds = math.floor(game.tick/60)
local minutes = math.floor(seconds/60)
local hours = math.floor(minutes/60)
	if not global.debug then global.debug = {} end
	if debugger_extensive then
		table.insert(global.debug, ("("..hours..":"..(minutes-(hours*60))..":"..(seconds-(minutes*60))..") = "..str))
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
	Game_Startup()
end)

-- setting hooks

script.on_configuration_changed(function()
	Migrate_To_Next_Version()
	if Migrate_Debug then
		Migrate_Debug()
	end
end)

-- player hooks
script.on_event(defines.events.on_player_created, function(event)
	local player = game.players[event.player_index]
	local ID = event.player_index
	Player_Startup(player, ID, player.force.name)
	player.print({"dyworld.startup-1", (player.name)})
	--PlayerPrint({"dyworld_guide_gui.message"})
	debug(player.name.." created")
end)

script.on_event(defines.events.on_player_respawned, function(event)
	local player = game.players[event.player_index]	
	local ID = event.player_index
	global.players[ID].Alive = true
	game.players[ID].get_inventory(defines.inventory.character_main).clear()
	game.players[ID].get_inventory(defines.inventory.character_guns).clear()
	game.players[ID].get_inventory(defines.inventory.character_ammo).clear()
	debug(game.players[event.player_index].name.." respawned")
end)

script.on_event(defines.events.on_player_changed_force, function(event)
	local player = game.players[event.player_index]	
	local ID = event.player_index
	debug("Player "..event.player_index.." changed force")
	global.players[ID].Force = player.force.name
end)

script.on_event(defines.events.on_player_died, function(event)
	local ID = event.player_index
	global.players[ID].Alive = false
	debug(game.players[event.player_index].name.." died")
end)

script.on_event(defines.events.on_player_joined_game, function(event)
	local player = game.players[event.player_index]
	local ID = event.player_index
	global.players[ID].Playing = true
	debug(game.players[event.player_index].name.." joined game")
end)

script.on_event(defines.events.on_player_left_game, function(event)
	local ID = event.player_index
	global.players[ID].Playing = false
	debug(game.players[event.player_index].name.." left game")
end)

-- game event hooks
script.on_event(defines.events.on_player_crafted_item, function(event)
	if not event.item_stack.valid_for_read then return end
	IncrementerGlobal("crafted", event.item_stack.count, event.item_stack.name)
	IncrementerPersonal("crafted", event.item_stack.count, event.player_index, event.item_stack.name)
	XP_Crafting(event.player_index, event.item_stack.name, event.item_stack.count)
end)

script.on_event(defines.events.on_player_mined_item, function(event)
	if event.item_stack.count >= 100 then
		IncrementerGlobal("mined", 100, event.item_stack.name)
		IncrementerPersonal("mined", 100, event.player_index, event.item_stack.name)
		XP_Mining(event.player_index, event.item_stack.name, 100)
	else
		IncrementerGlobal("mined", event.item_stack.count, event.item_stack.name)
		IncrementerPersonal("mined", event.item_stack.count, event.player_index, event.item_stack.name)
		XP_Mining(event.player_index, event.item_stack.name, event.item_stack.count)
	end
end)

script.on_event(defines.events.on_player_mined_entity, function(event)
    if event.entity.type == "transport-belt" then
		Heat_Pipe_Remove(event)
    elseif event.entity.type == "underground-belt" then
		Heat_Pipe_Remove(event)
	end
end)

script.on_event(defines.events.on_picked_up_item, function(event)
	if event.item_stack.count >= 100 then
		IncrementerGlobal("pickup", 100, event.item_stack.name)
		IncrementerPersonal("pickup", 100, event.player_index, event.item_stack.name)
		XP_Full(event.player_index)
	else
		IncrementerGlobal("pickup", event.item_stack.count, event.item_stack.name)
		IncrementerPersonal("pickup", event.item_stack.count, event.player_index, event.item_stack.name)
		XP_Full(event.player_index)
	end
end)

script.on_event(defines.events.on_built_entity, function(event)
	IncrementerGlobal("build", 1)
	IncrementerPersonal("build", 1, event.player_index, event.created_entity.name)
	XP_Building(event.player_index, event.created_entity.name, 1)
	if not global.dyworld.Guide then global.dyworld.Guide = {} end
	if not global.dyworld.Guide[event.created_entity.type] then
		global.dyworld.Guide[event.created_entity.type] = true
	end
	if settings.startup["DyWorld_Heat_Pipe_Belt"].value then
		if event.created_entity.type == "transport-belt" then
			Heat_Pipe_Add(event)
		elseif event.created_entity.type == "underground-belt" then
			Heat_Pipe_Add(event)
		elseif event.created_entity.type == "splitter" then
			Heat_Pipe_Add(event)
		end
	end
end)

script.on_event(defines.events.on_robot_mined, function(event)
	IncrementerGlobal("ghostmined", event.item_stack.count, event.item_stack.name)
	XP_All_Small()
end)

script.on_event(defines.events.on_robot_mined_entity, function(event)
    if event.entity.type == "transport-belt" then
		Heat_Pipe_Remove(event)
    elseif event.entity.type == "underground-belt" then
		Heat_Pipe_Remove(event)
    elseif event.entity.type == "splitter" then
		Heat_Pipe_Remove(event)
    elseif event.entity.type == "splitter" then
		Heat_Pipe_Remove(event)
	end
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
	IncrementerGlobal("ghostbuild", 1)
	XP_All_Small()
	if not global.dyworld.Guide then global.dyworld.Guide = {} end
	if not global.dyworld.Guide[event.created_entity.type] then
		global.dyworld.Guide[event.created_entity.type] = true
	end
	if settings.startup["DyWorld_Heat_Pipe_Belt"].value then
		if event.created_entity.type == "transport-belt" then
			Heat_Pipe_Add(event)
		elseif event.created_entity.type == "underground-belt" then
			Heat_Pipe_Add(event)
		elseif event.created_entity.type == "splitter" then
			Heat_Pipe_Add(event)
		end
	end
end)

script.on_event(defines.events.on_sector_scanned, function(event)
	IncrementerGlobal("scanned", 1)
	XP_All_Small()
end)

script.on_event(defines.events.on_entity_died, function(event)
	if event.force.name == "player" then
		IncrementerGlobal("killed", 1)
		XP_All_Small()
	end
    if event.entity.type == "transport-belt" then
		Heat_Pipe_Remove(event)
    elseif event.entity.type == "underground-belt" then
		Heat_Pipe_Remove(event)
    elseif event.entity.type == "splitter" then
		Heat_Pipe_Remove(event)
	end
end)

script.on_event(defines.events.on_research_finished, function(event)
	IncrementerGlobal("research", game.forces.player.technologies[event.research.name].research_unit_count, event.research.name)
	for i=1,(game.forces.player.technologies[event.research.name].research_unit_count) do
		XP_All_Full()
	end
	global.dyworld.Research_Done = global.dyworld.Research_Done + 1
	debug("Finished "..event.research.name.." research")
end)

-- random generation
script.on_event(defines.events.on_chunk_generated, function(event)
	global.dyworld.Chunks = global.dyworld.Chunks + 1
	if math.random(1,10)==5 then
		Ruins_Spawner(event)
	end
	if global.dyworld.Chunks <= 100 then
		Ship_Spawner(event)
	end
	if global.dyworld.Chunks <= 75 then
		Ruins_Spawner_Start(event)
	end
	if global.dyworld.Chunks >= global.dyworld.Chunks_Generation_1 then
		if math.random(1,20)==5 then
			Ruins_Spawner_FarOut(event)
		end
	end
end)

--script.on_event(defines.events.on_gui_click, gui_click.onClick)

-- ontick hooks
script.on_event(defines.events.on_tick, function(event)
	if event.tick%(60*60)==1 and global.dyworld.Players ~= 0 then
		if global.dyworld.RPG_Mode == "normal" then
			GlobalSkillsReset()
			for k,v in pairs(global.players) do
				if v.Alive and v.Playing then
					BodySkills(v.PlayerID)
					GlobalSkills(v.PlayerID)
				end
			end
		end
	end
	if global.dyworld.Players ~= 0 and event.tick%(15*1)==1 then
		for k,v in pairs(global.players) do
			if v.Alive and v.Playing then
				v.PosX = game.players[v.PlayerID].position.x
				v.PosY = game.players[v.PlayerID].position.y
				if v.State_Distance_GUI and v.Alive and v.Playing and not v.State_Stats_GUI then
					local player = game.players[v.PlayerID]
					gui_5_RefreshGUI(player, v.PlayerID)
				end
			end
		end
	end
	if event.tick%(60*5)==1 and global.dyworld.Players ~= 0 then
		if global.dyworld.RPG_Mode == "normal" then
			if global.players then
				for k,v in pairs(global.players) do
					if v.State_Stats_GUI and v.Alive and v.Playing then
					local player = game.players[v.PlayerID]
						gui_1_closeGUI(player, v.PlayerID)
						gui_1_openGui(player, v.PlayerID)
					end
				end
			end
		end
	end
	-- Extend Day & Nights by 4x
	if event.tick%(13)==1 and global.dyworld.Players ~= 0 then
		if not global.Day_Longer then global.Day_Longer = 0 end
		for _, s in pairs(game.surfaces) do
			if not s.always_day then
				if global.Day_Longer == 0 then s.freeze_daytime = false
				elseif global.Day_Longer == 1 then s.freeze_daytime = true end
			end
		end
		global.Day_Longer = (global.Day_Longer + 1) % 4
	end
end)

-- keybinding hooks
script.on_event("DyWorld_Stats", function(event)
	if global.dyworld.RPG_Mode == "normal" then
		if not global.players or not global.players[event.player_index] then
			local player = game.players[event.player_index]
			Player_Startup(player, event.player_index)
		end
		local player = game.players[event.player_index]
		gui_1_closeGUI(player, event.player_index)
		if global.players[event.player_index].State_Distance_GUI then
			global.players[event.player_index].State_Distance_GUI = false
			gui_5_CloseGUI(player, event.player_index)
		end
		if global.players[event.player_index].State_Stats_GUI then
			global.players[event.player_index].State_Stats_GUI = false
			gui_1_closeGUI(player, event.player_index)
		else
			global.players[event.player_index].State_Stats_GUI = true
			gui_1_openGui(player, event.player_index)
		end
	end
end)
script.on_event("DyWorld_Distance", function(event)
	if global.dyworld.RPG_Mode == "normal" then
		if not global.players or not global.players[event.player_index] then
			local player = game.players[event.player_index]
			Player_Startup(player, event.player_index)
		end
		local player = game.players[event.player_index]
		if global.players[event.player_index].State_Stats_GUI then
			global.players[event.player_index].State_Stats_GUI = false
			gui_1_closeGUI(player, event.player_index)
		end
		if global.players[event.player_index].State_Distance_GUI then
			global.players[event.player_index].State_Distance_GUI = false
			gui_5_CloseGUI(player, event.player_index)
		else
			global.players[event.player_index].State_Distance_GUI = true
			gui_5_RefreshGUI(player, event.player_index)
		end
	end
end)
script.on_event("DyWorld_RoadMap", function(event)
	if global.dyworld.RPG_Mode == "normal" then
		if not global.players or not global.players[event.player_index] then
			local player = game.players[event.player_index]
			Player_Startup(player, event.player_index)
		end
		local player = game.players[event.player_index]
		gui_3_toggleGui(player)
	end
end)
script.on_event("DyWorld_Skills", function(event)
	if global.dyworld.RPG_Mode == "normal" then
		if not global.players or not global.players[event.player_index] then
			local player = game.players[event.player_index]
			Player_Startup(player, event.player_index)
		end
		local player = game.players[event.player_index]
		--gui_2_toggleGui(player) -- TEMP REMOVED!
		BodySkills(event.player_index)
	end
end)
script.on_event("DyWorld_Guide", function(event)
	if global.dyworld.RPG_Mode == "normal" then
		if not global.players or not global.players[event.player_index] then
			local player = game.players[event.player_index]
			Player_Startup(player, event.player_index)
		end
		local player = game.players[event.player_index]
		gui_6_toggleGui(player)
	end
end)

script.on_event("DyWorld_Debug", function(event)
	if settings.startup["DyWorld_Debug"].value or game.players[event.player_index].name == "Dysoch" then
		local player = game.players[event.player_index]
		gui_0_toggleGui(player, event.player_index)
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

script.on_event("DyWorld_rotate_inserter_pickup", function(event)
local selection = game.players[event.player_index].selected
	if selection and (selection.type == "inserter" or (selection.type == "entity-ghost" and selection.ghost_type == "inserter")) then
		RotatePickup(selection, true)
	end
end)

script.on_event("DyWorld_reverse_rotate_inserter_pickup", function(event)
local selection = game.players[event.player_index].selected
	if selection and (selection.type == "inserter" or (selection.type == "entity-ghost" and selection.ghost_type == "inserter")) then
		RotatePickup(selection, false)
	end
end)

script.on_event("DyWorld_inserter_drop_distance_toggle", function(event)
local selection = game.players[event.player_index].selected
	if selection and (selection.type == "inserter" or (selection.type == "entity-ghost" and selection.ghost_type == "inserter")) then
		ToggleDropDistance(selection, event)
	end
end)

script.on_event("DyWorld_inserter_drop_lateral_adjust", function(event)
local selection = game.players[event.player_index].selected
	if selection and (selection.type == "inserter" or (selection.type == "entity-ghost" and selection.ghost_type == "inserter")) then
		LateralDropAdjust(selection)
	end
end)

--------------------------------- TEST AREA ------------------------------------------

------------------------------- END TEST AREA ----------------------------------------

--remote calls
remote.add_interface("DyWorld",
{  
	Debug_Items = function()
		Debug_Items()
	end,
	
	Change_RPG_System = function(NAME)
		global.RPG = NAME
	end,
	
	Chart = function(AMOUNT)
		game.forces.player.chart(game.player.surface, {lefttop = {x = -AMOUNT, y = -AMOUNT}, rightbottom = {x = AMOUNT, y = AMOUNT}})
	end,
	
	RegenerateOre = function(NAME)
		game.regenerate_entity(NAME)
	end,
})

--commands.add_command("dyworld-debug-items", "Debug time :) (only for player 1!)", Debug_Items())