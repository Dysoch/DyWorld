require("config")
require("balance")
local mod_gui = require("mod-gui")
require("production-score")
local util = require("util")

local statistics_period = 150 -- Seconds

local events =
{
  on_round_end = script.generate_event_name(),
  on_round_start = script.generate_event_name(),
  on_team_lost = script.generate_event_name(),
  on_team_won = script.generate_event_name()
}

remote.add_interface("pvp",
{
  get_event_name = function(name)
    return events[name]
  end,
  get_teams = function()
    return global.teams
  end
})

function create_spawn_positions()
  local config = global.map_config
  local width = config.map_width
  local height = config.map_height
  local displacement = math.max(config.average_team_displacement, 64)
  local horizontal_offset = (width/displacement) * 10
  local vertical_offset = (height/displacement) * 10
  global.spawn_offset = {x = math.floor(0.5 + math.random(-horizontal_offset, horizontal_offset) / 32) * 32, y = math.floor(0.5 + math.random(-vertical_offset, vertical_offset) / 32) * 32}
  local height_scale = height/width
  local radius = get_starting_area_radius()
  local count = #global.teams
  local max_distance = get_starting_area_radius(true) * 2 + displacement
  local min_distance = get_starting_area_radius(true) + (32 * (count - 1))
  local edge_addition = (radius + 2) * 32
  local elevator_set = false
  if height_scale == 1 then
    if max_distance > width then
      displacement = width - edge_addition
    end
  end
  if height_scale < 1 then
    if #global.teams == 2 then
      if max_distance > width then
        displacement = width - edge_addition
      end
      max_distance = 0
    end
    if max_distance > height then
      displacement = height - edge_addition
    end
  end
  if height_scale > 1 then
    if #global.teams == 2 then
      if max_distance > height then
        displacement = height - edge_addition
      end
      elevator_set = true
      max_distance = 0
    end
    if max_distance > width then
      displacement = width - edge_addition
    end
  end
  local distance = 0.5*displacement
  if distance < min_distance then
    game.print({"map-size-below-minimum"})
  end
  local positions = {}
  if count == 1 then
    positions[1] = {x = 0, y = 0}
  else
    for k = 1, count do
      local rotation = (k*2*math.pi)/count
      local X = 32*(math.floor((math.cos(rotation)*distance+0.5)/32))
      local Y = 32*(math.floor((math.sin(rotation)*distance+0.5)/32))
      if elevator_set then
        --[[Swap X and Y for elevators]]
        Y = 32*(math.floor((math.cos(rotation)*distance+0.5)/32))
        X = 32*(math.floor((math.sin(rotation)*distance+0.5)/32))
      end
      positions[k] = {x = X, y = Y}
    end
  end
  if #positions == 2 and height_scale == 1 then
    --If there are 2 teams in a square map, we adjust positions so they are in the corners of the map
    for k, position in pairs (positions) do
      if position.x == 0 then position.x = position.y end
      if position.y == 0 then position.y = -position.x end
    end
  end
  if #positions == 4 then
    --If there are 4 teams we adjust positions so they are in the corners of the map
    height_scale = math.min(height_scale, 2)
    height_scale = math.max(height_scale, 0.5)
    for k, position in pairs (positions) do
      if position.x == 0 then position.x = position.y end
      if position.y == 0 then position.y = -position.x end
      if height_scale > 1 then
        position.y = position.y * height_scale
      else
        position.x = position.x * (1/height_scale)
      end
    end
    if height_scale < 1 then
      --If the map is wider than tall, swap 1 and 3 so two allied teams will be together
      positions[1], positions[3] = positions[3], positions[1]
    end
  end
  for k, position in pairs (positions) do
    position.x = position.x + global.spawn_offset.x
    position.y = position.y + global.spawn_offset.y
  end
  global.spawn_positions = positions
  --error(serpent.block(positions))
  return positions
end

function create_next_surface()
  local name = "battle_surface_1"
  if game.surfaces[name] ~= nil then
    name = "battle_surface_2"
  end
  global.round_number = global.round_number + 1
  local settings = game.surfaces[1].map_gen_settings
  settings.starting_area = global.map_config.starting_area_size.selected
  if global.map_config.biters_disabled then
    settings.autoplace_controls["enemy-base"].size = "none"
  end
  if global.map_config.map_seed == 0 then
    settings.seed = math.random(4000000000)
  else
    settings.seed = global.map_config.map_seed
  end
  settings.height = global.map_config.map_height
  settings.width = global.map_config.map_width
  settings.starting_points = create_spawn_positions()
  global.surface = game.create_surface(name, settings)
  global.surface.daytime = 0
  global.surface.always_day = global.map_config.always_day
end

function destroy_player_gui(player)
  local button_flow = mod_gui.get_button_flow(player)
  for k, name in pairs (
    {
      "objective_button", "diplomacy_button", "admin_button",
      "silo_gui_sprite_button", "production_score_button", "oil_harvest_button",
      "space_race_button", "spectator_join_team_button", "list_teams_button"
    }) do
    if button_flow[name] then
      button_flow[name].destroy()
    end
  end
  local frame_flow = mod_gui.get_frame_flow(player)
  for k, name in pairs (
    {
      "objective_frame", "admin_button", "admin_frame",
      "silo_gui_frame", "production_score_frame", "oil_harvest_frame",
      "space_race_frame", "team_list"
    }) do
    if frame_flow[name] then
      frame_flow[name].destroy()
    end
  end
  local center_gui = player.gui.center
  for k, name in pairs ({"diplomacy_frame", "progress_bar"}) do
    if center_gui[name] then
      center_gui[name].destroy()
    end
  end
end

function destroy_joining_guis(gui)
  if gui.random_join_frame then
    gui.random_join_frame.destroy()
  end
  if gui.pick_join_frame then
    gui.pick_join_frame.destroy()
  end
  if gui.auto_assign_frame then
    gui.auto_assign_frame.destroy()
  end
end

function make_color_dropdown(k, gui)
  local team = global.teams[k]
  local menu = gui.add{type = "drop-down", name = k.."_color"}
  local count = 1
  for k, color in pairs (global.colors) do
    menu.add_item({"color."..color.name})
    if color.name == team.color then
      menu.selected_index = count
    end
    count = count + 1
  end
end

function add_team_to_team_table(gui, k)
  local team = global.teams[k]
  local textfield = gui.add{type = "textfield", name = k, text = team.name}
  textfield.style.minimal_width = 0
  textfield.style.horizontally_stretchable = true
  make_color_dropdown(k, gui)
  local caption
  if tonumber(team.team) then
    caption = team.team
  elseif team.team:find("?") then
    caption = "?"
  else
    caption = team.team
  end
  set_button_style(gui.add{type = "button", name = k.."_next_team_button", caption = caption, tooltip = {"team-button-tooltip"}})
  local bin = gui.add{name = k.."_trash_button", type = "sprite-button", sprite = "utility/trash_bin", tooltip = {"remove-team-tooltip"}}
  bin.style.top_padding = 0
  bin.style.bottom_padding = 0
  bin.style.right_padding = 0
  bin.style.left_padding = 0
  bin.style.minimal_height = 26
  bin.style.minimal_width = 26
end

function create_game_config_gui(gui)
  local name = "game_config_gui"
  local frame = gui[name]
  if frame then
    frame.clear()
  else
    frame = gui.add{type = "frame", name = name, caption = {"game-config-gui"}, direction = "vertical", style = "inner_frame"}
  end
  make_config_table(frame, global.game_config)
  create_disable_frame(frame)
end

function create_team_config_gui(gui)
  local name = "team_config_gui"
  local frame = gui[name]
  if frame then
    frame.clear()
  else
    frame = gui.add{type = "frame", name = name, caption = {"team-config-gui"}, direction = "vertical", style = "inner_frame"}
  end
  local inner_frame = frame.add{type = "frame", style = "image_frame", name = "team_config_gui_inner_frame", direction = "vertical"}
  inner_frame.style.left_padding = 8
  inner_frame.style.right_padding = 8
  inner_frame.style.top_padding = 8
  inner_frame.style.bottom_padding = 8
  local scroll = inner_frame.add{type = "scroll-pane", name = "team_config_gui_scroll"}
  scroll.style.maximal_height = 200
  local team_table = scroll.add{type = "table", column_count = 4, name = "team_table"}
  for k, name in pairs ({"team-name", "color", "team", "remove"}) do
    team_table.add{type = "label", caption = {name}}
  end
  for k, team in pairs (global.teams) do
    add_team_to_team_table(team_table, k)
  end
  set_button_style(inner_frame.add{name = "add_team_button", type = "button", caption = {"add-team"}, tooltip = {"add-team-tooltip"}})
  make_config_table(frame, global.team_config)
end

function get_config_holder(player)
  local gui = player.gui.center
  local frame = gui.config_holding_frame
  if frame then return frame.scrollpane.horizontal_flow end
  frame = gui.add{name = "config_holding_frame", type = "frame", direction = "vertical"}
  frame.style.scaleable = false
  frame.style.maximal_height = player.display_resolution.height * 0.95
  frame.style.maximal_width = player.display_resolution.width * 0.95
  local scroll = frame.add{name = "scrollpane", type = "scroll-pane"}
  local flow = scroll.add{name = "horizontal_flow", type = "table", column_count = 4}
  flow.draw_vertical_lines = true
  flow.style.horizontal_spacing = 32
  flow.style.horizontally_stretchable = true
  flow.style.horizontally_squashable = true
  return flow
end

function get_config_frame(player)
  local gui = player.gui.center
  local frame = gui.config_holding_frame
  if frame then return frame end
  get_config_holder(player)
  return gui.config_holding_frame
end

function check_config_frame_size(event)
  local player = game.players[event.player_index]
  if not player then return end
  local frame = player.gui.center.config_holding_frame
  if not frame then return end
  local visiblity = frame.style.visible
  frame.destroy()
  --In this case, it is better to destroy and re-create, instead of handling the sizing and scaling of all the elements in the gui
  create_config_gui(player)
  get_config_frame(player).style.visible = visiblity
end

function check_balance_frame_size(event)
  local player = game.players[event.player_index]
  if not player then return end
  local frame = player.gui.center.balance_options_frame
  if not frame then return end
  toggle_balance_options_gui(player)
  toggle_balance_options_gui(player)
end

function create_config_gui(player)
  local gui = get_config_holder(player)
  create_map_config_gui(gui)
  create_game_config_gui(gui)
  create_team_config_gui(gui)
  local frame = get_config_frame(player)
  if not frame.config_holder_button_flow then
    local button_flow = frame.add{type = "flow", direction = "horizontal", name = "config_holder_button_flow"}
    button_flow.style.horizontally_stretchable = true
    button_flow.add{type = "button", name = "balance_options", caption = {"balance-options"}}
    local spacer = button_flow.add{type = "flow"}
    spacer.style.horizontally_stretchable = true
    button_flow.add{type = "sprite-button", name = "pvp_export_button", sprite = "utility/export_slot", tooltip = {"gui.export-to-string"}, style = "slot_button"}
    button_flow.add{type = "sprite-button", name = "pvp_import_button", sprite = "utility/import_slot", tooltip = {"gui-blueprint-library.import-string"}, style = "slot_button"}
    button_flow.add{type = "button", name = "config_confirm", caption = {"config-confirm"}}
  end
  set_mode_input(player)
end

function create_map_config_gui(gui)
  local name = "map_config_gui"
  local frame = gui[name]
  if frame then
    frame.clear()
  else
    frame = gui.add{type = "frame", name = name, caption = {"map-config-gui"}, direction = "vertical", style = "inner_frame"}
  end
  make_config_table(frame, global.map_config)
end

function create_waiting_gui(player)
  local gui = player.gui.center
  local frame = gui.add{type = "frame", name = "waiting_frame"}
  local label = frame.add{type = "label", caption = {"setup-in-progress"}}
end

function end_round(admin)
  for k, player in pairs (game.players) do
    player.force = game.forces.player
    player.tag = ""
    destroy_player_gui(player)
    destroy_joining_guis(player.gui.center)
    if player.connected then
      if player.ticks_to_respawn then
        player.ticks_to_respawn = nil
      end
      local character = player.character
      player.character = nil
      if character then character.destroy() end
      player.set_controller{type = defines.controllers.ghost}
      player.teleport({0,1000}, game.surfaces.Lobby)
      if player.admin then
        create_config_gui(player)
      else
        create_waiting_gui(player)
      end
    end
  end
  if global.surface ~= nil then
    game.delete_surface(global.surface)
  end
  if admin then
    game.print({"admin-ended-round", admin.name})
  end
  global.setup_finished = false
  global.check_starting_area_generation = false
  global.average_score = nil
  global.scores = nil
  global.exclusion_map = nil
  global.protected_teams = nil
  global.check_base_exclusion = nil
  global.oil_harvest_scores = nil
  global.production_scores = nil
  global.space_race_scores = nil
  global.last_defcon_tick = nil
  global.next_defcon_tech = nil
  global.silos = nil
  script.raise_event(events.on_round_end, {})
end

function prepare_next_round()
  global.setup_finished = false
  global.team_won = false
  create_next_surface()
  setup_teams()
  chart_starting_area_for_force_spawns()
  set_evolution_factor()
end

function set_mode_input(player)
  if not (player and player.valid and player.gui.center.config_holding_frame) then return end
  local visibility_map = {
    required_production_score = function(gui)
      local dropdown = gui.game_mode_dropdown
      if not dropdown then return end
      local name = global.game_config.game_mode.options[dropdown.selected_index]
      return name == "production_score"
    end,
    required_oil_barrels = function(gui)
      local dropdown = gui.game_mode_dropdown
      if not dropdown then return end
      local name = global.game_config.game_mode.options[dropdown.selected_index]
      return name == "oil_harvest"
    end,
    oil_only_in_center = function(gui)
      local dropdown = gui.game_mode_dropdown
      if not dropdown then return end
      local name = global.game_config.game_mode.options[dropdown.selected_index]
      return name == "oil_harvest"
    end,
    time_limit = function(gui)
      local dropdown = gui.game_mode_dropdown
      if not dropdown then return end
      local name = global.game_config.game_mode.options[dropdown.selected_index]
      return name == "oil_harvest" or name == "production_score"
    end,
    spectator_fog_of_war = function(gui) return gui.allow_spectators_boolean and gui.allow_spectators_boolean.state end,
    starting_chest_multiplier = function(gui)
      local dropdown = gui.starting_chest_dropdown
      local name = global.team_config.starting_chest.options[dropdown.selected_index]
      return name ~= "none"
    end,
    disband_on_loss = function(gui)
      local dropdown = gui.game_mode_dropdown
      if not dropdown then return end
      local name = global.game_config.game_mode.options[dropdown.selected_index]
      return name == "conquest" or name == "last_silo_standing"
    end,
    give_artillery_remote = function(gui)
      local option = gui.team_artillery_boolean
      if not option then return end
      return option.state
    end,
    turret_ammunition = function(gui)
      local option = gui.team_turrets_boolean
      if not option then return end
      return option.state
    end,
    required_satellites_sent = function(gui)
      local dropdown = gui.game_mode_dropdown
      if not dropdown then return end
      local name = global.game_config.game_mode.options[dropdown.selected_index]
      return name == "space_race"
    end,
    defcon_timer = function(gui)
      local option = gui.defcon_mode_boolean
      if not option then return end
      return option.state
    end,
    who_decides_diplomacy = function(gui)
      local option = gui.diplomacy_enabled_boolean
      if not option then return end
      return option.state
    end,

  }
  local gui = get_config_holder(player)
  for k, frame in pairs ({gui.map_config_gui, gui.game_config_gui, gui.team_config_gui}) do
    if frame and frame.valid then
      local config = frame.config_table
      if (config and config.valid) then
        local children = config.children
        for k, child in pairs (children) do
          local name = child.name or ""
          local mapped = visibility_map[name]
          if mapped then
            local bool = mapped(config)
            children[k].style.visible = bool
            children[k+1].style.visible = bool
          end
        end
      end
    end
  end
