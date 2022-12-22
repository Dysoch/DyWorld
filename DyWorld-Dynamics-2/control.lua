debugger = settings.startup["DyWorld_Debug"].value or nil
Version_Build = "0.0.1"

-- LuaLib
require("script.lualib.debug")

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
script.on_event(defines.events.on_tick, Event_on_tick)

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
script.on_event(defines.events.on_player_ammo_inventory_changed, Event_on_player_inventory_changed_ammo)
script.on_event(defines.events.on_player_armor_inventory_changed, Event_on_player_inventory_changed_armor)
script.on_event(defines.events.on_player_gun_inventory_changed, Event_on_player_inventory_changed_gun)
script.on_event(defines.events.on_player_main_inventory_changed, Event_on_player_inventory_changed_main)
script.on_event(defines.events.on_player_trash_inventory_changed, Event_on_player_inventory_changed_trash)

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