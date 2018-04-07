function load_config(dummy_load)
  local config = global
  if dummy_load then
    config = {}
  end

  config.setup_finished = false

  config.map_config =
  {
    average_team_displacement = 1024,
    map_height = 0,
    map_width = 0,
    map_seed = 0,
    starting_area_size =
    {
      options = {"none", "very-low", "low", "normal", "high", "very-high"},
      selected = "normal"
    },
    always_day = false,
    biters_disabled = false,
    peaceful_mode = false,
    evolution_factor = 0,
    duplicate_starting_area_entities = false
  }

  config.game_config = 
  {
    game_mode =
    {
      options = {"conquest", "space_race", "last_silo_standing", "freeplay", "production_score", "oil_harvest"},
      selected = "conquest",
      tooltip = 
      {
        "", {"game_mode_tooltip"},
        "\n", {"conquest_description"},
        "\n", {"space_race_description"},
        "\n", {"last_silo_standing_description"},
        "\n", {"freeplay_description"},
        "\n", {"production_score_description"},
        "\n", {"oil_harvest_description"}
      }
    },
    disband_on_loss = false,
    time_limit = 0,
    required_production_score = 50000000,
    required_oil_barrels = 1000,
    required_satellites_sent = 1,
    oil_only_in_center = true,
    allow_spectators = false,
    spectator_fog_of_war = true,
    no_rush_time = 0,
    base_exclusion_time = 0,
    reveal_team_positions = true,
    reveal_map_center = false,
    team_walls = true,
    team_turrets = true,
    turret_ammunition =
    {
      options = {"firearm-magazine"},
      selected = "firearm-magazine"
    },
    team_artillery = false,
    give_artillery_remote = false,
    auto_new_round_time = 0,
    protect_empty_teams = true,
    enemy_building_restriction = false,
    neutral_chests = false
  }

  local entity_name = "gun-turret"
  local prototype = game.entity_prototypes[entity_name]
  if not prototype then
    config.game_config.team_turrets = nil
    config.game_config.turret_ammunition = nil
  else
    local category = prototype.attack_parameters.ammo_category
    if category then
      local ammos = {}
      for name, item in pairs (game.item_prototypes) do
        if item.type == "ammo" then
          local ammo = item.get_ammo_type()
          if ammo and ammo.category == category then
            table.insert(ammos, name)
          end
        end
      end
      config.game_config.turret_ammunition.options = ammos
      if not game.item_prototypes["firearm-magazine"] then
        config.game_config.turret_ammunition.selected = ammos[1] or ""
      end
    end
  end

  config.team_config =
  {
    max_players = 0,
    friendly_fire = true,
    share_chart = true,
    diplomacy_enabled = false,
    who_decides_diplomacy =
    {
      options = {"all_players", "team_leader"},
      selected = "all_players"
    },
    team_joining =
    {
      options = {"player_pick", "random", "auto_assign"},
      selected = "auto_assign"
    },
    spawn_position =
    {
      options = {"random", "fixed", "team_together"},
      selected = "team_together"
    },
    research_level =
    {
      options = {"none","science-pack-1", "science-pack-2", "science-pack-3", "military-science-pack", "production-science-pack", "high-tech-science-pack", "space-science-pack"},
      selected = "none"
    },
    unlock_combat_research = false,
    defcon_mode = false,
    defcon_timer = 5,
    starting_equipment =
    {
      options = {"none", "small", "medium", "large"},
      selected = "none"
    },
    starting_chest =
    {
      options = {"none", "small", "medium", "large"},
      selected = "none"
    },
    starting_chest_multiplier = 5
  }

  config.research_ingredient_list = {}
  for k, research in pairs (config.team_config.research_level.options) do
    config.research_ingredient_list[research] = false
  end

  config.colors =
  {
    { name = "orange" , color = { r = 0.869, g = 0.5  , b = 0.130, a = 0.5 }},
    { name = "purple" , color = { r = 0.485, g = 0.111, b = 0.659, a = 0.5 }},
    { name = "red"    , color = { r = 0.815, g = 0.024, b = 0.0  , a = 0.5 }},
    { name = "green"  , color = { r = 0.093, g = 0.768, b = 0.172, a = 0.5 }},
    { name = "blue"   , color = { r = 0.155, g = 0.540, b = 0.898, a = 0.5 }},
    { name = "yellow" , color = { r = 0.835, g = 0.666, b = 0.077, a = 0.5 }},
    { name = "pink"   , color = { r = 0.929, g = 0.386, b = 0.514, a = 0.5 }},
    { name = "white"  , color = { r = 0.8  , g = 0.8  , b = 0.8  , a = 0.5 }},
    { name = "black"  , color = { r = 0.1  , g = 0.1  , b = 0.1,   a = 0.5 }},
    { name = "gray"   , color = { r = 0.4  , g = 0.4  , b = 0.4,   a = 0.5 }},
    { name = "brown"  , color = { r = 0.300, g = 0.117, b = 0.0,   a = 0.5 }},
    { name = "cyan"   , color = { r = 0.275, g = 0.755, b = 0.712, a = 0.5 }},
    { name = "acid"   , color = { r = 0.559, g = 0.761, b = 0.157, a = 0.5 }},
  }
  

  config.color_map = {}
  for k, color in pairs (config.colors) do
    config.color_map[color.name] = k
  end

  config.teams =
  {
    {name = "Orange", color = "orange", team = "-"},
    {name = "Purple", color = "purple", team = "-"}
  }

  config.inventory_list =
  {
    none =
    {
      ["iron-plate"] = 15,
      ["copper-plate"] = 15,
      ["dyworld-stone-burner-drill"] = 1,
      ["stone-furnace"] = 1
    },
    small =
    {
      ["iron-plate"] = 200,
      ["dyworld-stone-pipe"] = 100,
      ["dyworld-stone-pipe-to-ground"] = 20,
      ["copper-plate"] = 200,
      ["iron-gear-wheel"] = 200,
      ["electronic-circuit"] = 200,
      ["dyworld-stone-transport-belt"] = 400,
      ["dyworld-iron-repair-tool"] = 20,
      ["dyworld-stone-basic-inserter"] = 100,
      ["dyworld-copper-power-pole"] = 50,
      ["dyworld-stone-burner-drill"] = 50,
      ["stone-furnace"] = 50,
      ["burner-inserter"] = 100,
      ["dyworld-stone-assembling-electric"] = 20,
      ["dyworld-stone-electric-drill"] = 20,
      ["boiler"] = 5,
      ["dyworld-iron-steam-engine"] = 10,
      ["dyworld-iron-offshore-pump"] = 2,
      ["raw-wood"] = 50
    },
    medium =
    {
      ["iron-plate"] = 200,
      ["dyworld-iron-pipe"] = 100,
      ["dyworld-iron-pipe-to-ground"] = 20,
      ["iron-gear-wheel"] = 100,
      ["copper-plate"] = 100,
      ["steel-plate"] = 100,
      ["electronic-circuit"] = 400,
      ["dyworld-iron-transport-belt"] = 400,
      ["dyworld-iron-underground-belt"] = 20,
      ["dyworld-iron-splitter"] = 20,
      ["dyworld-iron-repair-tool"] = 20,
      ["dyworld-iron-basic-inserter"] = 150,
      ["dyworld-iron-long-inserter"] = 150,
      ["dyworld-copper-power-pole"] = 150,
      ["burner-inserter"] = 100,
      ["dyworld-stone-burner-drill"] = 50,
      ["dyworld-stone-electric-drill"] = 40,
      ["stone-furnace"] = 100,
      ["steel-furnace"] = 30,
      ["dyworld-stone-assembling-electric"] = 60,
      ["boiler"] = 10,
      ["dyworld-iron-steam-engine"] = 20,
      ["chemical-plant"] = 20,
      ["oil-refinery"] = 5,
      ["pumpjack"] = 8,
      ["dyworld-iron-offshore-pump"] = 2,
      ["raw-wood"] = 50
    },
    large =
    {
      ["iron-plate"] = 200,
      ["dyworld-steel-pipe"] = 100,
      ["dyworld-steel-pipe-to-ground"] = 20,
      ["copper-plate"] = 200,
      ["steel-plate"] = 200,
      ["electronic-circuit"] = 400,
      ["iron-gear-wheel"] = 250,
      ["dyworld-steel-transport-belt"] = 400,
      ["dyworld-steel-underground-belt"] = 40,
      ["dyworld-steel-splitter"] = 40,
      ["dyworld-iron-repair-tool"] = 20,
      ["dyworld-steel-basic-inserter"] = 200,
      ["burner-inserter"] = 50,
      ["dyworld-copper-power-pole"] = 200,
      ["dyworld-stone-burner-drill"] = 50,
      ["dyworld-stone-electric-drill"] = 50,
      ["stone-furnace"] = 100,
      ["steel-furnace"] = 50,
      ["electric-furnace"] = 20,
      ["dyworld-stone-assembling-electric"] = 100,
      ["dyworld-iron-long-inserter"] = 100,
      ["dyworld-copper-power-relay"] = 50,
      ["boiler"] = 10,
      ["dyworld-iron-steam-engine"] = 20,
      ["chemical-plant"] = 20,
      ["oil-refinery"] = 5,
      ["pumpjack"] = 10,
      ["dyworld-iron-offshore-pump"] = 2,
      ["raw-wood"] = 50
    }
  }
  if dummy_load then
    return config
  end
