



data:extend(
{
  {
    type = "assembling-machine",
    name = "grinder",
    icon = "__base__/graphics/icons/electric-furnace.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "grinder"},
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
	resistances = Resist_Tier_1(1.4),
	hide_resistances = settings.startup["DyWorld_Show_Resistances"].value,
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }}
      },
    },
    module_specification =
    {
      module_slots = 3,
      module_info_icon_shift = {0, 0.8}
    },
    allowed_effects = {"consumption", "speed", "pollution"},
    crafting_categories = {"grinder"},
    result_inventory_size = 1,
    crafting_speed = 1,
    energy_usage = "150kW",
    ingredient_count = 25,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 12.5,
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/electric-furnace.ogg",
        volume = 0.7
      },
      apparent_volume = 1.5
    },
    animation =
    {
      layers = {
      {
        filename = "__base__/graphics/entity/electric-furnace/electric-furnace-base.png",
        priority = "high",
        width = 129,
        height = 100,
        frame_count = 1,
        shift = {0.421875, 0},
		--tint = Color_Tier[9],
        hr_version = {
          filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace.png",
          priority = "high",
          width = 239,
          height = 219,
          frame_count = 1,
		  --tint = Color_Tier[9],
          shift = util.by_pixel(0.75, 5.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/electric-furnace/electric-furnace-shadow.png",
        priority = "high",
        width = 129,
        height = 100,
        frame_count = 1,
        shift = {0.421875, 0},
        draw_as_shadow = true,
        hr_version = {
          filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-shadow.png",
          priority = "high",
          width = 227,
          height = 171,
          frame_count = 1,
          draw_as_shadow = true,
          shift = util.by_pixel(11.25, 7.75),
          scale = 0.5
        }
      }
      }
    },
    working_visualisations =
    {
      {
        animation =
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-heater.png",
          priority = "high",
          width = 25,
          height = 15,
          frame_count = 12,
          animation_speed = 0.5,
          shift = {0.015625, 0.890625},
          hr_version = {
            filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-heater.png",
            priority = "high",
            width = 60,
            height = 56,
            frame_count = 12,
            animation_speed = 0.5,
            shift = util.by_pixel(1.75, 32.75),
            scale = 0.5
          }
        },
        light = {intensity = 0.4, size = 6, shift = {0.0, 1.0}, color = {r = 1.0, g = 1.0, b = 1.0}}
      },
      {
        animation =
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-1.png",
          priority = "high",
          width = 19,
          height = 13,
          frame_count = 4,
          animation_speed = 0.5,
		  --tint = Color_Tier[9],
          shift = {-0.671875, -0.640625},
          hr_version = {
            filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-propeller-1.png",
            priority = "high",
            width = 37,
            height = 25,
            frame_count = 4,
            animation_speed = 0.5,
		    --tint = Color_Tier[9],
            shift = util.by_pixel(-20.5, -18.5),
            scale = 0.5
          }
        }
      },
      {
        animation =
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-2.png",
          priority = "high",
          width = 12,
          height = 9,
          frame_count = 4,
          animation_speed = 0.5,
          shift = {0.0625, -1.234375},
          hr_version = {
            filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-propeller-2.png",
            priority = "high",
            width = 23,
            height = 15,
            frame_count = 4,
            animation_speed = 0.5,
            shift = util.by_pixel(3.5, -38),
            scale = 0.5
          }
        }
      }
    },
    fast_replaceable_group = "furnace"
  },
  {
    type = "item",
    name = "grinder",
    icon = "__base__/graphics/icons/electric-furnace.png",
	flags = {},
    icon_size = 64,
    subgroup = DyDs.."assemblers",
    order = "grinder",
    place_result = "grinder",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "grinder",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 1},
        {type = "item", name = "bronze-plate", amount = 4},
        {type = "item", name = "iron-plate", amount = 1},
        {type = "item", name = "iron-gear", amount = 4},
      },
      result = "grinder",
	  enabled = false,
	  energy_required = 2,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 1*5},
        {type = "item", name = "bronze-plate", amount = 4*5},
        {type = "item", name = "iron-plate", amount = 1*5},
        {type = "item", name = "iron-gear", amount = 4*5},
      },
      result = "grinder",
	  enabled = false,
	  energy_required = 10,
    },
  },
})
