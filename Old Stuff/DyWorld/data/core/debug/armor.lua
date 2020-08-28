require "data/core/functions/prefix"

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
	icon_size = 32,
    flags = {"hidden"},
    resistances =
    {
    },
    durability = 20000000,
    --subgroup = dyworld_prefix.."debug",
    order = "x",
    stack_size = 1,
    equipment_grid = dyworld_debug_prefix.."equipment-grid",
    inventory_size_bonus = 500
  },
}
)

for _,z in pairs(data.raw["damage-type"]) do
	RESULT = {
        type = z.name,
        decrease = 5000,
        percent = 100
      }
	table.insert(data.raw.armor[dyworld_debug_prefix.."armor"].resistances, RESULT)
end
