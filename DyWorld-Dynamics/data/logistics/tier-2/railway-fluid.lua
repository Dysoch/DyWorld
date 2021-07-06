

local DyWorld_Prototype_1 = DyDs_CopyPrototype("fluid-wagon", "fluid-wagon", "fluid-wagon-1", true)
DyWorld_Prototype_1.minable = {mining_time = 0.5, result = "fluid-wagon-1"}
DyWorld_Prototype_1.inventory_size = 10

data:extend({
  DyWorld_Prototype_1,
  {
    type = "item-with-entity-data",
    name = "fluid-wagon-1",
    icon = "__base__/graphics/icons/fluid-wagon.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."rail",
    order = "2",
    place_result = "fluid-wagon-1",
    stack_size = 1,
  },
  {
    type = "recipe",
    name = "fluid-wagon-1",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "rubber", amount = 2},
        {type = "item", name = "iron-plate", amount = 10},
        {type = "item", name = "iron-gear", amount = 4},
        {type = "item", name = "bronze-plate", amount = 2},
      },
      result = "fluid-wagon-1",
	  result_count = 1,
	  energy_required = 2,
	  enabled = false,
    },
  },
})