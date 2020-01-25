require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if settings.startup["DyWorld_Warfare"].value then

data:extend(
{
  {
    type = "equipment-grid",
    name = "equipment-grid-armor-tier-1",
    width = 3,
    height = 3,
    equipment_categories = {"armor"}
  },
  {
    type = "armor",
    name = "modular-armor-tier-1",
    icon = "__base__/graphics/icons/modular-armor.png",
    icon_size = 64,
    resistances =
    {
    },
    subgroup = dy.."armor",
    order = "modular-armor-tier-1",
    stack_size = 1,
    infinite = true,
    equipment_grid = "equipment-grid-armor-tier-1",
    inventory_size_bonus = 0
  },
  {
    type = "recipe",
    name = "modular-armor-tier-1",
    energy_required = 15,
    enabled = true,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 15},
      {type = "item", name = "copper-cable", amount = 5},
    },
    result = "modular-armor-tier-1"
  },
})
data.raw.recipe["belt-immunity-equipment"].enabled = true
data.raw.recipe["belt-immunity-equipment"].ingredients =
    {
      {"basic-control-board", 5},
      {"nickel-plate", 5},
      {"iron-plate", 10}
    }
	
end