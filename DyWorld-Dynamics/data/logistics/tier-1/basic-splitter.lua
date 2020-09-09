

local DyWorld_Prototype_1 = DyDs_CopyPrototype("splitter", "splitter", "basic-splitter", true)
local DyWorld_Prototype_2 = DyDs_CopyPrototype("item", "splitter", "basic-splitter", true)
	DyWorld_Prototype_2.stack_size = 200
	DyWorld_Prototype_2.order = "1"
	DyWorld_Prototype_2.subgroup = DyDs.."transport-belt-underground"

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  {
    type = "recipe",
    name = "basic-splitter",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 3},
        {type = "item", name = "bronze-gear", amount = 1},
        {type = "item", name = "basic-transport-belt", amount = 2},
      },
      result = "basic-splitter",
	  result_count = 1,
	  energy_required = 2,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 4},
        {type = "item", name = "bronze-gear", amount = 1},
        {type = "item", name = "basic-transport-belt", amount = 2},
      },
      result = "basic-splitter",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})