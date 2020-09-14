
debugger = true

-- LuaLib
require "script/lualib/function"
require "script/lualib/debug"
require "script/lualib/player"
require "script/lualib/gui"
inspect = require("script/lualib/inspect")
require("script/database/recipes")
require("script/lualib/side-inserter")

-- GUI
require "script/gui/main-gui"
require "script/gui/story-gui"
require "script/gui/log-gui"

-- Stats
require "script/stats/functions"

-- Story
require "script/story/functions"
require "script/story/tier-0"

-- Event Handlers --
require "script/events/keys"
require "script/events/on_built_entity"
require "script/events/on_chunk_generated"
require "script/events/on_configuration_changed"
require "script/events/on_entity_died"
require "script/events/on_init"
require "script/events/on_gui_click"
require "script/events/on_picked_up_item"
require "script/events/on_player_changed_force"
require "script/events/on_player_crafted_item"
require "script/events/on_player_created"
require "script/events/on_player_died"
require "script/events/on_player_joined_game"
require "script/events/on_player_left_game"
require "script/events/on_player_mined_entity"
require "script/events/on_player_mined_item"
require "script/events/on_player_respawned"
require "script/events/on_research_finished"
require "script/events/on_robot_built_entity"
require "script/events/on_robot_mined"
require "script/events/on_robot_mined_entity"
require "script/events/on_rocket_launched"
require "script/events/on_sector_scanned"
require "script/events/on_tick"

script.on_event(defines.events.on_built_entity, Event_on_built_entity)
script.on_event(defines.events.on_chunk_generated, Event_on_chunk_generated)
script.on_configuration_changed(Event_on_configuration_changed)
script.on_event(defines.events.on_entity_died, Event_on_entity_died)
script.on_init(Event_on_init)
script.on_event(defines.events.on_gui_click, Event_on_gui_click)
script.on_event(defines.events.on_picked_up_item, Event_on_picked_up_item)
script.on_event(defines.events.on_player_changed_force, Event_on_player_changed_force)
script.on_event(defines.events.on_player_crafted_item, Event_on_player_crafted_item)
script.on_event(defines.events.on_player_created, Event_on_player_created)
script.on_event(defines.events.on_player_died, Event_on_player_died)
script.on_event(defines.events.on_player_joined_game, Event_on_player_joined_game)
script.on_event(defines.events.on_player_left_game, Event_on_player_left_game)
script.on_event(defines.events.on_player_mined_entity, Event_on_player_mined_entity)
script.on_event(defines.events.on_player_mined_item, Event_on_player_mined_item)
script.on_event(defines.events.on_player_respawned, Event_on_player_respawned)
script.on_event(defines.events.on_research_finished, Event_on_research_finished)
script.on_event(defines.events.on_robot_built_entity, Event_on_robot_built_entity)
script.on_event(defines.events.on_robot_mined, Event_on_robot_mined)
script.on_event(defines.events.on_robot_mined_entity, Event_on_robot_mined_entity)
script.on_event(defines.events.on_rocket_launched, Event_on_rocket_launched)
script.on_event(defines.events.on_sector_scanned, Event_on_sector_scanned)
script.on_event(defines.events.on_tick, Event_on_tick)
script.on_event(defines.events.on_gui_selected_tab_changed, Event_on_gui_selected_tab_changed)

--------------------------------- TEST AREA ------------------------------------------

------------------------------- END TEST AREA ----------------------------------------

--remote calls
remote.add_interface("DyWorld",
{  
	Chart = function(AMOUNT)
		game.forces.player.chart(game.player.surface, {lefttop = {x = -AMOUNT, y = -AMOUNT}, rightbottom = {x = AMOUNT, y = AMOUNT}})
	end,
	
	Regenerate_Ore = function(NAME)
		game.regenerate_entity(NAME)
	end,
	
	Unlock_Recipes = function()
		Reunlock_Recipes()
	end,
	
	Skip_Phase = function(nmb)
		nmb = nmb or 1
		for i = 1,nmb do
			Phase_Forward()
		end
	end,
	
	Debug_Start = function()
		game.players[1].insert{name = "gun-turret", count = 100}
		game.players[1].insert{name = "firearm-magazine", count = 1000}
		game.players[1].insert{name = "coal", count = 1000}
		game.players[1].insert{name = "wooden-chest", count = 100}
		game.players[1].insert{name = "burner-mining-drill", count = 50}
		game.players[1].insert{name = "electric-mining-drill", count = 50}
		game.players[1].insert{name = "substation", count = 50}
		game.players[1].insert{name = "solar-panel", count = 50}
	end,
})

--commands.add_command("dyworld-debug-items", "Debug time :) (only for player 1!)", Debug_Items())