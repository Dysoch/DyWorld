local util = require("util")
local crash_site = require("crash-site")

local created_items = function()
  return
  {
    ["762mm-gun"] = 1,
    ["basic-762mm-turret"] = 50,
    ["762mm-bullet-ap"] = 5000,
    ["coal"] = 1000,
    ["transport-belt-5"] = 1000,
    ["underground-belt-5"] = 1000,
    ["loader-5"] = 1000,
    ["splitter-5"] = 1000,
    ["aai-storehouse"] = 50,
    ["aai-storehouse-passive-provider"] = 50,
    ["aai-storehouse-requester"] = 50,
    ["aai-storehouse-storage"] = 50,
    ["aai-warehouse"] = 50,
    ["aai-warehouse-passive-provider"] = 50,
    ["aai-warehouse-requester"] = 50,
    ["aai-warehouse-storage"] = 50,
    ["basic-electric-drill"] = 50,
    ["radar-4"] = 50,
    ["roboport-3"] = 50,
    ["construction-robot-3"] = 50,
    ["logistic-robot-3"] = 50,
    ["accumulator"] = 50,
    ["substation"] = 50,
    ["normal-inserter"] = 50,
    ["basic-inserter"] = 50,
    ["solar-panel"] = 50,
    ["usage-reduction-1"] = 1,
    ["usage-reduction-2"] = 1,
    ["usage-reduction-3"] = 1,
    ["usage-reduction-4"] = 1,
    ["usage-reduction-5"] = 1,
    ["death-implant-1"] = 1,
    ["death-implant-2"] = 1,
    ["death-implant-3"] = 1,
    ["death-implant-4"] = 1,
    ["death-implant-5"] = 1,
  }
end

local respawn_items = function()
  return
  {
    ["pistol"] = 1,
    ["firearm-magazine"] = 10
  }
end

local ship_items = function()
  return
  {
    ["9mm-mag-bronze"] = math.random(100, 400),
    ["copper-plate"] = math.random(15, 25),
    ["iron-plate"] = math.random(5, 10),
    ["9mm-pistol"] = 1,
    ["car-1"] = 1,
    ["gun-nano-emitter"] = 1,
    ["medpack-2"] = math.random(2, 5),
  }
end

local debris_items = function()
  return
  {
    ["iron-plate"] = math.random(5, 25),
    ["copper-plate"] = math.random(5, 25),
    ["tin-plate"] = math.random(5, 15),
    ["bronze-plate"] = math.random(1, 10),
    ["9mm-mag-bronze"] = math.random(25, 125),
  }
end

local chart_starting_area = function()

  local r = global.chart_distance or 350
  local force = game.forces.player
  local surface = game.surfaces[1]
  local origin = force.get_spawn_position(surface)
  force.chart(surface, {{origin.x - r, origin.y - r}, {origin.x + r, origin.y + r}})

end


local on_player_created = function(event)
  local player = game.players[event.player_index]
	if settings.startup["DyWorld_Debug"].value then
		util.insert_safe(player, global.created_items)
	end

  if not global.init_ran then

    --This is so that other mods and scripts have a chance to do remote calls before we do things like charting the starting area, creating the crash site, etc.
    global.init_ran = true

    chart_starting_area()

    if not global.disable_crashsite then
      local surface = player.surface
      surface.daytime = 0.7
      crash_site.create_crash_site(surface, {-5,-6}, util.copy(global.crashed_ship_items), util.copy(global.crashed_debris_items))
      util.remove_safe(player, global.crashed_ship_items)
      util.remove_safe(player, global.crashed_debris_items)
      player.get_main_inventory().sort_and_merge()
      if player.character then
        player.character.destructible = false
      end
      crash_site.create_cutscene(player, {-5, -4})
      return
    end

  end

  if not global.skip_intro then
    if game.is_multiplayer() then
      player.print({"msg-intro"})
      player.print({"msg-intro-2"})
    else
      game.show_message_dialog{text = {"msg-intro"}}
      game.show_message_dialog{text = {"msg-intro-2"}}
      --game.show_message_dialog{}
    end
  end

end

