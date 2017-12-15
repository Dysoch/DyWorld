require "data/prefix"
data:extend(
{
  {
    type = "technology",
    name = "toolbelt-2",
    icon = "__base__/graphics/technology/toolbelt.png",
    icon_size = 128,
    effects =
    {
      {
        type = "quick-bar-count",
        modifier = 1
      }
    },
    prerequisites = {"toolbelt"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
      },
      time = 30
    },
    order = "c-k-m",
	upgrade = true,
  },
  {
    type = "technology",
    name = "toolbelt-3",
    icon = "__base__/graphics/technology/toolbelt.png",
    icon_size = 128,
    effects =
    {
      {
        type = "quick-bar-count",
        modifier = 1
      }
    },
    prerequisites = {"toolbelt-2"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
      },
      time = 30
    },
    order = "c-k-m",
	upgrade = true,
  },
})