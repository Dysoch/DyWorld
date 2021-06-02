



local DyWorld_Prototype_1 = DyDs_CopyPrototype("pipe", "pipe", "bronze-pipe", true)
local DyWorld_Prototype_2 = DyDs_CopyPrototype("pipe-to-ground", "pipe-to-ground", "bronze-pipe-to-ground", true)

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  {
    type = "item",
    name = "bronze-pipe",
    icon = "__base__/graphics/icons/pipe.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."pipe",
    order = "bronze-pipe",
    place_result = "bronze-pipe",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "bronze-pipe",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 3},
      },
      result = "bronze-pipe",
      result_count = 2,
	  enabled = false,
	  energy_required = 1,
    },
  },
  {
    type = "item",
    name = "bronze-pipe-to-ground",
    icon = "__base__/graphics/icons/pipe-to-ground.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."pipe-underground",
    order = "bronze-pipe-to-ground",
    place_result = "bronze-pipe-to-ground",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "bronze-pipe-to-ground",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-pipe", amount = 10},
        {type = "item", name = "bronze-plate", amount = 2},
      },
      result = "bronze-pipe-to-ground",
      result_count = 2,
	  enabled = false,
	  energy_required = 1,
    },
  },
})