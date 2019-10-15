require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

data:extend(
{
  {
    type = "generator-equipment",
    name = "portable-engine-equipment-tier-1",
    sprite =
    {
      filename = "__base__/graphics/equipment/discharge-defense-equipment.png",
      width = 64,
      height = 64,
      priority = "medium"
    },
    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    burner =
    {
      fuel_category = "chemical",
      emissions_per_second_per_watt = 40 / 200000,
      fuel_inventory_size = 2,
    },
    energy_source =
    {
      type = "burner",
      usage_priority = "secondary-output"
    },
    power = "200kW",
    categories = {"armor"}
  },
  {
    type = "item",
    name = "portable-engine-equipment-tier-1",
    icon = "__base__/graphics/icons/solar-panel-equipment.png",
    icon_size = 32,
    placed_as_equipment_result = "portable-engine-equipment-tier-1",
    subgroup = "equipment",
    order = "portable-engine-equipment-tier-1",
    stack_size = 1
  },
  {
    type = "recipe",
    name = "portable-engine-equipment-tier-1",
    enabled = true,
    energy_required = 10,
    ingredients =
    {
      {"basic-control-board", 5},
      {"nickel-plate", 5},
      {"iron-plate", 10}
    },
    result = "portable-engine-equipment-tier-1"
  },
})
