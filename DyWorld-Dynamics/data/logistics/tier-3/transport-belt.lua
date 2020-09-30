

local DyWorld_Prototype_1 = DyDs_CopyPrototype("transport-belt", "fast-transport-belt", "transport-belt-3", true)
local DyWorld_Prototype_2 = DyDs_CopyPrototype("item", "fast-transport-belt", "transport-belt-3", true)
DyWorld_Prototype_1.speed = (60 / 480)
	DyWorld_Prototype_2.stack_size = 200
	DyWorld_Prototype_2.order = "3"
	DyWorld_Prototype_2.subgroup = DyDs.."transport-belt"

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  {
    type = "recipe",
    name = "transport-belt-3",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 2},
        {type = "item", name = "bronze-gear", amount = 1},
      },
      result = "transport-belt-3",
	  result_count = 2,
	  energy_required = 1,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 4},
        {type = "item", name = "bronze-gear", amount = 1},
      },
      result = "transport-belt-3",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})