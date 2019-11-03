require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if settings.startup["DyWorld_Warfare"].value then

data:extend(
{
  {
    type = "technology",
    name = "sniper-1",
    icon_size = 128,
    icon = "__base__/graphics/technology/military.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "sniper"
      },
      {
        type = "unlock-recipe",
        recipe = "sniper-basic-ammo"
      },
    },
    prerequisites = {"military-2"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
      },
      time = 15 
    },
    order = "c-c-a",
	upgrade = true,
  },
  {
    type = "technology",
    name = "sniper-2",
    icon_size = 128,
    icon = "__base__/graphics/technology/military.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "sniper-advanced-ammo"
      },
      {
        type = "unlock-recipe",
        recipe = "sniper-turret"
      },
    },
    prerequisites = {"military-4", "sniper-1"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
      },
      time = 15 
    },
    order = "c-c-a",
	upgrade = true,
  },
}
)

end