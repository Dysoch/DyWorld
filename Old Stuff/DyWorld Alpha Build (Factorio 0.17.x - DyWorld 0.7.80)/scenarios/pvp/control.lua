local silo_script = require("silo-script")
local pvp = require("pvp")

silo_script.add_remote_interface()

script.on_init(function ()
  if not settings.startup["DyWorld_PvP"].value then
	error("Enable PvP option in DyWorld Options to make sure no error happen and the game runs smoothly")
  end
  silo_script.on_init()
  global.silo_script.finish_on_launch = false
  pvp.on_init()
end)

script.on_configuration_changed(function()
  pvp.on_configuration_changed()
end)

script.on_event(defines.events.on_rocket_launched, function (event)
  pvp.on_rocket_launched(event)
end)

script.on_event(defines.events.on_entity_died, function (event)
  pvp.on_entity_died(event)
end)

script.on_event(defines.events.on_player_joined_game, function(event)
  pvp.on_player_joined_game(event)
end)

script.on_event(defines.events.on_player_respawned, function(event)
  pvp.on_player_respawned(event)
end)

script.on_event(defines.events.on_gui_selection_state_changed, function(event)
  pvp.on_gui_selection_state_changed(event)
end)

script.on_event(defines.events.on_gui_checked_state_changed, function (event)
  pvp.on_gui_checked_state_changed(event)
end)

script.on_event(defines.events.on_player_left_game, function(event)
  pvp.on_player_left_game(event)
end)

script.on_event(defines.events.on_gui_click, function(event)
  pvp.on_gui_click(event)
  silo_script.on_gui_click(event)
end)

script.on_event(defines.events.on_gui_closed, function(event)
  pvp.on_gui_closed(event)
end)

script.on_event(defines.events.on_tick, function(event)
  pvp.on_tick(event)
end)

script.on_event(defines.events.on_chunk_generated, function(event)
  pvp.on_chunk_generated(event)
end)

script.on_event(defines.events.on_gui_elem_changed, function(event)
  pvp.on_gui_elem_changed(event)
end)

script.on_event(defines.events.on_player_crafted_item, function(event)
  pvp.on_player_crafted_item(event)
end)

script.on_event(defines.events.on_player_display_resolution_changed, function(event)
  pvp.on_player_display_resolution_changed(event)
end)

script.on_event(defines.events.on_research_finished, function(event)
  pvp.on_research_finished(event)
end)

script.on_event(defines.events.on_player_cursor_stack_changed, function(event)
  pvp.on_player_cursor_stack_changed(event)
end)

script.on_event(defines.events.on_built_entity, function(event)
  pvp.on_built_entity(event)
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
  pvp.on_robot_built_entity(event)
end)

script.on_event(defines.events.on_research_started, function(event)
  pvp.on_research_started(event)
end)

script.on_event(defines.events.on_player_promoted, function(event)
  pvp.on_player_promoted(event)
end)

script.on_event(defines.events.on_player_demoted, function(event)
  pvp.on_player_promoted(event)
end)

script.on_event(defines.events.on_forces_merged, function(event)
  pvp.on_forces_merged(event)
end)

for n, event in pairs (pvp.on_nth_tick) do
  script.on_nth_tick(n, event)
end
