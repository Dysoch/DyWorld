

local DyWorld_Prototype_1 = DyDs_CopyPrototype("transport-belt", "transport-belt", "basic-transport-belt", true)
local DyWorld_Prototype_2 = DyDs_CopyPrototype("item", "transport-belt", "basic-transport-belt", true)
	DyWorld_Prototype_2.stack_size = 200
	DyWorld_Prototype_2.order = "1"
	DyWorld_Prototype_2.subgroup = DyDs.."transport-belt"

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  {
    type = "recipe",
    name = "basic-transport-belt",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 2},
        {type = "item", name = "bronze-gear", amount = 1},
      },
      result = "basic-transport-belt",
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
      result = "basic-transport-belt",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})