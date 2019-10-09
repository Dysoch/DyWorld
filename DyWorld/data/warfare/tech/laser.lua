require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

data:extend(
{
  {
    type = "technology",
    name = "laser-weapons-1",
    icon_size = 128,
    icon = "__base__/graphics/technology/military.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "laser-gun"
      },
      {
        type = "unlock-recipe",
        recipe = "laser-basic-ammo"
      },
    },
    prerequisites = {"military-3", "laser"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      time = 15 
    },
    order = "c-c-a",
	upgrade = true,
  },
  {
    type = "technology",
    name = "laser-weapons-2",
    icon_size = 128,
    icon = "__base__/graphics/technology/military.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "laser-advanced-ammo"
      },
      {
        type = "unlock-recipe",
        recipe = "laser-basic-shotgun-ammo"
      },
    },
    prerequisites = {"military-5", "laser-weapons-1"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      time = 15 
    },
    order = "c-c-a",
	upgrade = true,
  },
  {
    type = "technology",
    name = "laser-weapons-3",
    icon_size = 128,
    icon = "__base__/graphics/technology/military.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "laser-advanced-shotgun-ammo"
      },
    },
    prerequisites = {"military-7", "laser-weapons-2"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
      },
      time = 15 
    },
    order = "c-c-a",
	upgrade = true,
  },
}
)