

local DyWorld_Prototype_1 = DyDs_CopyPrototype("inserter", "inserter", "basic-inserter", true)

DyWorld_Prototype_1.max_health = 250


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "basic-inserter",
    icon = "__base__/graphics/icons/inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."inserter-tier-1",
    order = "2",
    place_result = "basic-inserter",
    stack_size = 200,
  },
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
  },
})