local on_player_respawned = function(event)
  local player = game.players[event.player_index]
  --util.insert_safe(player, global.respawn_items)
  -- DyWorld gives player items in the spaceship never on respawn
end

local on_cutscene_waypoint_reached = function(event)
  if not crash_site.is_crash_site_cutscene(event) then return end

  local player = game.get_player(event.player_index)
    
  player.exit_cutscene()

  if not global.skip_intro then
    if game.is_multiplayer() then
      player.print({"msg-intro"})
      player.print({"msg-intro-2"})
    else
      game.show_message_dialog{text = {"msg-intro"}}
      game.show_message_dialog{text = {"msg-intro-2"}}
    end
  end
end

local skip_crash_site_cutscene = function(event)
  if event.player_index ~= 1 then return end
  if event.tick > 2000 then return end

  local player = game.get_player(event.player_index)
  if player.controller_type == defines.controllers.cutscene then
    player.exit_cutscene()
  end

end

local on_cutscene_cancelled = function(event)
  local player = game.get_player(event.player_index)
  if player.gui.screen.skip_cutscene_label then
    player.gui.screen.skip_cutscene_label.destroy()
  end
  if player.character then
    player.character.destructible = true
  end
  player.zoom = 1.5
end

local on_player_display_refresh = function(event)
  crash_site.on_player_display_refresh(event)
end

local freeplay_interface =
{
  get_created_items = function()
    return global.created_items
  end,
  set_created_items = function(map)
    global.created_items = map or error("Remote call parameter to freeplay set created items can't be nil.")
  end,
  get_respawn_items = function()
    return global.respawn_items
  end,
  set_respawn_items = function(map)
    global.respawn_items = map or error("Remote call parameter to freeplay set respawn items can't be nil.")
  end,
  set_skip_intro = function(bool)
    global.skip_intro = bool
  end,
  set_chart_distance = function(value)
    global.chart_distance = tonumber(value) or error("Remote call parameter to freeplay set chart distance must be a number")
  end,
  set_disable_crashsite = function(bool)
    global.disable_crashsite = bool
  end,
  get_ship_items = function()
    return global.crashed_ship_items
  end,
  set_ship_items = function(map)
    global.crashed_ship_items = map or error("Remote call parameter to freeplay set created items can't be nil.")
  end,
  get_debris_items = function()
    return global.crashed_debris_items
  end,
  set_debris_items = function(map)
    global.crashed_debris_items = map or error("Remote call parameter to freeplay set respawn items can't be nil.")
  end
}

if not remote.interfaces["freeplay"] then
  remote.add_interface("freeplay", freeplay_interface)
end

local is_debug = function()
  local surface = game.surfaces.nauvis
  local map_gen_settings = surface.map_gen_settings
  return map_gen_settings.width == 50 and map_gen_settings.height == 50
end

local freeplay = {}

freeplay.events =
{
  [defines.events.on_player_created] = on_player_created,
  [defines.events.on_player_respawned] = on_player_respawned,
  [defines.events.on_cutscene_waypoint_reached] = on_cutscene_waypoint_reached,
  ["crash-site-skip-cutscene"] = skip_crash_site_cutscene,
  [defines.events.on_player_display_resolution_changed] = on_player_display_refresh,
  [defines.events.on_player_display_scale_changed] = on_player_display_refresh,
  [defines.events.on_cutscene_cancelled] = on_cutscene_cancelled
}

freeplay.on_configuration_changed = function()
  global.created_items = global.created_items or created_items()
  global.respawn_items = global.respawn_items or respawn_items()
  global.crashed_ship_items = global.crashed_ship_items or ship_items()
  global.crashed_debris_items = global.crashed_debris_items or debris_items()

  if not global.init_ran then
    -- migrating old saves.
    global.init_ran = #game.players > 0
  end
end

freeplay.on_init = function()
  global.created_items = created_items()
  global.respawn_items = respawn_items()
  global.crashed_ship_items = ship_items()
  global.crashed_debris_items = debris_items()
  remote.call("DyWorld", "Story_Start")

  if is_debug() then
    global.skip_intro = true
    global.disable_crashsite = true
  end

end

return freeplay
