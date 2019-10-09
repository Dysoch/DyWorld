inspect = require("script/lualib/inspect")
require "roadmap"
require "script/functions"
require "script/startup"
require "script/migration"
require "script/events/gui_click"
require "script/events/keys"
require "script/gui/gui_0"
require "script/gui/gui_1"
require "script/gui/gui_2"
require "script/gui/gui_3"
require "script/gui/gui_5"
require "script/gui/gui_6"
require "script/stats/functions"
require "script/stats/skills-functions"
require "script/generation/noise"
require "script/generation/world-generation"
require "script/functions/side-inserter"
require "script/functions/heated-entities"

debugger_extensive = settings.startup["DyWorld_Debug_Extra"].value
debugger = settings.startup["DyWorld_Debug"].value
debug_test = settings.startup["DyWorld_Debug"].value
Loot_Check_Setting = settings.global["DyWorld_Loot_Deconstruct"].value
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
		end
	end
end)

script.on_event(defines.events.on_sector_scanned, function(event)
	IncrementerGlobal("scanned", 1)
	XP_All_Small()
	for k,v in pairs(global.players) do
		Skill_Points_Gain(v.PlayerID, "scan")
	end
end)

script.on_event(defines.events.on_entity_died, function(event)
	if event.force.name == "player" then
		IncrementerGlobal("killed", 1)
		XP_All_Small()
		for k,v in pairs(global.players) do
			Skill_Points_Gain(v.PlayerID, "kill")
		end
	end
    if event.entity.type == "transport-belt" then
		Heat_Pipe_Remove(event)
    elseif event.entity.type == "underground-belt" then
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

script.on_event(defines.events.on_gui_click, onGUIClick)

script.on_event(defines.events.on_rocket_launched, function(event)
	local rocket = event.rocket
	local force = rocket.force
	if rocket.get_item_count("automation-science-pack") > 0 then
		for k,v in pairs(global.players) do	
			if not v.Skill_Points then v.Skill_Points = 0 end
			v.Skill_Points = v.Skill_Points + (rocket.get_item_count("automation-science-pack") * 1)
		end
	elseif rocket.get_item_count("logistic-science-pack") > 0 then
		for k,v in pairs(global.players) do	
			if not v.Skill_Points then v.Skill_Points = 0 end
			v.Skill_Points = v.Skill_Points + (rocket.get_item_count("logistic-science-pack") * 2)
		end
	elseif rocket.get_item_count("chemical-science-pack") > 0 then
		for k,v in pairs(global.players) do	
			if not v.Skill_Points then v.Skill_Points = 0 end
			v.Skill_Points = v.Skill_Points + (rocket.get_item_count("chemical-science-pack") * 3)
		end
	elseif rocket.get_item_count("military-science-pack") > 0 then
		for k,v in pairs(global.players) do	
			if not v.Skill_Points then v.Skill_Points = 0 end
			v.Skill_Points = v.Skill_Points + (rocket.get_item_count("military-science-pack") * 5)
		end
	elseif rocket.get_item_count("production-science-pack") > 0 then
		for k,v in pairs(global.players) do	
			if not v.Skill_Points then v.Skill_Points = 0 end
			v.Skill_Points = v.Skill_Points + (rocket.get_item_count("production-science-pack") * 10)
		end
	elseif rocket.get_item_count("utility-science-pack") > 0 then
		for k,v in pairs(global.players) do	
			if not v.Skill_Points then v.Skill_Points = 0 end
			v.Skill_Points = v.Skill_Points + (rocket.get_item_count("utility-science-pack") * 25)
		end
	elseif rocket.get_item_count("space-science-pack") > 0 then
		for k,v in pairs(global.players) do	
			if not v.Skill_Points then v.Skill_Points = 0 end
			v.Skill_Points = v.Skill_Points + (rocket.get_item_count("space-science-pack") * 5)
		end
	end
end)

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
	if event.tick%(60*60*60)==1 and global.dyworld.Players >= 1 then
		if Loot_Check_Setting then
			PlayerPrint("WARNING, LAG SPIKE IMMENENT! LOOT DECONSTRUCT HAPPENING! (you can turn this off in mod settings/map)")
			for _, surface in pairs(game.surfaces) do
			local player = game.players[1]
			local Loot = surface.find_entities_filtered{type = "item-entity"}
				for _, item in pairs(Loot) do
					if item.valid and item.stack.valid then
						if item.order_deconstruction(player.force) then end
					end
				end
			end
		end
	end
	if event.tick%(60)==1 and global.dyworld.Players ~= 0 then
		Skills_CoolDown()
		Skills_Active_Timer()
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
					if v.State_Skills_GUI and v.Alive and v.Playing then
					local player = game.players[v.PlayerID]
						gui_2_toggleGui(player, v.PlayerID)
						gui_2_toggleGui(player, v.PlayerID)
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
	DyWorld_Stats_Key(event)
end)
script.on_event("DyWorld_Distance", function(event)
	DyWorld_Distance_Key(event)
end)
script.on_event("DyWorld_RoadMap", function(event)
	DyWorld_RoadMap_Key(event)
end)
script.on_event("DyWorld_Skills", function(event)
	DyWorld_Skills_Key(event)
end)
script.on_event("DyWorld_Guide", function(event)
	DyWorld_Guide_Key(event)
end)
script.on_event("DyWorld_Loot_Deconstruct", function(event)
	DyWorld_Loot_Deconstruct_Key(event)
end)

script.on_event("DyWorld_Debug", function(event)
	DyWorld_Debug_Key(event)
end)
script.on_event("DyWorld_Debug_LOG", function(event)
	DyWorld_Debug_LOG_Key(event)
end)

script.on_event("DyWorld_rotate_inserter_pickup", function(event)
	DyWorld_rotate_inserter_pickup_Key(event)
end)

script.on_event("DyWorld_reverse_rotate_inserter_pickup", function(event)
	DyWorld_reverse_rotate_inserter_pickup_Key(event)
end)

script.on_event("DyWorld_inserter_drop_distance_toggle", function(event)
	DyWorld_inserter_drop_distance_toggle_Key(event)
end)

script.on_event("DyWorld_inserter_drop_lateral_adjust", function(event)
	DyWorld_inserter_drop_lateral_adjust_Key(event)
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
	
	RPG_Increase_Physical = function(ID, NAME, AMOUNT)
		global.player[ID].physical_mod[NAME] = AMOUNT
	end,
	
	RPG_Increase_Mystical = function(ID, NAME, AMOUNT)
		global.player[ID].mystical_mod[NAME] = AMOUNT
	end,
})

--commands.add_command("dyworld-debug-items", "Debug time :) (only for player 1!)", Debug_Items())