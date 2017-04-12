require "config"
require "roadmap"
require "script/startup"
--require "script/gui/gui_0"
require "script/gui/gui_1"
require "script/gui/gui_2"
require "script/gui/gui_3"
require "script/gui/gui_click"
require "script/stats/functions"

debugger = false

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
	startup.startup()
end)

-- game event hooks
script.on_event(defines.events.on_player_crafted_item, function(event)
	stats_functions.Incrementer("crafted", event.item_stack.count)
end)

script.on_event(defines.events.on_player_mined_item, function(event)
	stats_functions.Incrementer("mined", event.item_stack.count)
end)

script.on_event(defines.events.on_built_entity, function(event)
	stats_functions.Incrementer("build", 1)
end)

script.on_event(defines.events.on_robot_mined, function(event)
	stats_functions.Incrementer("ghostmined", event.item_stack.count)
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
	stats_functions.Incrementer("ghostbuild", 1)
end)

script.on_event(defines.events.on_sector_scanned, function(event)
	stats_functions.Incrementer("scanned", 1)
end)

script.on_event(defines.events.on_entity_died, function(event)
	stats_functions.Incrementer("killed", 1)
end)

--script.on_event(defines.events.on_gui_click, gui_click.onClick)

-- keybinding hooks
script.on_event("DyWorld_Stats", function(event)
    local player = game.players[event.player_index]
    gui_1.toggleGui(player)
end)
script.on_event("DyWorld_RoadMap", function(event)
    local player = game.players[event.player_index]
    gui_3.toggleGui(player)
end)
script.on_event("DyWorld_Skills", function(event)
    local player = game.players[event.player_index]
    gui_2.toggleGui(player)
end)
if config.Debug then
script.on_event("DyWorld_Debug_LOG", function(event)
    for _, NAME in pairs(global.debug) do
		PlayerPrint(NAME)
	end
end)
end
--[[script.on_event("DyWorld_Debug", function(event)
    local player = game.players[event.player_index]
    gui_0.toggleGui(player)
end)]]--