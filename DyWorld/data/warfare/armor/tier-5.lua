require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if settings.startup["DyWorld_Warfare"].value then

data:extend(
{
  {
    type = "equipment-grid",
    name = "equipment-grid-armor-tier-5",
    width = 18,
    height = 25,
    equipment_categories = {"armor"}
  },
  {
    type = "armor",
    name = "modular-armor-tier-5",
    icon = "__base__/graphics/icons/modular-armor.png",
    icon_size = 32,
    resistances =
    {
    },
    subgroup = dy.."armor",
    order = "modular-armor-tier-5",
    stack_size = 1,
    infinite = true,
    equipment_grid = "equipment-grid-armor-tier-5",
    inventory_size_bonus = 0
  },
  {
    type = "recipe",
    name = "modular-armor-tier-5",
    energy_required = 240,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "modular-armor-tier-4", amount = 1},
      {type = "item", name = "neutronium-plate", amount = 150},
      {type = "item", name = "super-control-board", amount = 5},
    },
    result = "modular-armor-tier-5"
  },
})

DyWorld_Add_To_Tech("military-9", "modular-armor-tier-5")

end