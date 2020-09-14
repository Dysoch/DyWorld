

local DyWorld_Prototype_1 = DyDs_CopyPrototype("inserter", "inserter", "basic-inserter", true)

DyWorld_Prototype_1.max_health = 250


data:extend({
  DyWorld_Prototype_1,
  {
    type = "recipe",
    name = "basic-inserter",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 2},
        {type = "item", name = "bronze-gear", amount = 1},
        {type = "item", name = "control-board-1", amount = 1},
      },
      result = "basic-inserter",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 12},
        {type = "item", name = "bronze-gear", amount = 6},
        {type = "item", name = "control-board-1", amount = 3},
      },
      result = "basic-inserter",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})