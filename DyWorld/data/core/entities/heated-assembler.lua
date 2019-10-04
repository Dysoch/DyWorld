require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

data:extend(
{
  {
    type = "assembling-machine",
    name = "heated-assembler",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "heated-assembler"},
    max_health = 300,
    dying_explosion = "medium-explosion",
    corpse = "medium-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "assembling-machine",
    next_upgrade = "assembling-machine-2",
    alert_icon_shift = util.by_pixel(-3, -12),
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
          priority="high",
          width = 108,
          height = 114,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, 2),
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1.png",
            priority="high",
            width = 214,
            height = 226,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 2),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1-shadow.png",
          priority="high",
          width = 95,
          height = 83,
          frame_count = 1,
          line_length = 1,
          repeat_count = 32,
          draw_as_shadow = true,
          shift = util.by_pixel(8.5, 5.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1-shadow.png",
            priority="high",
            width = 190,
            height = 165,
            frame_count = 1,
            line_length = 1,
            repeat_count = 32,
            draw_as_shadow = true,
            shift = util.by_pixel(8.5, 5),
            scale = 0.5
          }
        }
      }
    },
    crafting_categories = {"crafting", "basic-crafting", "advanced-crafting"},
    crafting_speed = 0.5,
    energy_source =
    {
      type = "heat",
	  default_temperature = 15,
      max_temperature = 5000,
      min_working_temperature = 100,
      minimum_glow_temperature = 80,
      specific_heat = "1MJ",
      max_transfer = "2GW",
      emissions_per_minute = 1,
      connections =
      {
        {
          position = {1, 1},
          direction = defines.direction.south
        },
        {
          position = {1, 1},
          direction = defines.direction.east
        },
        {
          position = {-1, 1},
          direction = defines.direction.west
        },
        {
          position = {-1, 1},
          direction = defines.direction.south
        },
        {
          position = {-1, -1},
          direction = defines.direction.north
        },
        {
          position = {-1, -1},
          direction = defines.direction.west
        },
        {
          position = {1, -1},
          direction = defines.direction.north
        },
        {
          position = {1, -1},
          direction = defines.direction.east
        },
      },
    },
    energy_usage = "75kW",
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t1-2.ogg",
          volume = 0.8
        }
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5
    }
  },
  {
    type = "item",
    name = "heated-assembler",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
	flags = {},
    subgroup = dy.."lamps",
    order = "heated-assembler",
    place_result = "heated-assembler",
    stack_size = 200
  },
  {
    type = "recipe",
    name = "heated-assembler",
    energy_required = 2.5,
    enabled = false,
    ingredients = {
	  {"simple-control-board", 1}, 
      {"iron-gear-wheel", 5},
      {"iron-plate", 9},
	  {"heat-pipe", 1},
	},
    result = "heated-assembler"
  },
}
)