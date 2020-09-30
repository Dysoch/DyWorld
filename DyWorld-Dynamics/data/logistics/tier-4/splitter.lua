

local DyWorld_Prototype_1 = DyDs_CopyPrototype("splitter", "express-splitter", "splitter-4", true)
local DyWorld_Prototype_2 = DyDs_CopyPrototype("item", "express-splitter", "splitter-4", true)
	DyWorld_Prototype_2.stack_size = 200
	DyWorld_Prototype_1.speed = (120 / 480)
	DyWorld_Prototype_2.order = "4"
	DyWorld_Prototype_2.subgroup = DyDs.."transport-splitter"

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  {
    type = "recipe",
    name = "splitter-4",
	category = "assembling-tier-4",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 3},
        {type = "item", name = "bronze-gear", amount = 1},
        {type = "item", name = "transport-belt-4", amount = 2},
      },
      result = "splitter-4",
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
        {type = "item", name = "transport-belt-4", amount = 2},
      },
      result = "splitter-4",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})