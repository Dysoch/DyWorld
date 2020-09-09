

local DyWorld_Prototype_1 = DyDs_CopyPrototype("loader-1x1", "loader-1x1", "basic-loader", true)
DyWorld_Prototype_1.minable = {mining_time = 0.5, result = "basic-loader"}

data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "basic-loader",
    icon = "__base__/graphics/icons/loader.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."transport-loader",
    order = "1",
    place_result = "basic-loader",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "basic-loader",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 3},
        {type = "item", name = "bronze-gear", amount = 1},
        {type = "item", name = "basic-transport-belt", amount = 1},
      },
      result = "basic-loader",
	  result_count = 1,
	  energy_required = 2,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 4},
        {type = "item", name = "bronze-gear", amount = 3},
        {type = "item", name = "basic-transport-belt", amount = 2},
      },
      result = "basic-loader",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})