end

function give_equipment(player)

  local setting = global.team_config.starting_equipment.selected

  if setting == "none" then
    player.insert{name = "pistol", count = 1}
    player.insert{name = "dyworld-iron-basic-ammo", count = 50}
    player.insert{name = "landfill", count = 50}
    return
  end

  if setting == "small" then
    player.insert{name = "submachine-gun", count = 1}
    player.insert{name = "dyworld-iron-basic-ammo", count = 50}
    player.insert{name = "shotgun", count = 1}
    player.insert{name = "dyworld-iron-shotgun-ammo", count = 50}
    player.insert{name = "dyworld-iron-mining-tool", count = 2}
    player.insert{name = "heavy-armor", count = 1}
    player.insert{name = "landfill", count = 100}
    return
  end

  if setting == "medium" then
    player.insert{name = "dyworld-steel-mining-tool", count = 10}
    player.insert{name = "submachine-gun", count = 1}
    player.insert{name = "dyworld-iron-basic-ammo", count = 50}
    player.insert{name = "shotgun", count = 1}
    player.insert{name = "dyworld-iron-shotgun-ammo", count = 50}
    player.insert{name = "car", count = 1}
    player.insert{name = "modular-armor", count = 1}
    player.insert{name = "landfill", count = 150}
    return
  end

  if setting == "large" then
    player.insert{name = "dyworld-steel-mining-tool", count = 25}
    player.insert{name = "submachine-gun", count = 1}
    player.insert{name = "dyworld-steel-basic-piercing-ammo", count = 50}
    player.insert{name = "combat-shotgun", count = 1}
    player.insert{name = "dyworld-iron-shotgun-piercing-ammo", count = 50}
    player.insert{name = "rocket-launcher", count = 1}
    player.insert{name = "rocket", count = 80}
    player.insert{name = "power-armor", count = 1}
    local armor = player.get_inventory(defines.inventory.player_armor)[1].grid
    armor.put({name = "fusion-reactor-equipment"})
    armor.put({name = "exoskeleton-equipment"})
    armor.put({name = "energy-shield-equipment"})
    armor.put({name = "energy-shield-equipment"})
    armor.put({name = "personal-roboport-mk2-equipment"})
    player.insert{name = "construction-robot", count = 25}
    player.insert{name = "blueprint", count = 3}
    player.insert{name = "deconstruction-planner", count = 1}
    player.insert{name = "car", count = 1}
    player.insert{name = "landfill", count = 200}
    return
  end

