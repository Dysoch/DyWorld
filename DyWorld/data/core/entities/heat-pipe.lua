require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

data:extend(
{
  {
    type = "heat-pipe",
    name = "heat-pipe-invisible",
    icon = "__base__/graphics/icons/heat-pipe.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "not-selectable-in-game", "not-deconstructable", "not-blueprintable", "no-copy-paste", "fast-replaceable-no-cross-type-while-moving"},
    --minable = {mining_time = 0.1, result = "heat-pipe"},
    max_health = 200,
    corpse = "heat-pipe-remnants",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "explosion",
        percent = 30
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.05, -0.05}, {0.05, 0.05}},
    fast_replaceable_group = "transport-belt",
    heat_buffer =
    {
      max_temperature = 5500,
      specific_heat = "1MJ",
      max_transfer = "1GW",
      minimum_glow_temperature = 350,
      connections =
      {
        {
          position = {0, 0},
          direction = defines.direction.north
        },
        {
          position = {0, 0},
          direction = defines.direction.east
        },
        {
          position = {0, 0},
          direction = defines.direction.south
        },
        {
          position = {0, 0},
          direction = defines.direction.west
        }
      },
      heat_glow =
      {
        filename = "__base__/graphics/entity/heat-pipe/heated-glow.png",
        priority = "extra-high",
        width = 55,
        height = 55,
        tint = heat_glow_tint
      }
    },

    connection_sprites = make_heat_pipe_pictures("__base__/graphics/entity/heat-pipe/", "heat-pipe",
      {
        single = {empty = true},
        straight_vertical = {empty = true},
        straight_horizontal = {empty = true},
        corner_right_up = {empty = true},
        corner_left_up = {empty = true},
        corner_right_down = {empty = true},
        corner_left_down = {empty = true},
        t_up = {empty = true},
        t_down = {empty = true},
        t_right = {empty = true},
        t_left = {empty = true},
        cross = {empty = true},
        ending_up = {empty = true},
        ending_down = {empty = true},
        ending_right = {empty = true},
        ending_left = {empty = true},
      }),

    heat_glow_sprites = make_heat_pipe_pictures("__base__/graphics/entity/heat-pipe/", "heated",
      {
        single = {empty = true},
        straight_vertical = {empty = true},
        straight_horizontal = {empty = true},
        corner_right_up = {empty = true},
        corner_left_up = {empty = true},
        corner_right_down = {empty = true},
        corner_left_down = {empty = true},
        t_up = {empty = true},
        t_down = {empty = true},
        t_right = {empty = true},
        t_left = {empty = true},
        cross = {empty = true},
        ending_up = {empty = true},
        ending_down = {empty = true},
        ending_right = {empty = true},
        ending_left = {empty = true},
      })
  },
  {
    type = "item",
    name = "heat-pipe-invisible",
    icon = "__base__/graphics/icons/heat-pipe.png",
	flags = {"hidden"},
    subgroup = dy.."inserter-2-heat",
    order = "heated-long-inserter",
    place_result = "heat-pipe-invisible",
    stack_size = 200
  },
}
)