end

game_mode_buttons = {
  ["production_score"] = {type = "button", caption = {"production_score"}, name = "production_score_button", style = mod_gui.button_style},
  ["oil_harvest"] = {type = "button", caption = {"oil_harvest"}, name = "oil_harvest_button", style = mod_gui.button_style},
  ["space_race"] = {type = "button", caption = {"space_race"}, name = "space_race_button", style = mod_gui.button_style}
}

function init_player_gui(player)
  destroy_player_gui(player)
  if not global.setup_finished then return end
  local button_flow = mod_gui.get_button_flow(player)
  button_flow.add{type = "button", caption = {"objective"}, name = "objective_button", style = mod_gui.button_style}
  button_flow.add{type = "button", caption = {"teams"}, name = "list_teams_button", style = mod_gui.button_style}
  if global.team_config.diplomacy_enabled then
    local button = button_flow.add{type = "button", caption = {"diplomacy"}, name = "diplomacy_button", style = mod_gui.button_style}
    button.style.visible = #global.teams > 1 and player.force.name ~= "spectator"
  end
  local game_mode_button = game_mode_buttons[global.game_config.game_mode.selected]
  if game_mode_button then
    button_flow.add(game_mode_button)
  end
  if player.admin then
    button_flow.add{type = "button", caption = {"admin"}, name = "admin_button", style = mod_gui.button_style}
  end
  if player.force.name == "spectator" then
    button_flow.add{type = "button", caption = {"join-team"}, name = "spectator_join_team_button", style = mod_gui.button_style}
  end
end

function get_color(team, lighten)
  local c = global.colors[global.color_map[team.color]].color
  if lighten then
    return {r = 1 - (1 - c.r) * 0.5, g = 1 - (1 - c.g) * 0.5, b = 1 - (1 - c.b) * 0.5, a = 1}
  end
  return c
end

function add_player_list_gui(force, gui)
  if not (force and force.valid) then return end
  if #force.players == 0 then
    gui.add{type = "label", caption = {"none"}}
    return
  end
  local scroll = gui.add{type = "scroll-pane"}
  scroll.style.maximal_height = 120
  local name_table = scroll.add{type = "table", column_count = 1}
  name_table.style.vertical_spacing = 0
  local added = {}
  local first = true
  if #force.connected_players > 0 then
    local online_names = ""
    for k, player in pairs (force.connected_players) do
      if not first then
        online_names = online_names..", "
      end
      first = false
      online_names = online_names..player.name
      added[player.name] = true
    end
    local online_label = name_table.add{type = "label", caption = {"online", online_names}}
    online_label.style.single_line = false
    online_label.style.maximal_width = 180
  end
  first = true
  if #force.players > #force.connected_players then
    local offline_names = ""
    for k, player in pairs (force.players) do
      if not added[player.name] then
      if not first then
        offline_names = offline_names..", "
      end
      first = false
      offline_names = offline_names..player.name
      added[player.name] = true
      end
    end
    local offline_label = name_table.add{type = "label", caption = {"offline", offline_names}}
    offline_label.style.single_line = false
    offline_label.style.font_color = {r = 0.7, g = 0.7, b = 0.7}
    offline_label.style.maximal_width = 180
  end
end

function update_diplomacy_frame(player)
  local flow = player.gui.center.diplomacy_frame
  if not flow then return end
  gui = flow.diplomacy_inner_frame
  if not gui then return end
  local diplomacy_table = gui.diplomacy_table
  if not diplomacy_table then
    diplomacy_table = gui.add{type = "table", name = "diplomacy_table", column_count = 5}
    diplomacy_table.style.horizontal_spacing = 16
    diplomacy_table.style.vertical_spacing = 8
    diplomacy_table.draw_horizontal_lines = true
    diplomacy_table.draw_vertical_lines = true
  else
    diplomacy_table.clear()
  end
  for k, name in pairs ({"team-name", "stance", "enemy", "neutral", "ally"}) do
    local label = diplomacy_table.add{type = "label", name = name, caption = {name}}
    label.style.font = "default-bold"
  end
  for k, team in pairs (global.teams) do
    local force = game.forces[team.name]
    if force and force ~= player.force then
      local label = diplomacy_table.add{type = "label", name = team.name.."_name", caption = team.name}
      label.style.single_line = false
      label.style.maximal_width = 150
      label.style.font = "default-semibold"
      label.style.font_color = get_color(team, true)
      local stance = get_stance(player.force, force)
      local their_stance = get_stance(force, player.force)
      local stance_label = diplomacy_table.add{type = "label", name = team.name.."_stance", caption = {their_stance}}
      if their_stance == "ally" then
        stance_label.style.font_color = {r = 0.5, g = 1, b = 0.5}
      elseif their_stance == "enemy" then
        stance_label.style.font_color = {r = 1, g = 0.5, b = 0.5}
      end
      diplomacy_table.add{type = "checkbox", name = team.name.."_enemy", state = (stance == "enemy")}
      diplomacy_table.add{type = "checkbox", name = team.name.."_neutral", state = (stance == "neutral")}
      diplomacy_table.add{type = "checkbox", name = team.name.."_ally", state = (stance == "ally")}
    end
  end
  if not flow.diplomacy_confirm then
    flow.add{type = "button", name = "diplomacy_confirm", caption = {"confirm"}}
  end
end

function set_player(player, team)
  local force = game.forces[team.name]
  local surface = global.surface
  if not surface.valid then return end
  local position = surface.find_non_colliding_position("player", force.get_spawn_position(surface), 320, 1)
  if position then
    player.teleport(position, surface)
  else
    player.print({"cant-find-position"})
    choose_joining_gui(player)
    return
  end
  if player.character then
    player.character.destroy()
  end
  player.force = force
  player.color = get_color(team)
  player.chat_color = get_color(team, true)
  player.tag = "["..force.name.."]"
  player.set_controller
  {
    type = defines.controllers.character,
    character = surface.create_entity{name = "player", position = position, force = force}
  }
  player.spectator = false
  init_player_gui(player)
  for k, other_player in pairs (game.connected_players) do
    update_team_list_frame(player)
  end
  if global.game_config.team_artillery and global.game_config.give_artillery_remote and game.item_prototypes["artillery-targeting-remote"] then
    player.insert("artillery-targeting-remote")
  end
  give_equipment(player)

  apply_character_modifiers(player)
  check_force_protection(force)
  game.print({"joined", player.name, player.force.name})
end

function choose_joining_gui(player)
  if #global.teams == 1 then
    local team = global.teams[1]
    local force = game.forces[team.name]
    set_player(player, team)
    return
  end
  local setting = global.team_config.team_joining.selected
  if setting == "random" then
    create_random_join_gui(player.gui.center)
    return
  end
  if setting == "player_pick" then
    create_pick_join_gui(player.gui.center)
    return
  end
  if setting == "auto_assign" then
    create_auto_assign_gui(player.gui.center)
    return
  end
end

function add_join_spectator_button(gui)
  local player = game.players[gui.player_index]
  if (not global.game_config.allow_spectators) and (not player.admin) then return end
  set_button_style(gui.add{type = "button", name = "join_spectator", caption = {"join-spectator"}})
end

function create_random_join_gui(gui)
  local name = "random_join_frame"
  local frame = gui[name]
  if frame then
    frame.clear()
  else
    frame = gui.add{type = "frame", name = name, caption = {"random-join"}}
  end
  set_button_style(frame.add{type = "button", name = "random_join_button", caption = {"random-join-button"}})
  add_join_spectator_button(frame)
end


function create_auto_assign_gui(gui)
  local name = "auto_assign_frame"
  local frame = gui[name]
  if frame then
    frame.clear()
  else
    frame = gui.add{type = "frame", name = name, caption = {"auto-assign"}}
  end
  set_button_style(frame.add{type = "button", name = "auto_assign_button", caption = {"auto-assign-button"}})
  add_join_spectator_button(frame)
end

function create_pick_join_gui(gui)
  local name = "pick_join_frame"
  local frame = gui[name]
  if frame then
    frame.clear()
  else
    frame = gui.add{type = "frame", name = name, caption = {"pick-join"}, direction = "vertical"}
  end
  local inner_frame = frame.add{type = "frame", style = "image_frame", name = "pick_join_inner_frame", direction = "vertical"}
  inner_frame.style.left_padding = 8
  inner_frame.style.top_padding = 8
  inner_frame.style.right_padding = 8
  inner_frame.style.bottom_padding = 8
  local pick_join_table = inner_frame.add{type = "table", name = "pick_join_table", column_count = 4}
  pick_join_table.style.horizontal_spacing = 16
  pick_join_table.style.vertical_spacing = 8
  pick_join_table.draw_horizontal_lines = true
  pick_join_table.draw_vertical_lines = true
  pick_join_table.style.column_alignments[3] = "right"
  pick_join_table.add{type = "label", name = "pick_join_table_force_name", caption = {"team-name"}}.style.font = "default-semibold"
  pick_join_table.add{type = "label", name = "pick_join_table_player_count", caption = {"players"}}.style.font = "default-semibold"
  pick_join_table.add{type = "label", name = "pick_join_table_team", caption = {"team-number"}}.style.font = "default-semibold"
  pick_join_table.add{type = "label", name = "pick_join_table_pad"}.style.font = "default-semibold"
  local limit = global.team_config.max_players
  local teams = get_eligible_teams(game.players[gui.player_index])
  if not teams then return end
  for k, team in pairs (teams) do
    local force = game.forces[team.name]
    if force then
      local name = pick_join_table.add{type = "label", name = force.name.."_label", caption = force.name}
      name.style.font = "default-semibold"
      name.style.font_color = get_color(team, true)
      add_player_list_gui(force, pick_join_table)
      local caption
      if tonumber(team.team) then
        caption = team.team
      elseif team.team:find("?") then
        caption = team.team:gsub("?", "")
      else
        caption = team.team
      end
      pick_join_table.add{type = "label", name = force.name.."_team", caption = caption}
      set_button_style(pick_join_table.add{type = "button", name = force.name.."_pick_join", caption = {"join"}})
    end
  end
  add_join_spectator_button(frame)
end

function on_pick_join_button_press(event)
  local gui = event.element
  local player = game.players[event.player_index]
  if not (gui and gui.valid and player and player.valid) then return end
  local name = gui.name
  if not name then return end
  local suffix = "_pick_join"
  if not name:find(suffix) then return end
  team_name = name:gsub(suffix, "")
  local joined_team
  for k, team in pairs (global.teams) do
    if team_name == team.name then
      joined_team = team
      break
    end
  end
  if not joined_team then return end
  local force = game.forces[joined_team.name]
  if not force then return end
  set_player(player, joined_team)
  player.gui.center.clear()

  for k, player in pairs (game.forces.player.players) do
    create_pick_join_gui(player.gui.center)
  end

  for k, player in pairs (game.connected_players) do
    update_team_list_frame(player)
  end

end