end
function get_starting_area_radius(as_tiles)
  if not global.map_config.starting_area_size then return 0 end
  local starting_area_chunk_radius =
  {
    ["none"] = 3,
    ["very-low"] = 3,
    ["low"] = 4,
    ["normal"] = 5,
    ["high"] = 6,
    ["very-high"] = 7
  }
  return as_tiles and starting_area_chunk_radius[global.map_config.starting_area_size.selected] * 32 or starting_area_chunk_radius[global.map_config.starting_area_size.selected]
end

function parse_config_from_gui(gui, config)
  local config_table = gui.config_table
  if not config_table then
    error("Trying to parse config from gui with no config table present")
  end
  for name, value in pairs (config) do
    if config_table[name.."_box"] then
      local text = config_table[name.."_box"].text
      local n = tonumber(text)
      if text == "" then n = 0 end
      if n ~= nil then
        if n > 4294967295 then
          game.players[config_table.player_index].print({"value-too-big", {name}})
          return
        end
        if n < 0 then
          game.players[config_table.player_index].print({"value-below-zero", {name}})
          return
        end
        config[name] = n
      else
        game.players[config_table.player_index].print({"must-be-number", {name}})
        return
      end
    end
    if type(value) == "boolean" then
      if config_table[name] then
        config[name] = config_table[name.."_boolean"].state
      end
    end
    if type(value) == "table" then
      local menu = config_table[name.."_dropdown"]
      if not menu then game.print("Error trying to read drop down menu of gui element "..name)return end
      config[name].selected = config[name].options[menu.selected_index]
    end
  end
  return true
end

function make_config_table(gui, config)
  local config_table = gui.config_table
  if config_table then
    config_table.clear()
  else
    config_table = gui.add{type = "table", name = "config_table", column_count = 2}
    config_table.style.column_alignments[2] = "right"
  end
  local items = game.item_prototypes
  for k, name in pairs (config) do
    local label
    if tonumber(name) then
      label = config_table.add{type = "label", name = k, tooltip = {k.."_tooltip"}}
      local input = config_table.add{type = "textfield", name = k.."_box"}
      input.text = name
      input.style.maximal_width = 100
    elseif tostring(type(name)) == "boolean" then
      label = config_table.add{type = "label", name = k, tooltip = {k.."_tooltip"}}
      config_table.add{type = "checkbox", name = k.."_"..tostring(type(name)), state = name}
    else
      label = config_table.add{type = "label", name = k, tooltip = {k.."_tooltip"}}
      local menu = config_table.add{type = "drop-down", name = k.."_dropdown"}
      local index
      for j, option in pairs (name.options) do
        if items[option] then
          menu.add_item(items[option].localised_name)
        else
          menu.add_item({option})
        end
        if option == name.selected then index = j end
      end
      menu.selected_index = index or 1
      if name.tooltip then
        label.tooltip = name.tooltip
      end
    end
    label.caption = {"", {k}, {"colon"}}
  end
end
