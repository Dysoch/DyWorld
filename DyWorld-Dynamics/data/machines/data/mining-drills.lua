data:extend({
    {
      type = "mining-drill",
      name = "basic-burner-drill",
      icon = "__base__/graphics/icons/burner-mining-drill.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral", "player-creation"},
      resource_categories = {"resource-solid-tier-0", "resource-solid-tier-1"},
      minable = {mining_time = 0.3, result = "basic-burner-drill"},
      max_health = 50,
      resistances = Resist_Tier_1(0.75),
      hide_resistances = settings.startup["DyWorld_Show_Resistances"].value,
      corpse = "burner-mining-drill-remnants",
      dying_explosion = "burner-mining-drill-explosion",
      collision_box = {{ -0.7, -0.7}, {0.7, 0.7}},
      selection_box = {{ -1, -1}, {1, 1}},
      --damaged_trigger_effect = hit_effects.entity(),
      mining_speed = 0.5,
      working_sound =
      {
        sound =
        {
          {
            filename = "__base__/sound/burner-mining-drill.ogg",
            volume = 0.6
          },
          {
            filename = "__base__/sound/burner-mining-drill-1.ogg",
            volume = 0.6
          }
        },
        --max_sounds_per_type = 3,
        fade_in_ticks = 4,
        fade_out_ticks = 20
      },
      --open_sound = sounds.machine_open,
      --close_sound = sounds.machine_close,
      --vehicle_impact_sound = sounds.generic_impact,
      allowed_effects = {}, -- no beacon effects on the burner drill
      energy_source =
      {
        type = "burner",
        fuel_category = "carbon",
        effectivity = 1,
        fuel_inventory_size = 2,
        emissions_per_minute = Dy_Sett.Difficulty == "Easy" and 5 or Dy_Sett.Difficulty == "Normal" and 15 or Dy_Sett.Difficulty == "Hard" and 45 or 5,
        smoke =
        {
          {
            name = "smoke",
            deviation = {0.1, 0.1},
            frequency = 3
          }
        }
      },
      energy_usage = "150kW",
      animations =
      {
        north =
        {
          layers =
          {
            {
              priority = "high",
              width = 87,
              height = 95,
              line_length = 4,
              shift = util.by_pixel(2.5, 0.5),
              filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-N.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              hr_version =
              {
                priority = "high",
                width = 173,
                height = 188,
                line_length = 4,
                shift = util.by_pixel(2.75, 0.5),
                filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-N.png",
                frame_count = 32,
                animation_speed = 0.5,
                run_mode = "forward-then-backward",
                scale = 0.5
              }
            },
            {
              priority = "high",
              width = 109,
              height = 76,
              line_length = 4,
              shift = util.by_pixel(23.5, -1),
              filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-N-shadow.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              hr_version =
              {
                priority = "high",
                width = 217,
                height = 150,
                line_length = 4,
                shift = util.by_pixel(23.75, -1),
                filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-N-shadow.png",
                frame_count = 32,
                animation_speed = 0.5,
                run_mode = "forward-then-backward",
                draw_as_shadow = true,
                scale = 0.5
              }
            }
          }
        },
        east =
        {
          layers =
          {
            {
              priority = "high",
              width = 93,
              height = 84,
              line_length = 4,
              shift = util.by_pixel(2.5, 1),
              filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-E.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              hr_version =
              {
                priority = "high",
                width = 185,
                height = 168,
                line_length = 4,
                shift = util.by_pixel(2.75, 1),
                filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-E.png",
                frame_count = 32,
                animation_speed = 0.5,
                run_mode = "forward-then-backward",
                scale = 0.5
              }
            },
            {
              priority = "high",
              width = 93,
              height = 65,
              line_length = 4,
              shift = util.by_pixel(13.5, 0.5),
              filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-E-shadow.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              hr_version =
              {
                priority = "high",
                width = 185,
                height = 128,
                line_length = 4,
                shift = util.by_pixel(13.75, 0.5),
                filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-E-shadow.png",
                frame_count = 32,
                animation_speed = 0.5,
                run_mode = "forward-then-backward",
                draw_as_shadow = true,
                scale = 0.5
              }
            }
          }
        },
        south =
        {
          layers =
          {
            {
              priority = "high",
              width = 87,
              height = 87,
              line_length = 4,
              shift = util.by_pixel(0.5, -0.5),
              filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-S.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              hr_version =
              {
                priority = "high",
                width = 174,
                height = 174,
                line_length = 4,
                shift = util.by_pixel(0.5, -0.5),
                filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-S.png",
                frame_count = 32,
                animation_speed = 0.5,
                run_mode = "forward-then-backward",
                scale = 0.5
              }
            },
            {
              priority = "high",
              width = 88,
              height = 69,
              line_length = 4,
              shift = util.by_pixel(11, 2.5),
              filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-S-shadow.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              hr_version =
              {
                priority = "high",
                width = 174,
                height = 137,
                line_length = 4,
                shift = util.by_pixel(11, 2.75),
                filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-S-shadow.png",
                frame_count = 32,
                animation_speed = 0.5,
                run_mode = "forward-then-backward",
                draw_as_shadow = true,
                scale = 0.5
              }
            }
          }
        },
        west =
        {
          layers =
          {
            {
              priority = "high",
              width = 91,
              height = 88,
              line_length = 4,
              shift = util.by_pixel(-1.5, 0),
              filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-W.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              hr_version =
              {
                priority = "high",
                width = 180,
                height = 176,
                line_length = 4,
                shift = util.by_pixel(-1.5, 0),
                filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-W.png",
                frame_count = 32,
                animation_speed = 0.5,
                run_mode = "forward-then-backward",
                scale = 0.5
              }
            },
            {
              priority = "high",
              width = 89,
              height = 66,
              line_length = 4,
              shift = util.by_pixel(7.5, 1),
              filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-W-shadow.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              hr_version =
              {
                priority = "high",
                width = 176,
                height = 130,
                line_length = 4,
                shift = util.by_pixel(7.5, 1),
                filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-W-shadow.png",
                frame_count = 32,
                animation_speed = 0.5,
                run_mode = "forward-then-backward",
                draw_as_shadow = true,
                scale = 0.5
              }
            }
          }
        }
      },
      monitor_visualization_tint = {r=78, g=173, b=255},
      resource_searching_radius = 0.99,
      vector_to_place_result = {-0.5, -1.3},
      fast_replaceable_group = "mining",
    },
    {
      type = "item",
      name = "basic-burner-drill",
      icon = "__base__/graphics/icons/burner-mining-drill.png",
      icon_size = 64, icon_mipmaps = 4,
      subgroup = DyDs.."miners",
      order = "1",
      place_result = "basic-burner-drill",
      stack_size = 200,
    },
    {
      type = "recipe",
      name = "basic-burner-drill",
      category = "assembling-tier-1",
      normal =
      {
        ingredients =
        {
          {type = "item", name = "wood", amount = 1},
          {type = "item", name = "limestone", amount = 5},
        },
        result = "basic-burner-drill",
        enabled = false,
        energy_required = 2,
      },
    },
})

