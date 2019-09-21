require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

data:extend(
{
  {
    type = "reactor",
    name = "heat-pipe-furnace",
    icon  = "__base__/graphics/icons/stone-furnace.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "heat-pipe-furnace"},
    max_health = 500,
    corpse = "nuclear-reactor-remnants",
    consumption = "1MW",
    neighbour_bonus = 10,
    energy_source =
    {
      type = "burner",
      fuel_category = "chemical",
      effectivity = 5,
      fuel_inventory_size = 1,
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    heat_buffer =
    {
      max_temperature = 1000,
      specific_heat = "10MJ",
      max_transfer = "10GW",
      minimum_glow_temperature = 350,
      glow_alpha_modifier = 0.6,
      connections =
      {
        {
          position = {0, -1.5},
          direction = defines.direction.north
        },
        {
          position = {0, 1.4},
          direction = defines.direction.south
        },
        {
          position = {1.4, 0},
          direction = defines.direction.east
        },
        {
          position = {-1.5, 0},
          direction = defines.direction.west
        },
      },
    },
    working_light_picture =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-lights-color.png",
      width = 160,
      height = 160,
      scale = 0.00005,
      shift = { -0.03125, -0.1875 },
      blend_mode = "additive",
      hr_version =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-lights-color.png",
        width = 320,
        height = 320,
        scale = 0.00005,
        shift = { -0.03125, -0.1875 },
        blend_mode = "additive"
      }
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/electric-furnace.ogg",
        volume = 0.7
      },
      apparent_volume = 1.5
    },
    picture =
    {
      layers = {
      {
        filename = "__base__/graphics/entity/electric-furnace/electric-furnace-base.png",
        priority = "high",
        width = 129,
        height = 100,
        shift = {0.421875, 0},
        hr_version = {
          filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace.png",
          priority = "high",
          width = 239,
          height = 219,
          shift = util.by_pixel(0.75, 5.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/electric-furnace/electric-furnace-shadow.png",
        priority = "high",
        width = 129,
        height = 100,
        shift = {0.421875, 0},
        draw_as_shadow = true,
        hr_version = {
          filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-shadow.png",
          priority = "high",
          width = 227,
          height = 171,
          draw_as_shadow = true,
          shift = util.by_pixel(11.25, 7.75),
          scale = 0.5
        }
      }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
  },
  {
    type = "item",
    name = "heat-pipe-furnace",
    icon  = "__base__/graphics/icons/stone-furnace.png",
	flags = {},
    subgroup = dy.."special-machines",
    order = "heat-pipe-furnace",
    place_result = "heat-pipe-furnace",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "heat-pipe-furnace",
    energy_required = 2.5,
    enabled = false,
    ingredients = {
	  {"stone-furnace", 1}, 
	  {"iron-plate", 12},
	},
    result = "heat-pipe-furnace"
  },
}
)