local autoplace_utils = require("autoplace_utils")
require "data/prefix"

local function autoplace_settings(noise_layer, rectangles)
  local ret = {}

  if noise_layer then
    ret = {
      {
        influence = 0.1,
        noise_layer = noise_layer,
        noise_persistence = 0.7,
        octaves_difference = -1
      }
    }
  end

  autoplace_utils.peaks(rectangles, ret)

  return { peaks = ret }
end

local grass_vehicle_speed_modifier = 1.6
local dirt_vehicle_speed_modifer = 1.4
local sand_vehicle_speed_modifier = 1.8
local stone_path_vehicle_speed_modifier = 1.1
local concrete_vehicle_speed_modifier = 0.8

function water_autoplace_settings(from_depth, rectangles)
  local ret =
  {
    {
      -- Water and deep water have absolute priority. We simulate this by giving
      -- them absurdly large influence
      influence = 1e3 + from_depth,
      elevation_optimal = -2500 - from_depth,
      elevation_range = 2500,
      elevation_max_range = 2500, -- everywhere below elevation 0 and nowhere else
    }
  }

  if rectangles == nil then
    ret[2] = { influence = 1 }
  end

  autoplace_utils.peaks(rectangles, ret)

  return { peaks = ret }
end

data:extend(
{
  --[[{
    type = "tile",
    name = "deeplava",
    collision_mask =
    {
      "water-tile",
      "resource-layer",
      "item-layer",
      "player-layer",
      "doodad-layer"
    },
    autoplace = autoplace_settings("deeplava", {{{35, 1}, {-25, 0}, 0.55}}),
    layer = 99,
    variants =
    {
      main =
      {
        {
          picture = dyworld_path_tile.."deeplava1.png",
          count = 8,
          size = 1
        },
        {
          picture = dyworld_path_tile.."deeplava2.png",
          count = 8,
          size = 2
        },
        {
          picture = dyworld_path_tile.."deeplava4.png",
          count = 6,
          size = 4
        }
      },
      inner_corner =
      {
        picture = dyworld_path_tile.."deeplava-inner-corner.png",
        count = 6
      },
      outer_corner =
      {
        picture = dyworld_path_tile.."deeplava-outer-corner.png",
        count = 6
      },
      side =
      {
        picture = dyworld_path_tile.."deeplava-side.png",
        count = 8
      }
    },
    allowed_neighbors = { "lava" },
    map_color={r=0.941, g=0.02823, b=0.0345},
    ageing=0.0006
  },]]--
  {
    type = "tile",
    name = "rocks",
    collision_mask =
    {
      --"water-tile",
      "item-layer",
      "resource-layer",
      "player-layer",
      "doodad-layer"
    },
    autoplace = water_autoplace_settings(0, {{{35, 1}, {-25, 0}}}),
    layer = 99,
    variants =
    {
      main =
      {
        {
          picture = dyworld_path_tile.."rock1.png",
          count = 8,
          size = 1
        },
        {
          picture = dyworld_path_tile.."rock2.png",
          count = 8,
          size = 2
        },
        {
          picture = dyworld_path_tile.."rock4.png",
          count = 6,
          size = 4
        }
      },
      inner_corner =
      {
        picture = dyworld_path_tile.."rock-inner-corner.png",
        count = 6
      },
      outer_corner =
      {
        picture = dyworld_path_tile.."rock-outer-corner.png",
        count = 6
      },
      side =
      {
        picture = dyworld_path_tile.."rock-side.png",
        count = 8
      }
    },
    allowed_neighbors = { "grass" },
    map_color={r=255, g=255, b=255},
    ageing=0.0006
  },
})
