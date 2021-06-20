
--debugger = true
debugger = settings.startup["DyWorld_Debug"].value
Version_Build = "0.7.96"

function Dy_Log(String)
	if settings.startup["DyWorld_Debug"].value then
		log(String)
	end
end

-- LuaLib
require "script/lualib/function"
require "script/lualib/debug"
require "script/lualib/player"
require "script/lualib/gui"
inspect = require("script/lualib/inspect")
require("script/database/recipes")
require("script/database/inserter")
require("script/database/food")
require("script/lualib/inserter")

-- GUI
require "script/gui/main-gui"
require "script/gui/story-gui"

-- Stats
require "script/stats/functions"
require "script/stats/food"

-- Story
require "script/story/story"
require "script/story/functions"
require "script/database/informatron"

-- Event Handlers --
require "script/events/keys"
require "script/events/build-events"
require "script/events/craft-events"
require "script/events/mine-events"
require "script/events/gui-events"
require "script/events/kill-events"
require "script/events/misc-events"
require "script/events/player-events"

require "script/events/on_configuration_changed"
require "script/events/on_init"
require "script/events/on_tick"

-- Config Events
script.on_configuration_changed(Event_on_configuration_changed)
script.on_init(Event_on_init)
script.on_event(defines.events.on_tick, Event_on_tick)

-- Build Events --
script.on_event(defines.events.on_built_entity, Event_on_built_entity)
script.on_event(defines.events.on_robot_built_entity, Event_on_robot_built_entity)
--script.on_event(defines.events.script_raised_built, Event_script_raised_built)
script.on_event(defines.events.script_raised_revive, Event_script_raised_revive)
script.on_event(defines.events.on_player_used_capsule, Event_on_player_used_capsule)

-- Mine Events
script.on_event(defines.events.on_player_mined_entity, Event_on_player_mined_entity)
script.on_event(defines.events.on_player_mined_item, Event_on_player_mined_item)
script.on_event(defines.events.on_robot_mined, Event_on_robot_mined)
script.on_event(defines.events.on_robot_mined_entity, Event_on_robot_mined_entity)

-- Craft Events
script.on_event(defines.events.on_player_crafted_item, Event_on_player_crafted_item)

-- Kill Events
script.on_event(defines.events.on_entity_died, Event_on_entity_died)

-- Research Events
script.on_event(defines.events.on_research_finished, Event_on_research_finished)

-- Misc Events
script.on_event(defines.events.on_chunk_generated, Event_on_chunk_generated)
script.on_event(defines.events.on_picked_up_item, Event_on_picked_up_item)
script.on_event(defines.events.on_rocket_launched, Event_on_rocket_launched)
script.on_event(defines.events.on_sector_scanned, Event_on_sector_scanned)
script.on_event(defines.events.on_character_corpse_expired, Event_on_character_corpse_expired)

-- Player Events
script.on_event(defines.events.on_player_changed_force, Event_on_player_changed_force)
script.on_event(defines.events.on_player_created, Event_on_player_created)
script.on_event(defines.events.on_player_died, Event_on_player_died)
script.on_event(defines.events.on_player_joined_game, Event_on_player_joined_game)
script.on_event(defines.events.on_player_left_game, Event_on_player_left_game)
script.on_event(defines.events.on_pre_player_mined_item, Event_on_pre_player_mined_item)

-- GUI Events
script.on_event(defines.events.on_gui_click, Event_on_gui_click)
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
	
	Migrate = function()
		Reunlock_Recipes()
	end,
	
	Pick_Random_Attack_Location = function()
		Pick_Random_Attack_Location()
	end,
	
	Story_Start = function()
		global.dyworld_story = true
	end,
	
	Skip_Phase = function(nmb)
		nmb = nmb or 1
		for i = 1,nmb do
			Phase_Forward()
		end
	end,
	
	allow_aai_crash_sequence = function(data) return {allow = false, weight = 1} end,
	
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
	
	informatron_menu = function(data)
		return dyworld_menu(data.player_index)
	end,
	
	informatron_page_content = function(data)
		return dyworld_page_content(data.page_name, data.player_index, data.element)
	end
})

--commands.add_command("dyworld-debug-items", "Debug time :) (only for player 1!)", Debug_Items())