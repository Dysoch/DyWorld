require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if settings.startup["DyWorld_Warfare"].value then

data:extend(
{
  {
    type = "equipment-grid",
    name = "equipment-grid-armor-tier-3",
    width = 10,
    height = 8,
    equipment_categories = {"armor"}
  },
  {
    type = "armor",
    name = "modular-armor-tier-3",
    icon = "__base__/graphics/icons/modular-armor.png",
    icon_size = 32,
    resistances =
    {
    },
    subgroup = dy.."armor",
    order = "modular-armor-tier-3",
    stack_size = 1,
    infinite = true,
    equipment_grid = "equipment-grid-armor-tier-3",
    inventory_size_bonus = 0
  },
  {
    type = "recipe",
    name = "modular-armor-tier-3",
    energy_required = 60,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "modular-armor-tier-2", amount = 1},
      {type = "item", name = "stainless-steel-plate", amount = 80},
      {type = "item", name = "diamond", amount = 1},
    },
    result = "modular-armor-tier-3"
  },
})

DyWorld_Add_To_Tech("military-5", "modular-armor-tier-3")

end