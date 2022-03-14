require("data.prefix")
require("data.prefix-data")

debugger = Dy_Sett.Debug
Version_Build = "0.2.2"
Food_Start = debugger and 250000 or settings.global["DyWorld_Surival_Difficulty"].value == "Easy" and 25000 or settings.global["DyWorld_Surival_Difficulty"].value == "Normal" and 2500 or settings.global["DyWorld_Surival_Difficulty"].value == "Hard" and 1600 or settings.global["DyWorld_Surival_Difficulty"].value == "Insane" and 800 or 2500
Water_Start = debugger and 500000 or settings.global["DyWorld_Surival_Difficulty"].value == "Easy" and 50000 or settings.global["DyWorld_Surival_Difficulty"].value == "Normal" and 5000 or settings.global["DyWorld_Surival_Difficulty"].value == "Hard" and 2500 or settings.global["DyWorld_Surival_Difficulty"].value == "Insane" and 1250 or 5000 

-- LuaLib
require("script.lualib.function")
require("script.lualib.debug")
require("script.lualib.player")
require("script.lualib.player-ambush")
require("script.lualib.custom-attack")
require("script.lualib.gui")
require("script.lualib.terrain")
require("script.lualib.space-mining")
inspect = require("script.lualib.inspect")
require("script.database.recipes")
require("script.database.inserter")
require("script.database.vitals")
require("script.database.implants")
require("script.database.dyson")
require("script.database.mining")
require("script.database.objectives-side")
require("script.database.story")
require("script.lualib.inserter")

-- GUI
require("script.gui.main-gui")
require("script.gui.story-gui")
require("script.gui.smn-gui")
require("script.gui.personal-gui")

-- Stats
require("script.stats.functions")
require("script.stats.food")
require("script.stats.implants")
require("script.stats.vitals")

-- Story
require("script.story.story")
require("script.story.functions")
require("script.database.informatron")

-- Event Handlers --
require("script.events.keys")
require("script.events.build-events")
require("script.events.craft-events")
require("script.events.inventory-events")
require("script.events.mine-events")
require("script.events.gui-events")
require("script.events.kill-events")
require("script.events.misc-events")
require("script.events.player-events")

require("script.events.on_configuration_changed")
require("script.events.on_init")
require("script.events.on_tick")

require("script.events.remote")

-- Config Events
script.on_configuration_changed(Event_on_configuration_changed)
script.on_init(Event_on_init)
-- script.on_event(defines.events.on_tick, Event_on_tick)

-- Build Events --
script.on_event(defines.events.script_raised_built, Event_script_raised_built)
script.on_event(defines.events.script_raised_revive, Event_script_raised_revive)
script.on_event(defines.events.on_built_entity, Event_on_built_entity)
script.on_event(defines.events.on_robot_built_entity, Event_on_robot_built_entity)
script.on_event(defines.events.on_player_used_capsule, Event_on_player_used_capsule)
script.on_event(defines.events.on_player_built_tile, Event_on_player_built_tile)
script.on_event(defines.events.on_robot_built_tile, Event_on_robot_built_tile)
--script.on_event(defines.events.on_trigger_created_entity, Event_built_test)

-- Mine Events
script.on_event(defines.events.on_player_mined_entity, Event_on_player_mined_entity)
script.on_event(defines.events.on_player_mined_item, Event_on_player_mined_item)
script.on_event(defines.events.on_robot_mined, Event_on_robot_mined)
script.on_event(defines.events.on_robot_mined_entity, Event_on_robot_mined_entity)

-- Craft Events
script.on_event(defines.events.on_player_crafted_item, Event_on_player_crafted_item)

-- Kill Events
script.on_event(defines.events.on_entity_died, Event_on_entity_died)
script.on_event(defines.events.script_raised_destroy, Event_script_raised_destroy)

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
script.on_event(defines.events.on_player_respawned, Event_on_player_respawned)
--script.on_event(defines.events.on_player_respawned_event, Event_on_player_respawned_script)
script.on_event(defines.events.on_player_died, Event_on_player_died)
script.on_event(defines.events.on_pre_player_died, Event_on_pre_player_died)
--script.on_event(defines.events.on_player_joined_game, Event_on_player_joined_game)
--script.on_event(defines.events.on_player_left_game, Event_on_player_left_game)
script.on_event(defines.events.on_pre_player_mined_item, Event_on_pre_player_mined_item)

-- Player Inventory Events
script.on_event(defines.events.on_player_ammo_inventory_changed, Event_on_player_inventory_changed)
script.on_event(defines.events.on_player_armor_inventory_changed, Event_on_player_inventory_changed)
script.on_event(defines.events.on_player_gun_inventory_changed, Event_on_player_inventory_changed)
script.on_event(defines.events.on_player_main_inventory_changed, Event_on_player_inventory_changed)
script.on_event(defines.events.on_player_trash_inventory_changed, Event_on_player_inventory_changed)

-- GUI Events
script.on_event(defines.events.on_gui_click, Event_on_gui_click)
script.on_event(defines.events.on_gui_closed, Event_on_gui_closed)
script.on_event(defines.events.on_gui_elem_changed, Event_on_gui_elem_changed)
script.on_event(defines.events.on_gui_location_changed, Event_on_gui_location_changed)
script.on_event(defines.events.on_gui_opened, Event_on_gui_opened)
--script.on_event(defines.events.on_gui_selection_state_changed, Event_on_gui_closed)
--script.on_event(defines.events.on_gui_switch_state_changed, Event_on_gui_closed)
--script.on_event(defines.events.on_gui_text_changed, Event_on_gui_closed)
--script.on_event(defines.events.on_gui_value_changed, Event_on_gui_closed)
script.on_event(defines.events.on_gui_selected_tab_changed, Event_on_gui_selected_tab_changed)



--------------------------------- TEST AREA ------------------------------------------
------------------------------- END TEST AREA ----------------------------------------
