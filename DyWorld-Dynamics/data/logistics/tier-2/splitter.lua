

local DyWorld_Prototype_1 = DyDs_CopyPrototype("splitter", "fast-splitter", "splitter-2", true)
local DyWorld_Prototype_2 = DyDs_CopyPrototype("item", "fast-splitter", "splitter-2", true)
	DyWorld_Prototype_2.stack_size = 200
	DyWorld_Prototype_1.speed = (30 / 480)
DyWorld_Prototype_1.next_upgrade = "splitter-3"
DyWorld_Prototype_1.belt_animation_set = DyWorld_basic_belt_animation_set(Tier_2)
	DyWorld_Prototype_2.order = "2"
	DyWorld_Prototype_2.subgroup = DyDs.."transport-splitter"

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  {
    type = "recipe",
    name = "splitter-2",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 3},
        {type = "item", name = "bronze-gear", amount = 1},
        {type = "item", name = "transport-belt-2", amount = 2},
      },
      result = "splitter-2",
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
        {type = "item", name = "transport-belt-2", amount = 2},
      },
      result = "splitter-2",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})