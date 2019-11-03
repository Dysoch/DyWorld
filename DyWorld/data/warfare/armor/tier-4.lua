require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if settings.startup["DyWorld_Warfare"].value then

data:extend(
{
  {
    type = "equipment-grid",
    name = "equipment-grid-armor-tier-4",
    width = 10,
    height = 15,
    equipment_categories = {"armor"}
  },
  {
    type = "armor",
    name = "modular-armor-tier-4",
    icon = "__base__/graphics/icons/modular-armor.png",
    icon_size = 32,
    resistances =
    {
    },
    subgroup = dy.."armor",
    order = "modular-armor-tier-4",
    stack_size = 1,
    infinite = true,
    equipment_grid = "equipment-grid-armor-tier-4",
    inventory_size_bonus = 0
  },
  {
    type = "recipe",
    name = "modular-armor-tier-4",
    energy_required = 120,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "modular-armor-tier-3", amount = 1},
      {type = "item", name = "electranium-plate", amount = 100},
      {type = "item", name = "titanium-cable", amount = 5},
      {type = "item", name = "processing-control-board", amount = 10},
      {type = "item", name = "controller", amount = 1},
    },
    result = "modular-armor-tier-4"
  },
})

DyWorld_Add_To_Tech("military-7", "modular-armor-tier-4")

end