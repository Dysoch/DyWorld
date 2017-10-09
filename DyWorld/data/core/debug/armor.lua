require "data/prefix"

data:extend(
{
  {
    type = "equipment-grid",
    name = dyworld_debug_prefix.."equipment-grid",
    width = 40,
    height = 30,
    equipment_categories = {"armor"}
  },
  {
    type = "armor",
    name = dyworld_debug_prefix.."armor",
    icon = "__base__/graphics/icons/power-armor-mk2.png",
    flags = {"goes-to-main-inventory", "hidden"},
    resistances =
    {
      {
        type = "physical",
        decrease = 5000,
        percent = 100
      },
      {
        type = "acid",
        decrease = 5000,
        percent = 100
      },
      {
        type = "explosion",
        decrease = 5000,
        percent = 100
      },
      {
        type = "fire",
        decrease = 5000,
        percent = 100
      }
    },
    durability = 20000000,
    subgroup = dyworld_prefix.."debug",
    order = "x",
    stack_size = 1,
    equipment_grid = dyworld_debug_prefix.."equipment-grid",
    inventory_size_bonus = 500
  },
}
)
