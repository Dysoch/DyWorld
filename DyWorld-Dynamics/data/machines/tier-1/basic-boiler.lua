

local DyWorld_Prototype_1 = DyDs_CopyPrototype("boiler", "boiler", "basic-boiler", true)
DyWorld_Prototype_1.energy_source.fuel_category = "carbon"


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "basic-boiler",
    icon = "__base__/graphics/icons/boiler.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."boiler",
    order = "1",
    place_result = "basic-boiler",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "basic-boiler",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 1},
        {type = "item", name = "bronze-pipe", amount = 1},
        {type = "item", name = "iron-plate", amount = 6},
        {type = "item", name = "copper-plate", amount = 1},
      },
      result = "basic-boiler",
	  enabled = false,
	  energy_required = 2,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 1*5},
        {type = "item", name = "bronze-pipe", amount = 1*5},
        {type = "item", name = "iron-plate", amount = 6*5},
        {type = "item", name = "copper-plate", amount = 1*5},
      },
      result = "basic-boiler",
	  enabled = false,
	  energy_required = 10,
    },
  },
})