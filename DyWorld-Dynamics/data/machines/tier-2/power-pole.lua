

local DyWorld_Prototype_1 = DyDs_CopyPrototype("electric-pole", "medium-electric-pole", "advanced-power-pole", true)
DyWorld_Prototype_1.maximum_wire_distance = 15
DyWorld_Prototype_1.supply_area_distance = 4.5
local DyWorld_Prototype_2 = DyDs_CopyPrototype("electric-pole", "big-electric-pole", "basic-power-relay", true)
DyWorld_Prototype_2.maximum_wire_distance = 32
DyWorld_Prototype_2.supply_area_distance = 7

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  {
    type = "item",
    name = "advanced-power-pole",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."power-transfer",
    order = "2",
    place_result = "advanced-power-pole",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "advanced-power-pole",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 3},
        {type = "item", name = "copper-cable", amount = 4},
        {type = "item", name = "rubber", amount = 2},
      },
      result = "advanced-power-pole",
      result_count = 1,
	  enabled = false,
	  energy_required = 2.5,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 3 * ER_Mod},
        {type = "item", name = "copper-cable", amount = 4 * ER_Mod},
        {type = "item", name = "rubber", amount = 2 * ER_Mod},
      },
      result = "advanced-power-pole",
	  enabled = false,
	  energy_required = 10,
    },
  },
  {
    type = "item",
    name = "basic-power-relay",
    icon = "__base__/graphics/icons/big-electric-pole.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."power-transfer",
    order = "4",
    place_result = "basic-power-relay",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "basic-power-relay",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 3},
        {type = "item", name = "copper-cable", amount = 4},
        {type = "item", name = "rubber", amount = 2},
      },
      result = "basic-power-relay",
      result_count = 1,
	  enabled = false,
	  energy_required = 2.5,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 3 * ER_Mod},
        {type = "item", name = "copper-cable", amount = 4 * ER_Mod},
        {type = "item", name = "rubber", amount = 2 * ER_Mod},
      },
      result = "basic-power-relay",
	  enabled = false,
	  energy_required = 10,
    },
  },
})