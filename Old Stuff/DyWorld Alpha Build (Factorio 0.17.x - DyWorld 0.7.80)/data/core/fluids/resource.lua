require "data/prefix"

data:extend(
{
  {
    type = "resource",
    name = dy.."methane",
    icon = dyworld_path_fluid.."methane.png",
    icon_size = 32,
    flags = {"placeable-neutral"},
    category = "basic-fluid",
    order="a-b-m",
    infinite = true,
    highlight = true,
    minimum = 6000,
    normal = 30000,
    infinite_depletion_amount = 10,
    resource_patch_search_radius = 12,
    tree_removal_probability = 0.7,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      hardness = 1,
      mining_time = 1,
      results =
      {
        {
          type = "fluid",
          name = dy.."methane",
          amount_min = 5,
          amount_max = 20,
          probability = 1
        }
      }
    },
    collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace =
    {
      order = "b",
      control = "crude-oil",
      sharpness = 0.99,
      max_probability = 0.01,
      richness_base = 240000,
      richness_multiplier = 300000,
      richness_multiplier_distance_bonus = 1500,
      coverage = 0.0001 / 0.3,
      peaks =
      {
        {
          noise_layer = "crude-oil",
          noise_octaves_difference = -0.5,
          noise_persistence = 0.4
        }
      }
    },
    stage_counts = {0},
    stages =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/crude-oil/crude-oil.png",
        priority = "extra-high",
        width = 75,
        height = 61,
        frame_count = 4,
        variation_count = 1,
		tint = Color_Tier[7]
      }
    },
    map_color = {r=0.58, g=0.2, b=0.97},
    map_grid = false
  },
})