local DyWorld_Prototype_1 = DyDs_CopyPrototype("mining-drill", "electric-mining-drill", "basic-electric-drill", true)
DyWorld_Prototype_1.resource_categories = {"resource-solid-tier-0", "resource-solid-tier-1", "resource-solid-tier-2"}
DyWorld_Prototype_1.resistances = Resist_Tier_1(1.2)
DyWorld_Prototype_1.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value
DyWorld_Prototype_1.fast_replaceable_group = "mining"
DyWorld_Prototype_1.next_upgrade = "advanced-electric-drill"
DyWorld_Prototype_1.mining_speed = 0.5
DyWorld_Prototype_1.energy_source = {
  type = "electric",
  emissions_per_minute = Dy_Sett.Difficulty == "Easy" and 10 or Dy_Sett.Difficulty == "Normal" and 30 or Dy_Sett.Difficulty == "Hard" and 90 or 5,
  usage_priority = "secondary-input"
}
DyWorld_Prototype_1.energy_usage = "400kW"
DyWorld_Prototype_1.resource_searching_radius = 2.49

data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "basic-electric-drill",
    icon = "__base__/graphics/icons/electric-mining-drill.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."miners",
    order = "2",
    place_result = "basic-electric-drill",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "basic-electric-drill",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 2},
        {type = "item", name = "iron-plate", amount = 12},
        {type = "item", name = "bronze-plate", amount = 4},
      },
      result = "basic-electric-drill",
	  enabled = false,
	  energy_required = 5,
    },
  },
})