function add_team_button_press(event)
  local gui = event.element
  local index = #global.teams + 1
  for k = 1, index do
    if not global.teams[k] then
      index = k
      break
    end
  end
  if index > 24 then
    local player = game.players[event.player_index]
    if player then
      player.print({"too-many-teams", 24})
    end
    return
  end
  local color = global.colors[(1+index%(#global.colors))]
  local name = game.backer_names[math.random(#game.backer_names)]
  local team = {name = name, color = color.name, team = "-"}
  global.teams[index] = team
  for k, player in pairs (game.players) do
    local gui = get_config_holder(player).team_config_gui
    if gui then
      add_team_to_team_table(gui.team_config_gui_inner_frame.team_config_gui_scroll.team_table, index)
    end
  end
end

function trash_team_button_press(event)
  local gui = event.element
  if not gui.valid then return end
  if not gui.name:find("_trash_button") then
    return
  end
  local team_index = gui.name:gsub("_trash_button", "")
  team_index = tonumber(team_index)
  local count = 0
  for k, team in pairs (global.teams) do
    count = count + 1
  end
  if count > 1 then
    global.teams[team_index] = nil
    remove_team_from_team_table(gui)
  else
    game.players[event.player_index].print({"cant-remove-only-team"})
  end
end

function remove_team_from_team_table(gui)
  local index = nil
  for k, child in pairs (gui.parent.children) do
    if child == gui then
      index = k
      break
    end
  end
  local delete_list = {}
  for k, player in pairs (game.players) do
    local gui = get_config_holder(player).team_config_gui
    if gui then
      local children = gui.team_config_gui_inner_frame.team_config_gui_scroll.team_table.children
      for k = -3, 0 do
        children[index+k].destroy()
      end
    end
  end
end

function set_teams_from_gui(player)
  local gui = get_config_holder(player).team_config_gui
  if not gui then return end
  local teams = {}
  local team = {}
  local duplicates = {}
  local team_table = gui.team_config_gui_inner_frame.team_config_gui_scroll.team_table
  local children = team_table.children
  for index = 1, 25 do
    local element = team_table[index]
    if element and element.valid then
      local text = element.text
      if is_ignored_force(text) then
        player.print({"disallowed-team-name", text})
        return
      end
      if text == "" then
        player.print({"empty-team-name"})
        return
      end
      if duplicates[text] then
        player.print({"duplicate-team-name", text})
        return
      end
      duplicates[text] = true
      local team = {}
      team.name = text
      team.color = global.colors[team_table[index.."_color"].selected_index].name
      local caption = team_table[index.."_next_team_button"].caption
      team.team = tonumber(caption) or caption
      table.insert(teams, team)
    end
  end
  if #teams > 24 then
    player.print({"too-many-teams", 24})
    return
  end
  global.teams = teams
  return true
end

function on_team_button_press(event)
  local gui = event.element
  if not gui.valid then return end
  if not gui.name:find("_next_team_button") then return end
  local left_click = (event.button == defines.mouse_button_type.left)
  local index = gui.caption
  if index == "-" then
    if left_click then
      index = 1
    else
      index = "?"
    end
  elseif index == "?" then
    if left_click then
      index = "-"
    else
      index = #global.teams
    end
  elseif index == tostring(#global.teams) then
    if left_click then
      index = "?"
    else
      index = index -1
    end
  else
    if left_click then
      index = tonumber(index) + 1
    elseif index == tostring(1) then
      index = "-"
    else
      index = index -1
    end
  end
  gui.caption = index
end

function toggle_balance_options_gui(player)
  if not (player and player.valid) then return end
  local gui = player.gui.center
  local frame = gui.balance_options_frame
  local config = gui.config_holding_frame
  if frame then
    frame.destroy()
    if config then
      config.style.visible = true
    end
    return
  end
  if config then
    config.style.visible = false
  end
  frame = gui.add{name = "balance_options_frame", type = "frame", direction = "vertical", caption = {"balance-options"}}
  frame.style.scaleable = false
  frame.style.maximal_height = player.display_resolution.height * 0.95
  frame.style.maximal_width = player.display_resolution.width * 0.95
  local scrollpane = frame.add{name = "balance_options_scrollpane", type = "scroll-pane"}
  local big_table = scrollpane.add{type = "table", column_count = 4, name = "balance_options_big_table", direction = "horizontal"}
  big_table.style.horizontal_spacing = 32
  big_table.draw_vertical_lines = true
  local entities = game.entity_prototypes
  local ammos = game.ammo_category_prototypes
  for modifier_name, array in pairs (global.modifier_list) do
    local flow = big_table.add{type = "frame", name = modifier_name.."_flow", caption = {modifier_name}, style = "inner_frame"}
    local table = flow.add{name = modifier_name.."table", type = "table", column_count = 2}
    table.style.column_alignments[2] = "right"
    for name, modifier in pairs (array) do
      if modifier_name == "ammo_damage_modifier" then
        local string = "ammo-category-name."..name
        table.add{type = "label", caption = {"", ammos[name].localised_name, {"colon"}}}
      elseif modifier_name == "gun_speed_modifier" then
        table.add{type = "label", caption = {"", ammos[name].localised_name, {"colon"}}}
      elseif modifier_name == "turret_attack_modifier" then
        table.add{type = "label", caption = {"", entities[name].localised_name, {"colon"}}}
      elseif modifier_name == "character_modifiers" then
        table.add{type = "label", caption = {"", {name}, {"colon"}}}
      end
      local input = table.add{name = name.."text", type = "textfield"}
      input.text = tostring((modifier * 100) + 100).."%"
      input.style.maximal_width = 50
    end
  end
  local flow = frame.add{type = "flow", direction = "horizontal"}
  flow.style.horizontally_stretchable = true
  flow.style.align = "right"
  flow.add{type = "button", name = "balance_options_confirm", caption = {"balance-confirm"}}
  flow.add{type = "button", name = "balance_options_cancel", caption = {"cancel"}}
end

function create_disable_frame(gui)
  local frame = gui.disable_items_frame
  if gui.disable_items_frame then
    gui.disable_items_frame.clear()
  else
    frame = gui.add{name = "disable_items_frame", type = "frame", direction = "vertical", style = "inner_frame"}
  end
  local label = frame.add{type = "label", caption = {"", {"disabled-items"}, {"colon"}}}
  local disable_table = frame.add{type = "table", name = "disable_items_table", column_count = 7}
  disable_table.style.horizontal_spacing = 2
  disable_table.style.vertical_spacing = 2
  local items = game.item_prototypes
  if global.disabled_items then
    for item, bool in pairs (global.disabled_items) do
      if items[item] then
        local choose = disable_table.add{type = "choose-elem-button", elem_type = "item"}
        choose.elem_value = item
      end
    end
  end
  disable_table.add{type = "choose-elem-button", elem_type = "item"}
end

function set_balance_settings(player)
  local gui = player.gui.center
  local frame = gui.balance_options_frame
  local scroll = frame.balance_options_scrollpane
  local table = scroll.balance_options_big_table
  for modifier_name, array in pairs (global.modifier_list) do
    local flow = table[modifier_name.."_flow"]
    local modifier_table = flow[modifier_name.."table"]
    if modifier_table then
      for name, modifier in pairs (array) do
        local text = modifier_table[name.."text"].text
        if text then
          text = string.gsub(text, "%%", "")
          local n = tonumber(text)
          if n == nil then
            player.print({"must-be-number", {modifier_name}})
            return
          end
          if n <= 0 then
            player.print({"must-be-greater-than-0", {modifier_name}})
            return
          end
          global.modifier_list[modifier_name][name] = (n - 100) / 100
        end
      end
    end
  end
  return true
end

function config_confirm(player)
  if not parse_config(player) then return end
  destroy_config_for_all()
  prepare_next_round()
end

function parse_config(player)
  if not set_teams_from_gui(player) then return end
  local frame = get_config_holder(player)
  if not parse_config_from_gui(frame.map_config_gui, global.map_config) then return end
  if not parse_config_from_gui(frame.game_config_gui, global.game_config) then return end
  if not parse_config_from_gui(frame.team_config_gui, global.team_config) then return end
  return true
end

function auto_assign(player)
  local teams = get_eligible_teams(player)
  if not teams then return end
  local count = 1000
  for k, this_team in pairs (teams) do
    local other_force = game.forces[this_team.name]
    if other_force ~= nil then
      if #other_force.connected_players < count then
        count = #other_force.connected_players
        force = other_force
        team = this_team
      end
    end
  end
  set_player(player, team)
end

function get_eligible_teams(player)
  local limit = global.team_config.max_players
  local teams = {}
  for k, team in pairs (global.teams) do
    local force = game.forces[team.name]
    if force then
      if limit <= 0 or #force.connected_players < limit or player.admin then
        table.insert(teams, team)
      end
    end
  end
  if #teams == 0 then
    spectator_join(player)
    player.print({"no-space-available"})
    return
  end
  return teams
end

function destroy_config_for_all()
  local names = {"config_holding_frame", "balance_options_frame", "waiting_frame"}
  for k, player in pairs (game.players) do
    local gui = player.gui.center
    for i, name in pairs (names) do
      if gui[name] then
        gui[name].destroy()
      end
    end
  end
end

function set_evolution_factor()
  local n = global.map_config.evolution_factor
  if n >= 1 then
    n = 1
  end
  if n <= 0 then
    n = 0
  end
  game.forces.enemy.evolution_factor = n
  global.map_config.evolution_factor = n
end

function random_join(player)
  local teams = get_eligible_teams(player)
  if not teams then return end
  set_player(player, teams[math.random(#teams)])
end

function spectator_join(player)
  if player.character then player.character.destroy() end
  player.set_controller{type = defines.controllers.ghost}
  player.force = "spectator"
  player.teleport(global.spawn_offset, global.surface)
  player.tag = ""
  player.chat_color = {r = 1, g = 1, b = 1, a = 1}
  player.spectator = true
  init_player_gui(player)
  game.print({"joined-spectator", player.name})
end

function objective_button_press(event)
  local gui = event.element
  local player = game.players[event.player_index]
  local flow = mod_gui.get_frame_flow(player)
  local frame = flow.objective_frame
  if frame then
    frame.destroy()
    return
  end
  frame = flow.add{type = "frame", name = "objective_frame", caption = {"objective"}, direction = "vertical"}
  frame.style.visible = true
  local big_label = frame.add{type = "label", caption = {global.game_config.game_mode.selected.."_description"}}
  big_label.style.single_line = false
  big_label.style.font = "default-bold"
  big_label.style.top_padding = 0
  big_label.style.maximal_width = 300
  local label_table = frame.add{type = "table", column_count = 2}
  for k, name in pairs ({"friendly_fire", "diplomacy_enabled", "team_joining", "spawn_position"}) do
    label_table.add{type = "label", caption = {"", {name}, {"colon"}}, tooltip = {name.."_tooltip"}}
    local setting = global.team_config[name]
    if setting ~= nil then
      if type(setting) == "table" then
        label_table.add{type = "label", caption = {setting.selected}}
      elseif type(setting) == "boolean" then
        label_table.add{type = "label", caption = {setting}}
      else
        label_table.add{type = "label", caption = setting}
      end
    end
  end
  if global.disabled_items then
    label_table.add{type = "label", caption = {"", {"disabled-items", {"colon"}}}}
    local flow = label_table.add{type = "table", column_count = 4}
    flow.style.horizontal_spacing = 2
    flow.style.vertical_spacing = 2
    local items = game.item_prototypes
    for item, bool in pairs (global.disabled_items) do
      if items[item] then
        flow.add{type = "sprite", sprite = "item/"..item, tooltip = items[item].localised_name}
      end
    end
  end
end

function list_teams_button_press(event)
  local player = game.players[event.player_index]
  if not (player and player.valid) then return end
  local flow = mod_gui.get_frame_flow(player)
  local frame = flow.team_list
  if frame then
    frame.destroy()
    return
  end
  frame = flow.add{type = "frame", caption = {"teams"}, direction = "vertical", name = "team_list"}
  update_team_list_frame(player)
end

function update_team_list_frame(player)
  if not (player and player.valid) then return end
  local flow = mod_gui.get_frame_flow(player)
  local frame = flow.team_list
  if not frame then return end
  frame.clear()
  local inner = frame.add{type = "frame", style = "image_frame"}
  inner.style.left_padding = 8
  inner.style.right_padding = 8
  inner.style.top_padding = 8
  inner.style.bottom_padding = 8
  local scroll = inner.add{type = "scroll-pane"}
  scroll.style.maximal_height = player.display_resolution.height * 0.8
  local team_table = scroll.add{type = "table", column_count = 2}
  team_table.style.vertical_spacing = 8
  team_table.style.horizontal_spacing = 16
  team_table.draw_horizontal_lines = true
  team_table.draw_vertical_lines = true
  team_table.add{type = "label", caption = {"team-name"}, style = "bold_label"}
  team_table.add{type = "label", caption = {"players"}, style = "bold_label"}
  for k, team in pairs (global.teams) do
    local force = game.forces[team.name]
    if force then
      local label = team_table.add{type = "label", caption = team.name, style = "description_label"}
      label.style.font_color = get_color(team, true)
      add_player_list_gui(force, team_table)
    end
  end
end

function admin_button_press(event)
  local gui = event.element
  local player = game.players[event.player_index]
  local flow = mod_gui.get_frame_flow(player)
  if flow.admin_frame then
    flow.admin_frame.style.visible = not flow.admin_frame.style.visible
    return
  end
  local frame = flow.add{type = "frame", caption = {"admin"}, name = "admin_frame", direction = "vertical"}
  frame.style.visible = true
  set_button_style(frame.add{type = "button", caption = {"end-round"}, name = "admin_end_round", tooltip = {"end-round-tooltip"}})
  set_button_style(frame.add{type = "button", caption = {"reroll-round"}, name = "admin_reroll_round", tooltip = {"reroll-round-tooltip"}})
  set_button_style(frame.add{type = "button", caption = {"admin-change-team"}, name = "admin_change_team", tooltip = {"admin-change-team-tooltip"}})
end

function admin_frame_button_press(event)
  local gui = event.element
  if not gui.valid then return end
  if not gui.parent then return end
  if not gui.parent.valid then return end
  if gui.parent.name ~= "admin_frame" then return end
  local player = game.players[event.player_index]
  if not player.admin then
    player.print({"only-admins"})
    init_player_gui(player)
    return
  end
  if gui.name == "admin_end_round" then
    end_round(player)
    return
  end
  if gui.name == "admin_reroll_round" then
    end_round()
    destroy_config_for_all()
    prepare_next_round()
    return
  end
  if gui.name == "admin_change_team" then
    local gui = player.gui.center
    if gui.pick_join_frame then
      gui.pick_join_frame.destroy()
    else
      create_pick_join_gui(gui)
    end
    return
  end
end

function diplomacy_button_press(event)
  local gui = event.element
  local player = game.players[event.player_index]
  local flow = player.gui.center
  local frame = flow.diplomacy_frame
  if frame then
    frame.destroy()
    return
  end
  frame = player.gui.center.add{type = "frame", name = "diplomacy_frame", caption = {"diplomacy"}, direction = "vertical"}
  frame.style.visible = true
  frame.style.title_bottom_padding = 8
  player.opened = frame
  local inner_frame = frame.add{type = "frame", style = "image_frame", name = "diplomacy_inner_frame", direction = "vertical"}
  inner_frame.style.left_padding = 8
  inner_frame.style.top_padding = 8
  inner_frame.style.right_padding = 8
  inner_frame.style.bottom_padding = 8
  update_diplomacy_frame(player)
end


function formattime(ticks)
  local hours = math.floor(ticks / (60 * 60 * 60))
  ticks = ticks - hours * (60 * 60 * 60)
  local minutes = math.floor(ticks / (60 * 60))
  ticks = ticks - minutes * (60 * 60)
  local seconds = math.floor(ticks / 60)
  if hours > 0 then
    return string.format("%d:%02d:%02d", hours, minutes, seconds)
  else
    return string.format("%d:%02d", minutes, seconds)
  end
end

function get_time_left()
  if not global.round_start_tick then return "Invalid" end
  if not global.game_config.time_limit then return "Invalid" end
  return formattime((math.max(global.round_start_tick + (global.game_config.time_limit * 60 * 60) - game.tick, 0)))
end

function production_score_button_press(event)
  local gui = event.element
  local player = game.players[event.player_index]
  local flow = mod_gui.get_frame_flow(player)
  local frame = flow.production_score_frame
  if frame then
    frame.destroy()
    return
  end
  frame = flow.add{type = "frame", name = "production_score_frame", caption = {"production_score"}, direction = "vertical"}
  frame.style.title_bottom_padding = 8
  if global.game_config.required_production_score > 0 then
    frame.add{type = "label", caption = {"", {"required_production_score"}, {"colon"}, " ", util.format_number(global.game_config.required_production_score)}}
  end
  if global.game_config.time_limit > 0 then
    frame.add{type = "label", caption = {"time_left", get_time_left()}, name = "time_left"}
  end
  local inner_frame = frame.add{type = "frame", style = "image_frame", name = "production_score_inner_frame", direction = "vertical"}
  inner_frame.style.left_padding = 8
  inner_frame.style.top_padding = 8
  inner_frame.style.right_padding = 8
  inner_frame.style.bottom_padding = 8
  local flow = frame.add{type = "flow", direction = "horizontal", name = "recipe_picker_holding_flow"}
  flow.add{type = "label", caption = {"", {"recipe-calculator"}, {"colon"}}}
  flow.add{type = "choose-elem-button", name = "recipe_picker_elem_button", elem_type = "recipe"}
  flow.style.vertical_align = "center"
  update_production_score_frame(player)
end

function update_production_score_frame(player)
  local gui = mod_gui.get_frame_flow(player)
  local frame = gui.production_score_frame
  if not frame then return end
  inner_frame = frame.production_score_inner_frame
  if not inner_frame then return end
  if frame.time_left then
    frame.time_left.caption = {"time_left", get_time_left()}
  end
  inner_frame.clear()
  local information_table = inner_frame.add{type = "table", column_count = 4}
  information_table.draw_horizontal_line_after_headers = true
  information_table.draw_vertical_lines = true
  information_table.style.horizontal_spacing = 16
  information_table.style.vertical_spacing = 8
  information_table.style.column_alignments[3] = "right"
  information_table.style.column_alignments[4] = "right"

  for k, caption in pairs ({"", "team-name", "score", "score_per_minute"}) do
    local label = information_table.add{type = "label", caption = {caption}, tooltip = {caption.."_tooltip"}}
    label.style.font = "default-bold"
  end
  local team_map = {}
  for k, team in pairs (global.teams) do
    team_map[team.name] = team
  end
  local average_score = global.average_score
  if not average_score then return end
  local rank = 1
  for name, score in spairs (global.production_scores, function(t, a, b) return t[b] < t[a] end) do
    if not average_score[name] then
      average_score = nil
      return
    end
    if team_map[name] then
      local position = information_table.add{type = "label", caption = "#"..rank}
      if name == player.force.name then
        position.style.font = "default-semibold"
        position.style.font_color = {r = 1, g = 1}
      end
      local label = information_table.add{type = "label", caption = name}
      label.style.font = "default-semibold"
      label.style.font_color = get_color(team_map[name], true)
      information_table.add{type = "label", caption = util.format_number(score)}
      local delta_score = (score - (average_score[name] / statistics_period)) * (60 / statistics_period) * 2
      local delta_label = information_table.add{type = "label", caption = util.format_number(math.floor(delta_score))}
      if delta_score < 0 then
        delta_label.style.font_color = {r = 1, g = 0.2, b = 0.2}
      end
      rank = rank + 1
    end
  end
end

function oil_harvest_button_press(event)
  local gui = event.element
  if not gui.valid then return end
  if gui.name ~= "oil_harvest_button" then return end
  local player = game.players[event.player_index]
  local flow = mod_gui.get_frame_flow(player)
  local frame = flow.oil_harvest_frame
  if frame then
    frame.destroy()
    return
  end
  frame = flow.add{type = "frame", name = "oil_harvest_frame", caption = {"oil_harvest"}, direction = "vertical"}
  frame.style.title_bottom_padding = 8
  if global.game_config.required_oil_barrels > 0 then
    frame.add{type = "label", caption = {"", {"required_oil_barrels"}, {"colon"}, " ", util.format_number(global.game_config.required_oil_barrels)}}
  end
  local inner_frame = frame.add{type = "frame", style = "image_frame", name = "oil_harvest_inner_frame", direction = "vertical"}
  inner_frame.style.left_padding = 8
  inner_frame.style.top_padding = 8
  inner_frame.style.right_padding = 8
  inner_frame.style.bottom_padding = 8
  update_oil_harvest_frame(player)
end

function update_oil_harvest_frame(player)
  local gui = mod_gui.get_frame_flow(player)
  local frame = gui.oil_harvest_frame
  if not frame then return end
  inner_frame = frame.oil_harvest_inner_frame
  if not inner_frame then return end
  inner_frame.clear()
  local information_table = inner_frame.add{type = "table", column_count = 3}
  information_table.draw_horizontal_line_after_headers = true
  information_table.draw_vertical_lines = true
  information_table.style.horizontal_spacing = 16
  information_table.style.vertical_spacing = 8
  information_table.style.column_alignments[3] = "right"

  for k, caption in pairs ({"", "team-name", "oil_harvest"}) do
    local label = information_table.add{type = "label", caption = {caption}}
    label.style.font = "default-bold"
  end
  local team_map = {}
  for k, team in pairs (global.teams) do
    team_map[team.name] = team
  end
  if not global.oil_harvest_scores then
    global.oil_harvest_scores = {}
  end
  local rank = 1
  for name, score in spairs (global.oil_harvest_scores, function(t, a, b) return t[b] < t[a] end) do
    if team_map[name] then
      local position = information_table.add{type = "label", caption = "#"..rank}
      if name == player.force.name then
        position.style.font = "default-semibold"
        position.style.font_color = {r = 1, g = 1}
      end
      local label = information_table.add{type = "label", caption = name}
      label.style.font = "default-semibold"
      label.style.font_color = get_color(team_map[name], true)
      information_table.add{type = "label", caption = util.format_number(score)}
      rank = rank + 1
    end
  end
end

function space_race_button_press(event)
  local gui = event.element
  if not gui.valid then return end
  if gui.name ~= "space_race_button" then return end
  local player = game.players[event.player_index]
  local flow = mod_gui.get_frame_flow(player)
  local frame = flow.space_race_frame
  if frame then
    frame.destroy()
    return
  end
  frame = flow.add{type = "frame", name = "space_race_frame", caption = {"space_race"}, direction = "vertical"}
  frame.style.title_bottom_padding = 8
  if global.game_config.required_satellites_sent > 0 then
    frame.add{type = "label", caption = {"", {"required_satellites_sent"}, {"colon"}, " ", util.format_number(global.game_config.required_satellites_sent)}}
  end
  local inner_frame = frame.add{type = "frame", style = "image_frame", name = "space_race_inner_frame", direction = "vertical"}
  inner_frame.style.left_padding = 8
  inner_frame.style.top_padding = 8
  inner_frame.style.right_padding = 8
  inner_frame.style.bottom_padding = 8
  update_space_race_frame(player)
end

function update_space_race_frame(player)
  local gui = mod_gui.get_frame_flow(player)
  local frame = gui.space_race_frame
  if not frame then return end
  inner_frame = frame.space_race_inner_frame
  if not inner_frame then return end
  inner_frame.clear()
  local information_table = inner_frame.add{type = "table", column_count = 4}
  information_table.draw_horizontal_line_after_headers = true
  information_table.draw_vertical_lines = true
  information_table.style.horizontal_spacing = 16
  information_table.style.vertical_spacing = 8
  information_table.style.column_alignments[4] = "right"

  for k, caption in pairs ({"", "team-name", "rocket_parts", "satellites_sent"}) do
    local label = information_table.add{type = "label", caption = {caption}}
    label.style.font = "default-bold"
  end
  local colors = {}
  for k, team in pairs (global.teams) do
    colors[team.name] = get_color(team, true)
  end
  local rank = 1

  for name, score in spairs (global.space_race_scores, function(t, a, b) return t[b] < t[a] end) do
    local position = information_table.add{type = "label", caption = "#"..rank}
    if name == player.force.name then
      position.style.font = "default-semibold"
      position.style.font_color = {r = 1, g = 1}
    end
    local label = information_table.add{type = "label", caption = name}
    label.style.font = "default-semibold"
    label.style.font_color = colors[name]
    local progress = information_table.add{type = "progressbar", value = 1}
    progress.style.width = 0
    progress.style.horizontally_squashable = true
    progress.style.horizontally_stretchable = true
    progress.style.color = colors[name]
    local silo = global.silos[name]
    if silo and silo.valid then
      if silo.get_inventory(defines.inventory.rocket_silo_rocket) then
        progress.value = 1
      else
        progress.value = silo.rocket_parts / silo.prototype.rocket_parts_required
      end
    else
      progress.style.visible = false
    end
    information_table.add{type = "label", caption = util.format_number(score)}
    rank = rank + 1
  end
end

function diplomacy_confirm(event)
  local gui = event.element
  local player = game.players[event.player_index]
  if not (player and player.valid and gui and gui.valid) then return end
  if global.team_config.who_decides_diplomacy.selected == "team_leader" then
    local team_leader =  player.force.connected_players[1]
    if player.name ~= team_leader.name then
      player.print({"not-team-leader", team_leader.name})
      return
    end
  end
  local diplomacy_table = gui.parent.diplomacy_inner_frame.diplomacy_table
  local some_change = false
  local force = player.force
  local changed_forces = {}
  for k, child in pairs (diplomacy_table.children) do
    if child.type == "checkbox" then
      if child.state then
        if child.name:find("_ally") then
          if child.state then
            local name = child.name:gsub("_ally", "")
            local other_force = game.forces[name]
            if get_stance(force, other_force) ~= "ally" then
              team_changed_diplomacy(force, other_force, "ally")
              table.insert(changed_forces, other_force)
              some_change = true
            end
          end
        elseif child.name:find("_neutral") then
          if child.state then
            local name = child.name:gsub("_neutral", "")
            local other_force = game.forces[name]
            if get_stance(force, other_force) ~= "neutral" then
              team_changed_diplomacy(force, other_force, "neutral")
              table.insert(changed_forces, other_force)
              some_change = true
            end
          end
        elseif child.name:find("_enemy") then
          if child.state then
            local name = child.name:gsub("_enemy", "")
            local other_force = game.forces[name]
            if get_stance(force, other_force) ~= "enemy" then
              team_changed_diplomacy(force, other_force, "enemy")
              table.insert(changed_forces, other_force)
              some_change = true
            end
          end
        end
      end
    end
  end
  if some_change then
    force.print({"player-changed-diplomacy", player.name})
    force.rechart()
    for k, changed_force in pairs (changed_forces) do
      for k, player in pairs (changed_force.players) do
        update_diplomacy_frame(player)
      end
      changed_force.rechart()
    end
    for k, player in pairs (force.players) do
      update_diplomacy_frame(player)
    end
  end
  if player.opened_gui_type == defines.gui_type.custom then
    local opened = player.opened
    if opened and opened.valid then
      opened.destroy()
    end
  end
end

function team_changed_diplomacy(force, other_force, stance)
  if not (force and force.valid and other_force and other_force.valid) then return end
  if stance == "ally" then
    force.set_friend(other_force, true)
    force.set_cease_fire(other_force, true)
  elseif stance == "neutral" then
    force.set_friend(other_force, false)
    force.set_cease_fire(other_force, true)
  elseif stance == "enemy" then
    force.set_friend(other_force, false)
    force.set_cease_fire(other_force, false)
  end
  game.print({"team-changed-diplomacy", force.name, other_force.name, {stance}})
end

function diplomacy_check_press(event)
  local gui = event.element
  if not gui.valid then return end
  if not
    (gui.name:find("_enemy") or
    gui.name:find("_neutral") or
    gui.name:find("_ally"))
  then
    return
  end
  if not gui.state then
    gui.state = true
    return
  end
  local index = 1
  for k, child in pairs (gui.parent.children) do
    if child.name == gui.name then
      index = k
      break
    end
  end
  if gui.name:find("_neutral") then
    gui.parent.children[index+1].state = false
    gui.parent.children[index-1].state = false
  elseif gui.name:find("_ally") then
    gui.parent.children[index-2].state = false
    gui.parent.children[index-1].state = false
  else
    gui.parent.children[index+1].state = false
    gui.parent.children[index+2].state = false
  end
end

function get_stance(force, other_force)
  if force.get_friend(other_force) == true then
    return "ally"
  elseif force.get_cease_fire(other_force) == true then
    return "neutral"
  else
    return "enemy"
  end
end

function give_inventory(player)
  if not global.inventory_list then return end
  if not global.inventory_list[global.team_config.starting_inventory.selected] then return end
  local list = global.inventory_list[global.team_config.starting_inventory.selected]
  for name, count in pairs (list) do
    if game.item_prototypes[name] then
      player.insert{name = name, count = count}
    else
      game.print(name.." is not a valid item")
    end
  end
end

function setup_teams()

  local spectator = game.forces["spectator"]
  if not (spectator and spectator.valid) then
    spectator = game.create_force("spectator")
  end
  local names = {}
  for k, team in pairs (global.teams) do
    names[team.name] = true
  end

  for name, force in pairs (game.forces) do
    if not (is_ignored_force(name) or names[name]) then
      game.merge_forces(name, "player")
    end
  end

  for k, team in pairs (global.teams) do
    local new_team
    if game.forces[team.name] then
      new_team = game.forces[team.name]
    else
      new_team = game.create_force(team.name)
    end
    new_team.reset()
    set_spawn_position(k, new_team, global.surface)
    set_random_team(team)
  end
  for k, team in pairs (global.teams) do
    local force = game.forces[team.name]
    force.set_friend(spectator, true)
    spectator.set_friend(force, true)
    set_diplomacy(team)
    setup_research(force)
    disable_combat_technologies(force)
    force.reset_technology_effects()
    apply_combat_modifiers(force)
    if global.team_config.starting_equipment.selected == "large" then
      force.worker_robots_speed_modifier = 2.5
    end
  end
  disable_items_for_all()
end

function disable_items_for_all()
  if not global.disabled_items then return end
  local items = game.item_prototypes
  local recipes = game.recipe_prototypes
  local product_map = {}
  for k, recipe in pairs (recipes) do
    for k, product in pairs (recipe.products) do
      if not product_map[product.name] then
        product_map[product.name] = {}
      end
      table.insert(product_map[product.name], recipe)
    end
  end

  local recipes_to_disable = {}
  for name, k in pairs (global.disabled_items) do
    local mapping = product_map[name]
    if mapping then
      for k, recipe in pairs (mapping) do
        recipes_to_disable[recipe.name] = true
      end
    end
  end
  for k, force in pairs (game.forces) do
    for name, bool in pairs (recipes_to_disable) do
      force.recipes[name].enabled = false
    end
  end
end

function check_technology_for_disabled_items(event)
  if not global.disabled_items then return end
  local disabled_items = global.disabled_items
  local technology = event.research
  local recipes = technology.force.recipes
  for k, effect in pairs (technology.effects) do
    if effect.type == "unlock-recipe" then
      for k, product in pairs (recipes[effect.recipe].products) do
        if disabled_items[product.name] then
          recipes[effect.recipe].enabled = false
        end
      end
    end
  end
end

function set_random_team(team)
  if tonumber(team.team) then return end
  if team.team == "-" then return end
  team.team = "?"..math.random(#global.teams)
end

function set_diplomacy(team)
  local force = game.forces[team.name]
  if not force or not force.valid then return end
  local team_number
  if tonumber(team.team) then
    team_number = team.team
  elseif team.team:find("?") then
    team_number = team.team:gsub("?", "")
    team_number = tonumber(team_number)
  else
    team_number = "Don't match me"
  end
  for k, other_team in pairs (global.teams) do
    if game.forces[other_team.name] then
      local other_number
      if tonumber(other_team.team) then
        other_number = other_team.team
      elseif other_team.team:find("?") then
        other_number = other_team.team:gsub("?", "")
        other_number = tonumber(other_number)
      else
        other_number = "Okay i won't match"
      end
      if other_number == team_number then
        force.set_cease_fire(other_team.name, true)
        force.set_friend(other_team.name, true)
      else
        force.set_cease_fire(other_team.name, false)
        force.set_friend(other_team.name, false)
      end
    end
  end
end

function set_spawn_position(k, force, surface)
  local setting = global.team_config.spawn_position.selected
  if setting == "fixed" then
    local position = global.spawn_positions[k]
    force.set_spawn_position(position, surface)
    return
  end
  if setting == "random" then
    local position
    local index
    repeat
      index = math.random(1, #global.spawn_positions)
      position = global.spawn_positions[index]
    until position ~= nil
    force.set_spawn_position(position, surface)
    table.remove(global.spawn_positions, index)
    return
  end
  if setting == "team_together" then
    if k == #global.spawn_positions then
      set_team_together_spawns(surface)
    end
  end
end

function set_team_together_spawns(surface)
  local grouping = {}
  for k, team in pairs (global.teams) do
    local team_number
    if tonumber(team.team) then
      team_number = team.team
    elseif team.team:find("?") then
      team_number = team.team:gsub("?", "")
      team_number = tonumber(team_number)
    else
      team_number = "-"
    end
    if tonumber(team_number) then
      if not grouping[team_number] then
        grouping[team_number] = {}
      end
      table.insert(grouping[team_number], team.name)
    else
      if not grouping.no_group then
        grouping.no_group = {}
      end
      table.insert(grouping.no_group, team.name)
    end
  end
  local count = 1
  for k, group in pairs (grouping) do
    for j, team_name in pairs (group) do
      local force = game.forces[team_name]
      if force then
        local position = global.spawn_positions[count]
        if position then
          force.set_spawn_position(position, surface)
          count = count + 1
        end
      end
    end
  end
end

function chart_starting_area_for_force_spawns()
  local surface = global.surface
  local radius = get_starting_area_radius()
  local size = radius*32
  for k, team in pairs (global.teams) do
    local name = team.name
    local force = game.forces[name]
    if force ~= nil then
      local origin = force.get_spawn_position(surface)
      local area = {{origin.x - size, origin.y - size},{origin.x + (size - 32), origin.y + (size - 32)}}
      surface.request_to_generate_chunks(origin, radius)
      force.chart(surface, area)
    end
  end
  global.check_starting_area_generation = true
end

function check_starting_area_chunks_are_generated()
  if not global.check_starting_area_generation then return end
  if game.tick % (#global.teams) ~= 0 then return end
  local surface = global.surface
  local size = global.map_config.starting_area_size.selected
  local check_radius = get_starting_area_radius() - 1
  local total = 0
  local generated = 0
  local width = surface.map_gen_settings.width/2
  local height = surface.map_gen_settings.height/2
  local abs = math.abs
  for k, team in pairs (global.teams) do
    local name = team.name
    local force = game.forces[name]
    if force ~= nil then
      local origin = force.get_spawn_position(surface)
      local origin_X = math.ceil(origin.x/32)
      local origin_Y = math.ceil(origin.y/32)
      for X = -check_radius, check_radius -1 do
        for Y = -check_radius, check_radius -1 do
          total = total + 1
          local chunk_position = {x = X + origin_X,y = Y + origin_Y}
          if (surface.is_chunk_generated(chunk_position)) then
            generated = generated + 1
          elseif (abs(chunk_position.x * 32) > width) or (abs(chunk_position.y * 32) > height) then
            --The chunk is outside the map
            generated = generated + 1
          end
        end
      end
    end
  end
  global.progress = generated/total
  if total == generated then
    game.speed = 1
    global.check_starting_area_generation = false
    global.finish_setup = game.tick + (#global.teams)
    update_progress_bar()
    return
  end
  update_progress_bar()
end

function check_player_color()
  for k, team in pairs (global.teams) do
    local force = game.forces[team.name]
    if force then
      local color = get_color(team)
      for k, player in pairs (force.connected_players) do
        local player_color = player.color
        for c, v in pairs (color) do
          if math.abs(player_color[c] - v) > 0.1 then
            game.print({"player-color-changed-back", player.name})
            player.color = color
            player.chat_color = get_color(team, true)
            break
          end
        end
      end
    end
  end
end

function check_no_rush()
  if not global.end_no_rush then return end
  if game.tick > global.end_no_rush then
    if global.game_config.no_rush_time > 0 then
      game.print({"no-rush-ends"})
    end
    global.end_no_rush = nil
    global.surface.peaceful_mode = global.map_config.peaceful_mode
    game.forces.enemy.kill_all_units()
    return
  end
  local radius = get_starting_area_radius(true)
  local surface = global.surface
  for k, player in pairs (game.connected_players) do
    local force = player.force
    if not is_ignored_force(force.name) then
      local origin = force.get_spawn_position(surface)
      local Xo = origin.x
      local Yo = origin.y
      local position = player.position
      local Xp = position.x
      local Yp = position.y
      if Xp > (Xo + radius) then
        Xp = Xo + (radius - 5)
      elseif Xp < (Xo - radius) then
        Xp = Xo - (radius - 5)
      end
      if Yp > (Yo + radius) then
        Yp = Yo + (radius - 5)
      elseif Yp < (Yo - radius) then
        Yp = Yo - (radius - 5)
      end
      if position.x ~= Xp or position.y ~= Yp then
        local new_position = {x = Xp, y = Yp}
        local vehicle = player.vehicle
        if vehicle then
          new_position = surface.find_non_colliding_position(vehicle.name, new_position, 32, 1) or new_position
          if not vehicle.teleport(new_position) then
            player.driving = false
          end
          vehicle.orientation = vehicle.orientation + 0.5
        elseif player.character then
          new_position = surface.find_non_colliding_position(player.character.name, new_position, 32, 1) or new_position
          player.teleport(new_position)
        else
          player.teleport(new_position)
        end
        local time_left = math.ceil((global.end_no_rush-game.tick)/3600)
        player.print({"no-rush-teleport", time_left})
      end
    end
  end
end

function check_update_production_score()
  if global.game_config.game_mode.selected ~= "production_score" then return end
  local tick = game.tick
  if global.team_won then return end
  local new_scores = production_score.get_production_scores(global.price_list)
  local scale = statistics_period / 60
  local index = tick % (60 * statistics_period)

  if not (global.scores and global.average_score) then
    local average_score = {}
    local scores = {}
    for name, score in pairs (new_scores) do
      scores[name] = {}
      average_score[name] = score * statistics_period
      for k = 0, statistics_period do
        scores[name][k * 60] = score
      end
    end
    global.scores = scores
    global.average_score = average_score
  end

  local scores = global.scores
  local average_score = global.average_score
  for name, score in pairs (new_scores) do
    local old_amount = scores[name][index]
    if not old_amount then
      --Something went wrong, reinitialize it next update
      global.scores = nil
      global.average_score = nil
      return
    end
    average_score[name] = (average_score[name] + score) - old_amount
    scores[name][index] = score
  end

  global.production_scores = new_scores

  for k, player in pairs (game.connected_players) do
    update_production_score_frame(player)
  end
  local required = global.game_config.required_production_score
  if required > 0 then
    for team_name, score in pairs (global.production_scores) do
      if score >= required then
        team_won(team_name)
      end
    end
  end
  if global.game_config.time_limit > 0 and tick > global.round_start_tick + (global.game_config.time_limit * 60 * 60) then
    local winner = {"none"}
    local winning_score = 0
    for team_name, score in pairs (global.production_scores) do
      if score > winning_score then
        winner = team_name
        winning_score = score
      end
    end
    team_won(winner)
  end
end

function check_update_oil_harvest_score()
  if global.team_won then return end
  if global.game_config.game_mode.selected ~= "oil_harvest" then return end
  local item_to_check = "crude-oil-barrel"
  if not game.item_prototypes[item_to_check] then error("Playing oil harvest game mode when crude oil barrels don't exist") end
  local scores = {}
  for force_name, force in pairs (game.forces) do
    local statistics = force.item_production_statistics
    local input = statistics.get_input_count(item_to_check)
    local output = statistics.get_output_count(item_to_check)
    scores[force_name] = input - output
  end
  global.oil_harvest_scores = scores
  for k, player in pairs (game.connected_players) do
    update_oil_harvest_frame(player)
  end
  local required = global.game_config.required_oil_barrels
  if required > 0 then
    for team_name, score in pairs (global.oil_harvest_scores) do
      if score >= required then
        team_won(team_name)
      end
    end
  end
  if global.game_config.time_limit > 0 and game.tick > (global.round_start_tick + (global.game_config.time_limit * 60 * 60)) then
    local winner = {"none"}
    local winning_score = 0
    for team_name, score in pairs (global.oil_harvest_scores) do
      if score > winning_score then
        winner = team_name
        winning_score = score
      end
    end
    team_won(winner)
  end
end

function check_update_space_race_score()
  if global.team_won then return end
  if global.game_config.game_mode.selected ~= "space_race" then return end
  local item_to_check = "satellite"
  if not game.item_prototypes[item_to_check] then error("Playing space race when satellites don't exist") end
  local scores = {}
  for k, team in pairs (global.teams) do
    local force = game.forces[team.name]
    if force then
      scores[team.name] = force.get_item_launched(item_to_check)
    end
  end
  global.space_race_scores = scores
  for k, player in pairs (game.connected_players) do
    update_space_race_frame(player)
  end
  local required = global.game_config.required_satellites_sent
  if required > 0 then
    for team_name, score in pairs (global.space_race_scores) do
      if score >= required then
        team_won(team_name)
      end
    end
  end
end

function finish_setup()
  if not global.finish_setup then return end
  local index = global.finish_setup - game.tick
  local surface = global.surface
  if index == 0 then
    final_setup_step()
    return
  end
  local name = global.teams[index].name
  if not name then return end
  local force = game.forces[name]
  if not force then return end
  create_silo_for_force(force)
  local radius = get_starting_area_radius(true) --[[radius in tiles]]
  if global.game_config.reveal_team_positions then
    for name, other_force in pairs (game.forces) do
      if not is_ignored_force(name) then
        force.chart(surface, get_force_area(other_force))
      end
    end
  end
  create_wall_for_force(force)
  create_starting_chest(force)
  create_starting_turrets(force)
  create_starting_artillery(force)
  protect_force_area(force)
  force.friendly_fire = global.team_config.friendly_fire
  force.share_chart = global.team_config.share_chart
  local hide_crude_recipe_in_stats = global.game_config.game_mode.selected ~= "oil_harvest"
  local fill_recipe = force.recipes["fill-crude-oil-barrel"]
  if fill_recipe then
    fill_recipe.hidden_from_flow_stats = hide_crude_recipe_in_stats
  end
  local empty_recipe = force.recipes["empty-crude-oil-barrel"]
  if empty_recipe then
    empty_recipe.hidden_from_flow_stats = hide_crude_recipe_in_stats
  end
end

function final_setup_step()
  local surface = global.surface
  duplicate_starting_area_entities()
  global.finish_setup = nil
  game.print({"map-ready"})
  global.setup_finished = true
  global.round_start_tick = game.tick
  for k, player in pairs (game.connected_players) do
    destroy_player_gui(player)
    player.teleport({0, 1000}, "Lobby")
    choose_joining_gui(player)
  end
  global.end_no_rush = game.tick + (global.game_config.no_rush_time * 60 * 60)
  if global.game_config.no_rush_time > 0 then
    global.surface.peaceful_mode = true
    game.forces.enemy.kill_all_units()
    game.print({"no-rush-begins", global.game_config.no_rush_time})
  end
  create_exclusion_map()
  if global.game_config.base_exclusion_time > 0 then
    global.check_base_exclusion = true
    game.print({"base-exclusion-begins", global.game_config.base_exclusion_time})
  end
  if global.game_config.reveal_map_center then
    local radius = global.map_config.average_team_displacement/2
    local origin = global.spawn_offset
    local area = {{origin.x - radius, origin.y - radius}, {origin.x + (radius - 32), origin.y + (radius - 32)}}
    for k, force in pairs (game.forces) do
      force.chart(surface, area)
    end
  end
  global.space_race_scores = {}
  global.oil_harvest_scores = {}
  global.production_scores = {}
  if global.team_config.defcon_mode then
    defcon_research()
  end

  script.raise_event(events.on_round_start, {})
end

function check_force_protection(force)
  if not global.game_config.protect_empty_teams then return end
  if not (force and force.valid) then return end
  if is_ignored_force(force.name) then return end
  if not global.protected_teams then global.protected_teams = {} end
  local protected = global.protected_teams[force.name] ~= nil
  local should_protect = #force.connected_players == 0
  if protected and should_protect then return end
  if (not protected) and (not should_protect) then return end
  if protected and (not should_protect) then
    unprotect_force_area(force)
    return
  end
  if (not protected) and should_protect then
    protect_force_area(force)
    check_base_exclusion()
    return
  end
end

function protect_force_area(force)
  if not global.game_config.protect_empty_teams then return end
  local surface = global.surface
  if not (surface and surface.valid) then return end
  local non_destructible = {}
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = get_force_area(force)}) do
    if entity.destructible == false and entity.unit_number then
      non_destructible[entity.unit_number] = true
    end
    entity.destructible = false
  end
  if not global.protected_teams then
    global.protected_teams = {}
  end
  global.protected_teams[force.name] = non_destructible
end

function unprotect_force_area(force)
  if not global.game_config.protect_empty_teams then return end
  local surface = global.surface
  if not (surface and surface.valid) then return end
  if not global.protected_teams then
    global.protected_teams = {}
  end
  local entities = global.protected_teams[force.name] or {}
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = get_force_area(force)}) do
    if (not entity.unit_number) or (not entities[entity.unit_number]) then
      entity.destructible = true
    end
  end
  global.protected_teams[force.name] = nil
end

function get_force_area(force)
  if not (force and force.valid) then return end
  local surface = global.surface
  if not (surface and surface.valid) then return end
  local radius = get_starting_area_radius(true)
  local origin = force.get_spawn_position(surface)
  return {{origin.x - radius, origin.y - radius}, {origin.x + (radius - 1), origin.y + (radius - 1)}}
end

function update_progress_bar()
  if not global.progress then return end
  local percent = global.progress
  local finished = (percent >=1)
  function update_bar_gui(gui)
    if gui.progress_bar then
      if finished then
        gui.progress_bar.destroy()
      else
        gui.progress_bar.bar.value = percent
      end
      return
    end
    if finished then return end
    local frame = gui.add{type = "frame", name = "progress_bar", caption = {"progress-bar"}}
    local bar = frame.add{type = "progressbar", size = 100, value = percent, name = "bar"}
  end
  for k, player in pairs (game.players) do
    update_bar_gui(player.gui.center)
  end
  if finished then
    global.progress = nil
    global.setup_duration = nil
    global.finish_tick = nil
  end
end

function create_silo_for_force(force)
  local condition = global.game_config.game_mode.selected
  local need_silo = {conquest = true, space_race = true, last_silo_standing = true}
  if not need_silo[condition] then return end
  if not force then return end
  if not force.valid then return end
  local surface = global.surface
  local origin = force.get_spawn_position(surface)
  local offset_x = 0
  local offset_y = -25
  local silo_position = {x = origin.x+offset_x, y = origin.y+offset_y}
  local area = {{silo_position.x - 5, silo_position.y - 6}, {silo_position.x + 6, silo_position.y + 6}}
  for i, entity in pairs(surface.find_entities_filtered({area = area, force = "neutral"})) do
    entity.destroy()
  end

  local silo_name = "rocket-silo"
  if not game.entity_prototypes[silo_name] then log("Silo not created as "..silo_name.." is not a valid entity prototype") return end
  local silo = surface.create_entity{name = silo_name, position = silo_position, force = force}
  silo.minable = false
  silo.backer_name = tostring(force.name)

  if global.game_config.game_mode.selected == "space_race" then
    silo.destructible = false
  end
  if not global.silos then global.silos = {} end
  global.silos[force.name] = silo

  local tile_name = "refined-hazard-concrete-left"
  if not game.tile_prototypes[tile_name] then tile_name = get_walkable_tile() end

  local tiles_2 = {}
  for X = -5, 5 do
    for Y = -6, 5 do
      table.insert(tiles_2, {name = tile_name, position = {silo_position.x + X, silo_position.y + Y}})
    end
  end
  set_tiles_safe(surface, tiles_2)
end

function setup_research(force)
  if not force then return end
  if not force.valid then return end
  local tier = global.team_config.research_level.selected
  local index
  local set = (tier ~= "none")
  for k, name in pairs (global.team_config.research_level.options) do
    if global.research_ingredient_list[name] ~= nil then
      global.research_ingredient_list[name] = set
    end
    if name == tier then set = false end
  end
  --[[Unlocks all research, and then unenables them based on a blacklist]]
  force.research_all_technologies()
  for k, technology in pairs (force.technologies) do
    for j, ingredient in pairs (technology.research_unit_ingredients) do
      if not global.research_ingredient_list[ingredient.name] then
        technology.researched = false
        break
      end
    end
  end
end

function create_starting_turrets(force)
  if not global.game_config.team_turrets then return end
  if not (force and force.valid) then return end
  local turret_name = "gun-turret"
  if not game.entity_prototypes[turret_name] then return end
  local ammo_name = global.game_config.turret_ammunition.selected or "firearm-magazine"
  if not game.item_prototypes[ammo_name] then return end
  local surface = global.surface
  local height = global.map_config.map_height/2
  local width = global.map_config.map_width/2
  local origin = force.get_spawn_position(surface)
  local radius = get_starting_area_radius(true) - 18 --[[radius in tiles]]
  local limit = math.min(width - math.abs(origin.x), height - math.abs(origin.y)) - 6
  radius = math.min(radius, limit)
  local positions = {}
  local Xo = origin.x
  local Yo = origin.y
  for X = -radius, radius do
    local Xt = X + Xo
    if X == -radius then
      for Y = -radius, radius do
        local Yt = Y + Yo
        if (Yt + 16) % 32 ~= 0 and Yt % 8 == 0 then
          table.insert(positions, {x = Xo - radius, y = Yt, direction = defines.direction.west})
          table.insert(positions, {x = Xo + radius, y = Yt, direction = defines.direction.east})
        end
      end
    elseif (Xt + 16) % 32 ~= 0 and Xt % 8 == 0 then
      table.insert(positions, {x = Xt, y = Yo - radius, direction = defines.direction.north})
      table.insert(positions, {x = Xt, y = Yo + radius, direction = defines.direction.south})
    end
  end
  local tiles = {}
  local tile_name = "refined-hazard-concrete-left"
  if not game.tile_prototypes[tile_name] then tile_name = get_walkable_tile() end
  local stack = {name = ammo_name, count = 20}
  for k, position in pairs (positions) do
    local area = {{x = position.x - 1, y = position.y - 1},{x = position.x + 1, y = position.y + 1}}
    for k, entity in pairs (surface.find_entities_filtered{area = area, force = "neutral"}) do
      entity.destroy(true)
    end
    local turret = surface.create_entity{name = turret_name, position = position, force = force, direction = position.direction}
    turret.insert(stack)
    table.insert(tiles, {name = tile_name, position = {x = position.x, y = position.y}})
    table.insert(tiles, {name = tile_name, position = {x = position.x - 1, y = position.y}})
    table.insert(tiles, {name = tile_name, position = {x = position.x, y = position.y - 1}})
    table.insert(tiles, {name = tile_name, position = {x = position.x - 1, y = position.y - 1}})
  end
  set_tiles_safe(surface, tiles)
end

function create_starting_artillery(force)
  if not global.game_config.team_artillery then return end
  if not (force and force.valid) then return end
  local turret_name = "artillery-turret"
  if not game.entity_prototypes[turret_name] then return end
  local ammo_name = "artillery-shell"
  if not game.item_prototypes[ammo_name] then return end
  local surface = global.surface
  local height = global.map_config.map_height/2
  local width = global.map_config.map_width/2
  local origin = force.get_spawn_position(surface)
  local size = global.map_config.starting_area_size.selected
  local radius = get_starting_area_radius() - 1 --[[radius in chunks]]
  if radius < 1 then return end
  local positions = {}
  local tile_positions = {}
  for x = -radius, 0 do
    if x == -radius then
      for y = -radius, 0 do
        table.insert(positions, {x = 1 + origin.x + 32*x, y = 1 + origin.y + 32*y})
      end
    else
      table.insert(positions, {x = 1 + origin.x + 32*x, y = 1 + origin.y - radius*32})
    end
  end
  for x = 1, radius do
    if x == radius then
      for y = -radius, -1 do
        table.insert(positions, {x = -2 + origin.x + 32*x, y = 1 + origin.y + 32*y})
      end
    else
      table.insert(positions, {x = -2 + origin.x + 32*x, y = 1 + origin.y - radius*32})
    end
  end
  for x = -radius, -1 do
    if x == -radius then
      for y = 1, radius do
        table.insert(positions, {x = 1 + origin.x + 32*x, y = -2 + origin.y + 32*y})
      end
    else
      table.insert(positions, {x = 1 + origin.x + 32*x, y = -2 + origin.y + radius*32})
    end
  end
  for x = 0, radius do
    if x == radius then
      for y = 0, radius do
        table.insert(positions, {x = -2 + origin.x + 32*x, y = -2 + origin.y + 32*y})
      end
    else
      table.insert(positions, {x = -2 + origin.x + 32*x, y = -2 + origin.y + radius*32})
    end
  end
  local stack = {name = ammo_name, count = 20}
  local tiles = {}
  local tile_name = "refined-hazard-concrete-left"
  if not game.tile_prototypes[tile_name] then tile_name = get_walkable_tile() end
  for k, position in pairs (positions) do
    local turret = surface.create_entity{name = turret_name, position = position, force = force, direction = position.direction}
    turret.insert(stack)
    for k, entity in pairs (surface.find_entities_filtered{area = turret.selection_box, force = "neutral"}) do
      entity.destroy(true)
    end
    for x = -1, 1 do
      for y = -1, 1 do
        table.insert(tiles, {name = tile_name, position = {position.x + x, position.y + y}})
      end
    end
  end
  set_tiles_safe(surface, tiles)
end

function create_wall_for_force(force)
  if not global.game_config.team_walls then return end
  if not force.valid then return end
  local surface = global.surface
  local height = global.map_config.map_height/2
  local width = global.map_config.map_width/2
  local origin = force.get_spawn_position(surface)
  local size = global.map_config.starting_area_size.selected
  local radius = get_starting_area_radius(true) - 13 --[[radius in tiles]]
  local limit = math.min(width - math.abs(origin.x), height - math.abs(origin.y)) - 1
  radius = math.min(radius, limit)
  local perimeter_top = {}
  local perimeter_bottom = {}
  local perimeter_left = {}
  local perimeter_right = {}
  local tiles = {}
  local insert = table.insert
  for X = -radius, radius - 1 do
    insert(perimeter_top, {x = origin.x + X, y = origin.y - radius})
    insert(perimeter_bottom, {x = origin.x + X, y = origin.y + (radius-1)})
  end
  for Y = -radius, radius - 1 do
    insert(perimeter_left, {x = origin.x - radius, y = origin.y + Y})
    insert(perimeter_right, {x = origin.x + (radius-1), y = origin.y + Y})
  end
  local tile_name = "refined-concrete"
  if not game.tile_prototypes[tile_name] then tile_name = get_walkable_tile() end
  local areas = {
    {{perimeter_top[1].x, perimeter_top[1].y - 1}, {perimeter_top[#perimeter_top].x, perimeter_top[1].y + 3}},
    {{perimeter_bottom[1].x, perimeter_bottom[1].y - 3}, {perimeter_bottom[#perimeter_bottom].x, perimeter_bottom[1].y + 1}},
    {{perimeter_left[1].x - 1, perimeter_left[1].y}, {perimeter_left[1].x + 3, perimeter_left[#perimeter_left].y}},
    {{perimeter_right[1].x - 3, perimeter_right[1].y}, {perimeter_right[1].x + 1, perimeter_right[#perimeter_right].y}},
  }
  for k, area in pairs (areas) do
    for i, entity in pairs(surface.find_entities_filtered({area = area})) do
      entity.destroy(true)
    end
  end
  local wall_name = "stone-wall"
  local gate_name = "gate"
  if not game.entity_prototypes[wall_name] then
    log("Setting walls cancelled as "..wall_name.." is not a valid entity prototype")
    return
  end
  if not game.entity_prototypes[gate_name] then
    log("Setting walls cancelled as "..gate_name.." is not a valid entity prototype")
    return
  end

  for k, position in pairs (perimeter_left) do
    if (k ~= 1) and (k ~= #perimeter_left) then
      insert(tiles, {name = tile_name, position = {position.x + 2, position.y}})
      insert(tiles, {name = tile_name, position = {position.x + 1, position.y}})
    end
    local mod = position.y % 32
    if (mod == 14) or (mod == 15) or (mod == 16) or (mod == 17) then
      surface.create_entity{name = gate_name, position = position, direction = 0, force = force}
    else
      surface.create_entity{name = wall_name, position = position, force = force}
    end
  end
  for k, position in pairs (perimeter_right) do
    if (k ~= 1) and (k ~= #perimeter_right) then
      insert(tiles, {name = tile_name, position = {position.x - 2, position.y}})
      insert(tiles, {name = tile_name, position = {position.x - 1, position.y}})
    end
    local mod = position.y % 32
    if (mod == 14) or (mod == 15) or (mod == 16) or (mod == 17) then
      surface.create_entity{name = gate_name, position = position, direction = 0, force = force}
    else
      surface.create_entity{name = wall_name, position = position, force = force}
    end
  end
  for k, position in pairs (perimeter_top) do
    if (k ~= 1) and (k ~= #perimeter_top) then
      insert(tiles, {name = tile_name, position = {position.x, position.y + 2}})
      insert(tiles, {name = tile_name, position = {position.x, position.y + 1}})
    end
    local mod = position.x % 32
    if (mod == 14) or (mod == 15) or (mod == 16) or (mod == 17) then
      surface.create_entity{name = gate_name, position = position, direction = 2, force = force}
    else
      surface.create_entity{name = wall_name, position = position, force = force}
    end
  end
  for k, position in pairs (perimeter_bottom) do
    if (k ~= 1) and (k ~= #perimeter_bottom) then
      insert(tiles, {name = tile_name, position = {position.x, position.y - 2}})
      insert(tiles, {name = tile_name, position = {position.x, position.y - 1}})
    end
    local mod = position.x % 32
    if (mod == 14) or (mod == 15) or (mod == 16) or (mod == 17) then
      surface.create_entity{name = gate_name, position = position, direction = 2, force = force}
    else
      surface.create_entity{name = wall_name, position = position, force = force}
    end
  end
  set_tiles_safe(surface, tiles)
end

function spairs(t, order)
  local keys = {}
  for k in pairs(t) do keys[#keys+1] = k end
  if order then
    table.sort(keys, function(a, b) return order(t, a, b) end)
  else
    table.sort(keys)
  end
  local i = 0
  return function()
    i = i + 1
    if keys[i] then
      return keys[i], t[keys[i]]
    end
  end
end

function verify_oil_harvest()
  if game.item_prototypes["crude-oil-barrel"] and game.entity_prototypes["crude-oil"] and game.recipe_prototypes["fill-crude-oil-barrel"] and game.recipe_prototypes["empty-crude-oil-barrel"] then return end
  for k, mode in pairs (global.game_config.game_mode.options) do
    if mode == "oil_harvest" then
      table.remove(global.game_config.game_mode.options, k)
      log("Oil harvest mode removed from scenario, as oil barrels and crude oil were not present in this configuration.")
      break
    end
  end
end

function oil_harvest_prune_oil(event)
  if global.game_config.game_mode.selected ~= "oil_harvest" then return end
  if not global.game_config.oil_only_in_center then return end
  local area = event.area
  local center = {x = (area.left_top.x + area.right_bottom.x) / 2, y = (area.left_top.y + area.right_bottom.y) / 2}
  local origin = global.spawn_offset
  local distance_from_center = (((center.x - origin.x) ^ 2) + ((center.y - origin.y) ^ 2)) ^ 0.5
  if distance_from_center > global.map_config.average_team_displacement/2.5 then
    for k, entity in pairs (event.surface.find_entities_filtered{area = area, name = "crude-oil"}) do
      entity.destroy()
    end
  end
end

button_press_functions = {
  add_team_button = add_team_button_press,
  admin_button = admin_button_press,
  auto_assign_button = function(event) event.element.parent.destroy() auto_assign(game.players[event.player_index]) end,
  balance_options_cancel = function(event) toggle_balance_options_gui(game.players[event.player_index]) end,
  balance_options_confirm = function(event) local player = game.players[event.player_index]  if set_balance_settings(player) then toggle_balance_options_gui(player) end end,
  balance_options = function(event) toggle_balance_options_gui(game.players[event.player_index]) end,
  config_confirm = function(event) config_confirm(game.players[event.player_index]) end,
  diplomacy_button = diplomacy_button_press,
  diplomacy_cancel = function(event) game.players[event.player_index].opened.destroy() end,
  diplomacy_confirm = diplomacy_confirm,
  join_spectator = function(event) event.element.parent.destroy() spectator_join(game.players[event.player_index]) end,
  objective_button = objective_button_press,
  list_teams_button = list_teams_button_press,
  oil_harvest_button = oil_harvest_button_press,
  space_race_button = space_race_button_press,
  production_score_button = production_score_button_press,
  random_join_button = function(event) event.element.parent.destroy() random_join(game.players[event.player_index]) end,
  spectator_join_team_button = function(event) choose_joining_gui(game.players[event.player_index]) end,
  pvp_export_button = function (event) export_button_press(game.players[event.player_index]) end,
  pvp_export_close = function(event) local player = game.players[event.player_index] player.gui.center.clear() create_config_gui(player) end,
  pvp_import_button = function (event) import_button_press(game.players[event.player_index]) end,
  pvp_import_confirm = function(event) import_confirm(game.players[event.player_index]) end,
}

function duplicate_starting_area_entities()
  if not global.map_config.duplicate_starting_area_entities then return end
  local copy_team = global.teams[1]
  if not copy_team then return end
  local force = game.forces[copy_team.name]
  if not force then return end
  local surface = global.surface
  local origin_spawn = force.get_spawn_position(surface)
  local radius = get_starting_area_radius(true) --[[radius in tiles]]
  local area = {{origin_spawn.x - radius, origin_spawn.y - radius}, {origin_spawn.x + radius, origin_spawn.y + radius}}
  local entities = surface.find_entities_filtered{area = area, force = "neutral"}
  local insert = table.insert
  local tiles = {}
  local counts = {}
  local ignore_counts = {
    ["refined-concrete"] = true,
    ["water"] = true,
    ["deepwater"] = true,
    ["refined-hazard-concrete-left"] = true
  }
  local tile_map = {}
  for name, tile in pairs (game.tile_prototypes) do
    tile_map[name] = tile.collision_mask["resource-layer"] ~= nil
    counts[name] = surface.count_tiles_filtered{name = name, area = area}
  end
  local tile_name = get_walkable_tile()
  local top_count = 0
  for name, count in pairs (counts) do
    if not ignore_counts[name] then
      if count > top_count then
        top_count = count
        tile_name = name
      end
    end
  end

  for name, bool in pairs (tile_map) do
    if bool and counts[name] > 0 then
      for k, tile in pairs (surface.find_tiles_filtered{area = area, name = name}) do
        insert(tiles, tile)
      end
    end
  end

  for k, team in pairs (global.teams) do
    if team.name ~= copy_team.name then
      local force = game.forces[team.name]
      if force then
        local spawn = force.get_spawn_position(surface)
        local area = {{spawn.x - radius, spawn.y - radius}, {spawn.x + radius, spawn.y + radius}}
        for k, entity in pairs (surface.find_entities_filtered{area = area, force = "neutral"}) do
          entity.destroy()
        end
        local set_tiles = {}
        for name, bool in pairs (tile_map) do
          if bool then
            for k, tile in pairs (surface.find_tiles_filtered{area = area, name = name}) do
              insert(set_tiles, {name = tile_name, position = {x = tile.position.x, y = tile.position.y}})
            end
          end
        end
        for k, tile in pairs (tiles) do
          local position = {x = (tile.position.x - origin_spawn.x) + spawn.x, y = (tile.position.y - origin_spawn.y) + spawn.y}
          insert(set_tiles, {name = tile.name, position = position})
        end
        surface.set_tiles(set_tiles)
        for k, entity in pairs (entities) do
          if entity.valid then
            local position = {x = (entity.position.x - origin_spawn.x) + spawn.x, y = (entity.position.y - origin_spawn.y) + spawn.y}
            local type = entity.type
            local amount = (type == "resource" and entity.amount) or nil
            local cliff_orientation = (type == "cliff" and entity.cliff_orientation) or nil
            surface.create_entity{name = entity.name, position = position, force = "neutral", amount = amount, cliff_orientation = cliff_orientation}
          end
        end
      end
    end
  end
end

function check_spectator_chart()
  if global.game_config.spectator_fog_of_war then return end
  local force = game.forces.spectator
  if not (force and force.valid) then return end
  if #force.connected_players > 0 then
    force.chart_all(global.surface)
  end
end

function create_starting_chest(force)
  if not (force and force.valid) then return end
  local value = global.team_config.starting_chest.selected
  if value == "none" then return end
  local multiplier = global.team_config.starting_chest_multiplier
  if not (multiplier > 0) then return end
  local inventory = global.inventory_list[value]
  if not inventory then return end
  local surface = global.surface
  local chest_name = "steel-chest"
  local prototype = game.entity_prototypes[chest_name]
  if not prototype then
    log("Starting chest "..chest_name.." is not a valid entity prototype, picking a new container from prototype list")
    for name, chest in pairs (game.entity_prototypes) do
      if chest.type == "container" then
        chest_name = name
        prototype = chest
        break
      end
    end
  end
  local bounding_box = prototype.collision_box
  local size = math.ceil(math.max(bounding_box.right_bottom.x - bounding_box.left_top.x, bounding_box.right_bottom.y - bounding_box.left_top.y))
  local origin = force.get_spawn_position(surface)
  origin.y = origin.y + 8
  local index = 1
  local position = {x = origin.x + get_chest_offset(index).x * size, y = origin.y + get_chest_offset(index).y * size}
  local chest = surface.create_entity{name = chest_name, position = position, force = force}
  for k, v in pairs (surface.find_entities_filtered{force = "neutral", area = chest.bounding_box}) do
    v.destroy()
  end
  local tiles = {}
  local grass = {}
  local tile_name = "refined-concrete"
  if not game.tile_prototypes[tile_name] then tile_name = get_walkable_tile() end
  table.insert(tiles, {name = tile_name, position = {x = position.x, y = position.y}})
  chest.destructible = false
  for name, count in pairs (inventory) do
    local count_to_insert = math.ceil(count*multiplier)
    local difference = count_to_insert - chest.insert{name = name, count = count_to_insert}
    while difference > 0 do
      index = index + 1
      position = {x = origin.x + get_chest_offset(index).x * size, y = origin.y + get_chest_offset(index).y * size}
      chest = surface.create_entity{name = chest_name, position = position, force = force}
      for k, v in pairs (surface.find_entities_filtered{force = "neutral", area = chest.bounding_box}) do
        v.destroy()
      end
      table.insert(tiles, {name = tile_name, position = {x = position.x, y = position.y}})
      chest.destructible = false
      difference = difference - chest.insert{name = name, count = difference}
    end
  end
  set_tiles_safe(surface, tiles)
end

function get_chest_offset(n)
  local offset_x = 0
  n = n/2
  if n % 1 == 0.5 then
    offset_x = -1
    n = n + 0.5
  end
  local root = n^0.5
  local nearest_root = math.floor(root+0.5)
  local upper_root = math.ceil(root)
  local root_difference = math.abs(nearest_root^2 - n)
  if nearest_root == upper_root then
    x = upper_root - root_difference
    y = nearest_root
  else
    x = upper_root
    y = root_difference
  end
  local orientation = 2 * math.pi * (45/360)
  x = x * (2^0.5)
  y = y * (2^0.5)
  local rotated_x = math.floor(0.5 + x * math.cos(orientation) - y * math.sin(orientation))
  local rotated_y = math.floor(0.5 + x * math.sin(orientation) + y * math.cos(orientation))
  return {x = rotated_x + offset_x, y = rotated_y}
end

function get_walkable_tile()
  for name, tile in pairs (game.tile_prototypes) do
    if tile.collision_mask["player-layer"] == nil and not tile.items_to_place_this then
      return name
    end
  end
  error("No walkable tile in prototype list")
end

function set_tiles_safe(surface, tiles)
  local grass = get_walkable_tile()
  local grass_tiles = {}
  for k, tile in pairs (tiles) do
    grass_tiles[k] = {position = {x = (tile.position.x or tile.position[1]), y = (tile.position.y or tile.position[2])}, name = grass}
  end
  surface.set_tiles(grass_tiles, false)
  surface.set_tiles(tiles)
end

function create_exclusion_map()
  local surface = global.surface
  if not (surface and surface.valid) then return end
  local exclusion_map = {}
  local radius = get_starting_area_radius() --[[radius in chunks]]
  for k, team in pairs (global.teams) do
    local name = team.name
    local force = game.forces[name]
    if force then
      local origin = force.get_spawn_position(surface)
      local Xo = math.floor(origin.x / 32)
      local Yo = math.floor(origin.y / 32)
      for X = -radius, radius - 1 do
        Xb = X + Xo
        if not exclusion_map[Xb] then exclusion_map[Xb] = {} end
        for Y = -radius, radius - 1 do
          local Yb = Y + Yo
          exclusion_map[Xb][Yb] = name
        end
      end
    end
  end
  global.exclusion_map = exclusion_map
end

function check_base_exclusion()
  if not (global.check_base_exclusion or global.protected_teams) then return end

  if global.check_base_exclusion and game.tick > (global.round_start_tick + (global.game_config.base_exclusion_time * 60 * 60)) then
    global.check_base_exclusion = nil
    game.print({"base-exclusion-ends"})
  end

  local surface = global.surface
  local exclusion_map = global.exclusion_map
  if not exclusion_map then return end
  for k, player in pairs (game.connected_players) do
    if not is_ignored_force(player.force.name) then
      check_player_exclusion(player, get_chunk_map_position(player.position))
    end
  end
end

function get_chunk_map_position(position)
  local map = global.exclusion_map
  local chunk_x = math.floor(position.x / 32)
  local chunk_y = math.floor(position.y / 32)
  if map[chunk_x] then
    return map[chunk_x][chunk_y]
  end
end


local disallow =
{
  ["player"] = true,
  ["enemy"] = true,
  ["neutral"] = true,
  ["spectator"] = true
}

function is_ignored_force(name)
  return disallow[name]
end

function check_player_exclusion(player, force_name)
  if not force_name then return end
  local force = game.forces[force_name]
  if not (force and force.valid and player and player.valid) then return end
  if force == player.force or force.get_friend(player.force) then return end
  if not (global.check_base_exclusion or (global.protected_teams and global.protected_teams[force_name])) then return end
  local surface = global.surface
  local origin = force.get_spawn_position(surface)
  local size = global.map_config.starting_area_size.selected
  local radius = get_starting_area_radius(true) + 5 --[[radius in tiles]]
  local position = {x = player.position.x, y = player.position.y}
  local vector = {x = 0, y = 0}

  if position.x < origin.x then
    vector.x = (origin.x - radius) - position.x
  elseif position.x > origin.x then
    vector.x = (origin.x + radius) - position.x
  end

  if position.y < origin.y then
    vector.y = (origin.y - radius) - position.y
  elseif position.y > origin.y then
    vector.y = (origin.y + radius) - position.y
  end

  if math.abs(vector.x) < math.abs(vector.y) then
    vector.y = 0
  else
    vector.x = 0
  end
  position = {x = position.x + vector.x, y = position.y + vector.y}
  local vehicle = player.vehicle
  if vehicle then
    position = surface.find_non_colliding_position(vehicle.name, position, 32, 1) or position
    if not vehicle.teleport(position) then
      player.driving = false
    end
    vehicle.orientation = vehicle.orientation + 0.5
  elseif player.character then
    position = surface.find_non_colliding_position(player.character.name, position, 32, 1) or position
    player.teleport(position)
  else
    player.teleport(position)
  end
  if global.check_base_exclusion then
    local time_left = math.ceil((global.round_start_tick + (global.game_config.base_exclusion_time * 60 * 60) - game.tick) / 3600)
    player.print({"base-exclusion-teleport", time_left})
  else
    player.print({"protected-base-area"})
  end
end

function set_button_style(button)
  if not button.valid then return end
  button.style.font = "default"
  button.style.top_padding = 0
  button.style.bottom_padding = 0
end

function check_restart_round()
  if not global.team_won then return end
  local time = global.game_config.auto_new_round_time
  if not (time > 0) then return end
  if game.tick < (global.game_config.auto_new_round_time * 60 * 60) + global.team_won then return end
  end_round()
  destroy_config_for_all()
  prepare_next_round()
end

function team_won(name)
  global.team_won = game.tick
  if global.game_config.auto_new_round_time > 0 then
    game.print({"team-won-auto", name, global.game_config.auto_new_round_time})
  else
    game.print({"team-won", name})
  end
  script.raise_event(events.on_team_won, {name = name})
end


function offset_respawn_position(player)
  --This is to help the spawn camping situations.
  if not (player and player.valid and player.character) then return end
  local surface = player.surface
  local origin = player.force.get_spawn_position(surface)
  local radius = get_starting_area_radius(true) - 32
  if not (radius > 0) then return end
  local random_position = {origin.x + math.random(-radius, radius), origin.y + math.random(-radius, radius)}
  local position = surface.find_non_colliding_position(player.character.name, random_position, 32, 1)
  if not position then return end
  player.teleport(position)
end

function disband_team(force, desination_force)
  local count = 0
  for k, team in pairs (global.teams) do
    if game.forces[team.name] then
      count = count + 1
    end
  end
  if not (count > 1) then
    --Can't disband the last team.
    return
  end
  force.print{"join-new-team"}
  local players = global.players_to_disband or {}
  for k, player in pairs (force.players) do
    players[player.name] = true
  end
  global.players_to_disband = players
  if desination_force and force ~= desination_force then
    game.merge_forces(force, desination_force)
  else
    game.merge_forces(force, "neutral")
  end
end

recursive_data_check = function(new_data, old_data)
  for k, data in pairs (new_data) do
    if not old_data[k] then
      old_data[k] = data
    elseif type(data) == "table" then
      recursive_data_check(new_data[k], old_data[k])
    end
  end
end

check_cursor_for_disabled_items = function(event)
  if not global.disabled_items then return end
  local player = game.players[event.player_index]
  if not (player and player.valid) then return end
  local stack = player.cursor_stack
  if (stack and stack.valid_for_read) then
    if global.disabled_items[stack.name] then
      stack.clear()
    end
  end
end

disable_items_elem_changed = function(event)
  local gui = event.element
  local player = game.players[event.player_index]
  if not (player and player.valid and gui and gui.valid) then return end
  local parent = gui.parent
  if not global.disabled_items then
    global.disabled_items = {}
  end
  local items = global.disabled_items
  if parent.name ~= "disable_items_table" then return end
  local value = gui.elem_value
  if not value then
    local map = {}
    for k, child in pairs (parent.children) do
      if child.elem_value then
        map[child.elem_value] = true
      end
    end
    for item, bool in pairs (items) do
      if not map[item] then
        items[item] = nil
      end
    end
    gui.destroy()
    return
  end
  if items[value] then
    if items[value] ~= gui.index then
      gui.elem_value = nil
      player.print({"duplicate-disable"})
    end
  else
    items[value] = gui.index
    parent.add{type = "choose-elem-button", elem_type = "item"}
  end
  global.disabled_items = items
end

recipe_picker_elem_changed = function(event)
  local gui = event.element
  local player = game.players[event.player_index]
  recipe_picker_elem_update(gui, player)
end

function recipe_picker_elem_update(gui, player)
  if not (player and player.valid and gui and gui.valid) then return end
  local flow = gui.parent
  if not flow then return end
  local frame = flow.parent
  if not (frame and frame.name == "production_score_frame") then return end
  if frame.recipe_check_frame then
    frame.recipe_check_frame.destroy()
  end
  if gui.elem_value == nil then
    return
  end
  local recipe = player.force.recipes[gui.elem_value]
  local recipe_frame = frame.add{type = "frame", direction = "vertical", style = "image_frame", name = "recipe_check_frame"}
  local title_flow = recipe_frame.add{type = "flow"}
  title_flow.style.align = "center"
  title_flow.style.horizontally_stretchable = true
  title_flow.add{type = "label", caption = recipe.localised_name, style = "frame_caption_label"}
  local table = recipe_frame.add{type = "table", column_count = 2, name = "recipe_checker_table"}
  table.draw_horizontal_line_after_headers = true
  table.draw_vertical_lines = true
  table.style.horizontal_spacing = 16
  table.style.vertical_spacing = 2
  table.style.left_padding = 4
  table.style.right_padding = 4
  table.style.top_padding = 4
  table.style.bottom_padding = 4
  table.style.column_alignments[1] = "center"
  table.style.column_alignments[2] = "center"
  table.add{type = "label", caption = {"ingredients"}, style = "bold_label"}
  table.add{type = "label", caption = {"products"}, style = "bold_label"}
  local ingredients = recipe.ingredients
  local products = recipe.products
  local prices = global.price_list
  local cost = 0
  local gain = 0
  local prototypes = {
    fluid = game.fluid_prototypes,
    item = game.item_prototypes
  }
  for k = 1, math.max(#ingredients, #products) do
    local ingredient = ingredients[k]
    local flow = table.add{type = "flow", direction = "horizontal"}
    if k == 1 then
      flow.style.top_padding = 8
    end
    flow.style.vertical_align = "center"
    if ingredient then
      local ingredient_price = prices[ingredient.name] or 0
      flow.add
      {
        type = "sprite-button",
        name = ingredient.type.."/"..ingredient.name,
        sprite = ingredient.type.."/"..ingredient.name,
        number = ingredient.amount,
        style = "slot_button",
        tooltip = {"", "1 ", prototypes[ingredient.type][ingredient.name].localised_name, " = ", util.format_number(math.floor(ingredient_price * 100) / 100)},
      }
      local price = ingredient.amount * ingredient_price or 0
      add_pusher(flow)
      flow.add{type = "label", caption = util.format_number(math.floor(price * 100) / 100)}
      cost = cost + price
    end
    local product = products[k]
    flow = table.add{type = "flow", direction = "horizontal"}
    if k == 1 then
      flow.style.top_padding = 8
    end
    flow.style.vertical_align = "center"
    if product then
      local amount = product.amount or product.probability * (product.amount_max + product.amount_min) / 2 or 0
      local product_price = prices[product.name] or 0
      flow.add
      {
        type = "sprite-button",
        name = product.type.."/"..product.name,
        sprite = product.type.."/"..product.name,
        number = amount,
        style = "slot_button",
        tooltip = {"", "1 ", prototypes[product.type][product.name].localised_name, " = ", util.format_number(math.floor(product_price * 100) / 100)},
        show_percent_for_small_numbers = true
      }
      add_pusher(flow)
      local price = amount * product_price or 0
      flow.add{type = "label", caption = util.format_number(math.floor(price * 100) / 100)}
      gain = gain + price
    end
  end
  local line = table.add{type = "table", column_count = 1}
  line.draw_horizontal_lines = true
  add_pusher(line)
  add_pusher(line)
  line.style.top_padding = 8
  line.style.bottom_padding = 4
  local line = table.add{type = "table", column_count = 1}
  line.draw_horizontal_lines = true
  add_pusher(line)
  add_pusher(line)
  line.style.top_padding = 8
  line.style.bottom_padding = 4
  local cost_flow = table.add{type = "flow"}
  cost_flow.add{type = "label", caption = {"", {"cost"}, {"colon"}}}
  add_pusher(cost_flow)
  cost_flow.add{type = "label", caption = util.format_number(math.floor(cost * 100) / 100)}
  local gain_flow = table.add{type = "flow"}
  gain_flow.add{type = "label", caption = {"", {"gain"}, {"colon"}}}
  add_pusher(gain_flow)
  gain_flow.add{type = "label", caption = util.format_number(math.floor(gain * 100) / 100)}
  table.add{type = "flow"}
  local total_flow = table.add{type = "flow"}
  total_flow.add{type = "label", caption = {"", {"total"}, {"colon"}}, style = "bold_label"}
  add_pusher(total_flow)
  local total = total_flow.add{type = "label", caption = util.format_number(math.floor((gain-cost) * 100) / 100), style = "bold_label"}
  if cost > gain then
    total.style.font_color = {r = 1, g = 0.3, b = 0.3}
  end

end

function add_pusher(gui)
  local pusher = gui.add{type = "flow"}
  pusher.style.horizontally_stretchable = true
end

function check_on_built_protection(event)
  if not global.game_config.enemy_building_restriction then return end
  local entity = event.created_entity
  local player = game.players[event.player_index]
  if not (entity and entity.valid and player and player.valid) then return end
  local force = entity.force
  local name = get_chunk_map_position(entity.position)
  if not name then return end
  if force.name == name then return end
  local other_force = game.forces[name]
  if not other_force then return end
  if other_force.get_friend(force) then return end
  if not player.mine_entity(entity, true) then
    entity.destroy()
  end
  player.print({"enemy-building-restriction"})
end

function check_defcon()
  if not global.team_config.defcon_mode then return end
  local defcon_tick = global.last_defcon_tick
  if not defcon_tick then
    global.last_defcon_tick = game.tick
    return
  end
  local duration = math.max(60, (global.team_config.defcon_timer * 60 * 60))
  local tick_of_defcon = defcon_tick + duration
  local current_tick = game.tick
  local progress = math.max(0, math.min(1, 1 - (tick_of_defcon - current_tick) / duration))
  local tech = global.next_defcon_tech
  if tech and tech.valid then
    for k, team in pairs (global.teams) do
      local force = game.forces[team.name]
      if force then
        if force.current_research ~= tech.name then
          force.current_research = tech.name
        end
        force.research_progress = progress
      end
    end
  end
  if current_tick >= tick_of_defcon then
    defcon_research()
    global.last_defcon_tick = current_tick
  end
end

recursive_technology_prerequisite = function(tech)
  for name, prerequisite in pairs (tech.prerequisites) do
    if not prerequisite.researched then
      return recursive_technology_prerequisite(prerequisite)
    end
  end
  return tech
end

function defcon_research()

  local tech = global.next_defcon_tech
  if tech and tech.valid then
    for k, team in pairs (global.teams) do
      local force = game.forces[team.name]
      if force then
        local tech = force.technologies[tech.name]
        if tech then
          tech.researched = true
        end
      end
    end
    local sound = "utility/research_completed"
    if game.is_valid_sound_path(sound) then
      game.play_sound({path = sound})
    end
    game.print({"defcon-unlock", tech.localised_name}, {r = 1, g = 0.5, b = 0.5})
  end

  local force
  for k, team in pairs (global.teams) do
    force = game.forces[team.name]
    if force and force.valid then
      break
    end
  end
  if not force then return end
  local available_techs = {}
  for name, tech in pairs (force.technologies) do
    if tech.enabled and tech.researched == false then
      table.insert(available_techs, tech)
    end
  end
  if #available_techs == 0 then return end
  local random_tech = available_techs[math.random(#available_techs)]
  if not random_tech then return end
  random_tech = recursive_technology_prerequisite(random_tech)
  global.next_defcon_tech = game.technology_prototypes[random_tech.name]
  for k, team in pairs (global.teams) do
    local force = game.forces[team.name]
    if force then
      force.current_research = random_tech.name
    end
  end
end

function check_neutral_chests(event)
  if not global.game_config.neutral_chests then return end
  local entity = event.created_entity
  if not (entity and entity.valid) then return end
  if entity.type == "container" then
    entity.force = "neutral"
  end
end

function export_button_press(player)
  if not (player and player.valid) then return end
  if not parse_config(player) then return end
  local gui = player.gui.center
  gui.clear()
  local frame = gui.add{type = "frame", caption = {"gui.export-to-string"}, name = "pvp_export_frame", direction = "vertical"}
  local textfield = frame.add{type = "text-box"}
  textfield.word_wrap = true
  textfield.read_only = true
  textfield.style.height = player.display_resolution.height * 0.6
  textfield.style.width = player.display_resolution.width * 0.6
  local data =
  {
    game_config = global.game_config,
    team_config = global.team_config,
    map_config = global.map_config,
    modifier_list = global.modifier_list,
    teams = global.teams,
    disabled_items = global.disabled_items
  }
  textfield.text = util.encode(serpent.dump(data))
  local button = frame.add{type = "button", caption = {"gui.close"}, name = "pvp_export_close"}
  frame.style.visible = true
end

function import_button_press(player)
  if not (player and player.valid) then return end
  local gui = player.gui.center
  gui.clear()
  local frame = gui.add{type = "frame", caption = {"gui-blueprint-library.import-string"}, name = "pvp_import_frame", direction = "vertical"}
  local textfield = frame.add{type = "text-box", name = "import_textfield"}
  textfield.word_wrap = true
  textfield.style.height = player.display_resolution.height * 0.6
  textfield.style.width = player.display_resolution.width * 0.6
  local flow = frame.add{type = "flow", direction = "horizontal"}
  flow.add{type = "button", caption = {"gui.close"}, name = "pvp_export_close"}
  local pusher = flow.add{type = "flow"}
  pusher.style.horizontally_stretchable = true
  flow.add{type = "button", caption = {"gui-blueprint-library.import"}, name = "pvp_import_confirm"}
  frame.style.visible = true
end

function import_confirm(player)
  if not (player and player.valid) then return end
  local gui = player.gui.center
  local frame = gui.pvp_import_frame
  if not frame then return end
  local textfield = frame.import_textfield
  if not textfield then return end
  local text = textfield.text
  if text == "" then player.print({"import-failed"}) return end
  local result = loadstring(util.decode(text))
  local new_config
  if result then
    new_config = result()
  else
    player.print({"import-failed"})
    return
  end
  for k, v in pairs (new_config) do
    global[k] = v
  end
  gui.clear()
  create_config_gui(player)
  player.print({"import-success"})
end

function on_calculator_button_press(event)
  local gui = event.element
  if not (gui and gui.valid) then return end
  local player = game.players[event.player_index]
  if not (player and player.valid) then return end
  local name = gui.name
  if (not name) or name == "" then return end
  local flow = gui.parent
  if not flow then return end
  local recipe_table = flow.parent
  if not (recipe_table and recipe_table.name and recipe_table.name == "recipe_checker_table") then return end
  local delim = "/"
  local pos = name:find(delim)
  local type = name:sub(1, pos - 1)
  local elem_name = name:sub(pos + 1, name:len())
  local items = game.item_prototypes
  local fluids = game.fluid_prototypes
  local recipes = game.recipe_prototypes
  if type == "item" then
    if not items[elem_name] then return end
  elseif type == "fluid" then
    if not fluids[elem_name] then return end
  else
    return
  end
  local frame = mod_gui.get_frame_flow(player).production_score_frame
  if not frame then return end
  local flow = frame.recipe_picker_holding_flow
  if not flow then return end
  local elem_button = flow.recipe_picker_elem_button
  local selected = elem_button.elem_value
  local candidates = {}
  for name, recipe in pairs (recipes) do
    for k, product in pairs (recipe.products) do
      if product.type == type and product.name == elem_name then
        table.insert(candidates, name)
      end
    end
  end
  if #candidates == 0 then return end
  local index = 0
  for k, name in pairs (candidates) do
    if name == selected then
      index = k
      break
    end
  end
  local recipe_name = candidates[index + 1] or candidates[1]
  if not recipe_name then return end
  elem_button.elem_value = recipe_name
  recipe_picker_elem_update(elem_button, player)
end

pvp = {}

pvp.on_init = function()
  load_config()
  init_balance_modifiers()
  verify_oil_harvest()
  local surface = game.surfaces[1]
  local settings = surface.map_gen_settings
  global.map_config.starting_area_size.selected = settings.starting_area
  global.map_config.map_height = settings.height
  global.map_config.map_width = settings.width
  global.map_config.starting_area_size.selected = settings.starting_area
  global.round_number = 0
  local surface = game.create_surface("Lobby",{width = 1, height = 1})
  surface.set_tiles({{name = "out-of-map",position = {1,1}}})
  for k, force in pairs (game.forces) do
    force.disable_all_prototypes()
    force.disable_research()
  end
  global.price_list = production_score.generate_price_list()
  for k, entity in pairs (surface.find_entities()) do
    entity.destroy()
  end
  surface.destroy_decoratives({{-500,-500},{500,500}})
  remote.call("DyWorld", "Change_RPG_System", "PvP")
end

pvp.on_rocket_launched = function(event)
  production_score.on_rocket_launched(event)
  local mode = global.game_config.game_mode.selected
  if mode == "freeplay" then
    if silo_script then
      silo_script.on_rocket_launched(event)
    end
    return
  end
  if mode ~= "conquest" then return end
  local force = event.rocket.force
  if event.rocket.get_item_count("satellite") == 0 then
    force.print({"rocket-launched-without-satellite"})
    return
  end
  if not global.team_won then
    team_won(force.name)
  end
end

pvp.on_entity_died = function(event)
  local mode = global.game_config.game_mode.selected
  if not (mode == "conquest" or mode == "last_silo_standing") then return end
  local silo = event.entity
  if not (silo and silo.valid and silo.name == "rocket-silo") then
    return
  end
  local killing_force = event.force
  local force = silo.force
  if not global.silos then return end
  global.silos[force.name] = nil
  if killing_force then
    game.print({"silo-destroyed", force.name, killing_force.name})
  else
    game.print({"silo-destroyed", force.name, {"neutral"}})
  end
  script.raise_event(events.on_team_lost, {name = force.name})
  if global.game_config.disband_on_loss then
    disband_team(force, killing_force)
  end
  if not global.team_won then
    local index = 0
    local winner_name = {"none"}
    for name, listed_silo in pairs (global.silos) do
      if listed_silo ~= nil then
        index = index + 1
        winner_name = name
      end
    end
    if index == 1  then
        team_won(winner_name)
    end
  end
end

pvp.on_player_joined_game = function(event)
  local player = game.players[event.player_index]
  if not (player and player.valid) then return end
  if player.force.name ~= "player" then
    --If they are not on the player force, they have already picked a team this round.
    check_force_protection(player.force)
    for k, player in pairs (game.connected_players) do
      update_team_list_frame(player)
    end
    return
  end
  local character = player.character
  player.character = nil
  if character then character.destroy() end
  player.set_controller{type = defines.controllers.ghost}
  player.teleport({0, 1000}, game.surfaces.Lobby)
  player.gui.center.clear()
  if global.setup_finished then
    choose_joining_gui(player)
  else
    if player.admin then
      create_config_gui(player)
    else
      create_waiting_gui(player)
    end
  end
end

pvp.on_gui_selection_state_changed = function(event)
  local gui = event.element
  local player = game.players[event.player_index]
  set_mode_input(player)
end

pvp.on_gui_checked_state_changed = function(event)
  diplomacy_check_press(event)
  local player = game.players[event.player_index]
  if not (player and player.valid) then return end
  set_mode_input(player)
end

pvp.on_player_left_game = function(event)
  for k, player in pairs (game.players) do
    local gui = player.gui.center
    if gui.pick_join_frame then
      create_pick_join_gui(gui)
    end
    if player.connected then
      update_team_list_frame(player)
    end
  end
  if global.game_config.protect_empty_teams then
    local player = game.players[event.player_index]
    local force = player.force
    check_force_protection(force)
  end
end

pvp.on_gui_elem_changed = function(event)
  disable_items_elem_changed(event)
  recipe_picker_elem_changed(event)
end

pvp.on_gui_click = function(event)
  local gui = event.element
  local player = game.players[event.player_index]

  if not (player and player.valid and gui and gui.valid) then return end

  if gui.name then
    local button_function = button_press_functions[gui.name]
    if button_function then
      button_function(event)
      return
    end
  end

  trash_team_button_press(event)
  on_team_button_press(event)
  admin_frame_button_press(event)
  on_pick_join_button_press(event)
  on_calculator_button_press(event)
end

pvp.on_gui_closed = function(event)
  local gui = event.element
  if not (gui and gui.valid) then return end
  if gui.name == "diplomacy_frame" then
    gui.destroy()
    return
  end
end

pvp.on_tick = function(event)
  if global.setup_finished == false then
    check_starting_area_chunks_are_generated()
    finish_setup()
  end
end

pvp.on_nth_tick = {
  [60] = function(event)
    if global.setup_finished == true then
      check_no_rush()
      check_update_production_score()
      check_update_oil_harvest_score()
      check_update_space_race_score()
      check_restart_round()
      check_base_exclusion()
      check_defcon()
    end
  end,
  [300] = function(event)
    if global.setup_finished == true then
      check_player_color()
      check_spectator_chart()
    end
  end
}

pvp.on_chunk_generated = function(event)
  oil_harvest_prune_oil(event)
end

pvp.on_player_respawned = function(event)
  local player = game.players[event.player_index]
  if not (player and player.valid) then return end
  if global.setup_finished == true then
    give_equipment(player)
    offset_respawn_position(player)
    apply_character_modifiers(player)
  else
    if player.character then
      player.character.destroy()
    end
  end
end

pvp.on_configuration_changed = function(event)
  recursive_data_check(load_config(true), global)
end

pvp.on_player_crafted_item = function(event)
  production_score.on_player_crafted_item(event)
end

pvp.on_player_display_resolution_changed = function(event)
  check_config_frame_size(event)
  check_balance_frame_size(event)
  local player = game.players[event.player_index]
  if player and player.valid then
    update_team_list_frame(player)
  end
end

pvp.on_research_finished = function(event)
  check_technology_for_disabled_items(event)
end

pvp.on_player_cursor_stack_changed = function(event)
  check_cursor_for_disabled_items(event)
end

pvp.on_built_entity = function(event)
  check_on_built_protection(event)
  check_neutral_chests(event)
end

pvp.on_robot_built_entity = function(event)
  check_neutral_chests(event)
end

pvp.on_research_started = function(event)
  if global.team_config.defcon_mode then
    local tech = global.next_defcon_tech
    if tech and tech.valid and event.research.name ~= tech.name then
      event.research.force.current_research = nil
    end
  end
end

pvp.on_player_promoted = function(event)
  local player = game.players[event.player_index]
  init_player_gui(player)
end

pvp.on_forces_merged = function (event)
  if not global.players_to_disband then return end
  for name, k in pairs (global.players_to_disband) do
    local player = game.players[name]
    if player and player.valid then
      player.force = game.forces.player
      if player.connected then
        local character = player.character
        player.character = nil
        if character then character.destroy() end
        player.set_controller{type = defines.controllers.ghost}
        player.teleport({0, 1000}, game.surfaces.Lobby)
        destroy_player_gui(player)
        choose_joining_gui(player)
      end
    end
  end
  global.players_to_disband = nil
  create_exclusion_map()
end

return pvp
