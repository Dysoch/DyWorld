



local DyWorld_Prototype_1 = DyDs_CopyPrototype("pump", "pump", "bronze-pump", true)

data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "bronze-pump",
    icon = "__base__/graphics/icons/pump.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."pipe",
    order = "bronze-pump",
    place_result = "bronze-pump",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "bronze-pump",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 3},
        {type = "item", name = "bronze-pipe", amount = 1},
        {type = "item", name = "control-board-1", amount = 1},
      },
      result = "bronze-pump",
      result_count = 2,
	  enabled = false,
	  energy_required = 1,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 6},
        {type = "item", name = "bronze-pipe", amount = 3},
        {type = "item", name = "control-board-1", amount = 3},
      },
      result = "bronze-pump",
      result_count = 1,
	  enabled = false,
	  energy_required = 5,
    },
  },
})