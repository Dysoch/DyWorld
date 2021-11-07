

local DyWorld_Prototype_1 = DyDs_CopyPrototype("locomotive", "locomotive", "locomotive-1", true)
DyWorld_Prototype_1.minable = {mining_time = 0.5, result = "locomotive-1"}
DyWorld_Prototype_1.burner.fuel_category = "carbon"
DyWorld_Prototype_1.burner.fuel_inventory_size = 1

data:extend({
  DyWorld_Prototype_1,
  {
    type = "item-with-entity-data",
    name = "locomotive-1",
    icon = "__base__/graphics/icons/locomotive.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."rail",
    order = "2",
    place_result = "locomotive-1",
    stack_size = 1,
  },
  {
    type = "recipe",
    name = "locomotive-1",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "engine-unit", amount = 2},
        {type = "item", name = "iron-plate", amount = 25},
        {type = "item", name = "bronze-gear", amount = 4},
        {type = "item", name = "bronze-plate", amount = 2},
      },
      result = "locomotive-1",
	  result_count = 1,
	  energy_required = 2,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "engine-unit", amount = 2*5},
        {type = "item", name = "iron-plate", amount = 25*5},
        {type = "item", name = "bronze-gear", amount = 4*5},
        {type = "item", name = "bronze-plate", amount = 2*5},
      },
      result = "locomotive-1",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})