require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if settings.startup["DyWorld_Warfare"].value then

data:extend(
{
  {
    type = "equipment-grid",
    name = "equipment-grid-armor-tier-2",
    width = 4,
    height = 8,
    equipment_categories = {"armor"}
  },
  {
    type = "armor",
    name = "modular-armor-tier-2",
    icon = "__base__/graphics/icons/modular-armor.png",
    icon_size = 64,
    resistances =
    {
    },
    subgroup = dy.."armor",
    order = "modular-armor-tier-2",
    stack_size = 1,
    infinite = true,
    equipment_grid = "equipment-grid-armor-tier-2",
    inventory_size_bonus = 0
  },
  {
    type = "recipe",
    name = "modular-armor-tier-2",
    energy_required = 30,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "modular-armor-tier-1", amount = 1},
      {type = "item", name = "bronze-plate", amount = 60},
      {type = "item", name = "electronic-control-board", amount = 5},
      {type = "item", name = "electronic-motor", amount = 1},
      {type = "item", name = "rubber", amount = 10},
    },
    result = "modular-armor-tier-2"
  },
})

DyWorld_Add_To_Tech("military-3", "modular-armor-tier-2")

end