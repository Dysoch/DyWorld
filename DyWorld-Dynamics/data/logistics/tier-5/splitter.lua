

local DyWorld_Prototype_1 = DyDs_CopyPrototype("splitter", "express-splitter", "splitter-5", true)
local DyWorld_Prototype_2 = DyDs_CopyPrototype("item", "express-splitter", "splitter-5", true)
	DyWorld_Prototype_2.stack_size = 200
DyWorld_Prototype_1.belt_animation_set = DyWorld_basic_belt_animation_set(Tier_5)
	DyWorld_Prototype_1.speed = (240 / 480)
	DyWorld_Prototype_2.order = "5"
	DyWorld_Prototype_2.subgroup = DyDs.."transport-splitter"

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  {
    type = "recipe",
    name = "splitter-5",
	category = "assembling-tier-5",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 3},
        {type = "item", name = "bronze-gear", amount = 1},
        {type = "item", name = "transport-belt-5", amount = 2},
      },
      result = "splitter-5",
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
        {type = "item", name = "transport-belt-5", amount = 2},
      },
      result = "splitter-5",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})