local DyWorld_Prototype_2 = DyDs_CopyPrototype("mining-drill", "electric-mining-drill", "advanced-electric-drill", true)
DyWorld_Prototype_2.resource_categories = {"resource-solid-tier-0", "resource-solid-tier-1", "resource-solid-tier-2"}
DyWorld_Prototype_2.resistances = Resist_Tier_1(1.2)
DyWorld_Prototype_2.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value
DyWorld_Prototype_2.fast_replaceable_group = "mining"
DyWorld_Prototype_2.next_upgrade = "quantum-electric-drill"
DyWorld_Prototype_2.mining_speed = 1.25
DyWorld_Prototype_2.energy_source = {
  type = "electric",
  emissions_per_minute = Dy_Sett.Difficulty == "Easy" and 20 or Dy_Sett.Difficulty == "Normal" and 60 or Dy_Sett.Difficulty == "Hard" and 180 or 5,
  usage_priority = "secondary-input"
}
DyWorld_Prototype_2.energy_usage = "1200kW"
DyWorld_Prototype_2.resource_searching_radius = 4.49

data:extend({
  DyWorld_Prototype_2,
  {
    type = "item",
    name = "advanced-electric-drill",
    icon = "__base__/graphics/icons/electric-mining-drill.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."miners",
    order = "3",
    place_result = "advanced-electric-drill",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "advanced-electric-drill",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-2", amount = 2},
        {type = "item", name = "steel-plate", amount = 15},
        {type = "item", name = "basic-electric-drill", amount = 1},
      },
      result = "advanced-electric-drill",
	  enabled = false,
	  energy_required = 5,
    },
  },
})

local DyWorld_Prototype_3 = DyDs_CopyPrototype("mining-drill", "electric-mining-drill", "quantum-electric-drill", true)
DyWorld_Prototype_3.resource_categories = {"resource-solid-tier-0", "resource-solid-tier-1", "resource-solid-tier-2"}
DyWorld_Prototype_3.resistances = Resist_Tier_1(1.2)
DyWorld_Prototype_3.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value
DyWorld_Prototype_3.fast_replaceable_group = "mining"
DyWorld_Prototype_3.next_upgrade = nil
DyWorld_Prototype_3.mining_speed = 5
DyWorld_Prototype_3.energy_source = {
  type = "electric",
  emissions_per_minute = Dy_Sett.Difficulty == "Easy" and 40 or Dy_Sett.Difficulty == "Normal" and 120 or Dy_Sett.Difficulty == "Hard" and 360 or 5,
  usage_priority = "secondary-input"
}
DyWorld_Prototype_3.energy_usage = "5000kW"
DyWorld_Prototype_3.resource_searching_radius = 9.49

data:extend({
    DyWorld_Prototype_3,
  {
    type = "item",
    name = "quantum-electric-drill",
    icon = "__base__/graphics/icons/electric-mining-drill.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."miners",
    order = "4",
    place_result = "quantum-electric-drill",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "quantum-electric-drill",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-4", amount = 2},
        {type = "item", name = "steel-plate", amount = 15},
        {type = "item", name = "advanced-electric-drill", amount = 1},
      },
      result = "quantum-electric-drill",
	  enabled = false,
	  energy_required = 5,
    },
  },
})

