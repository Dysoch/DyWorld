

local DyWorld_Prototype_1 = DyDs_CopyPrototype("mining-drill", "pumpjack", "gas-extractor", true)
DyWorld_Prototype_1.resource_categories = {"resource-fluid-tier-1", "resource-fluid-tier-2"}

data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "gas-extractor",
    icon = "__base__/graphics/icons/pumpjack.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."steam-engine",
    order = "1",
    place_result = "gas-extractor",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "gas-extractor",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 10},
        {type = "item", name = "bronze-pipe", amount = 3},
        {type = "item", name = "basic-steam-engine", amount = 1},
        {type = "item", name = "tin-plate", amount = 5},
        {type = "item", name = "iron-plate", amount = 25},
      },
      result = "gas-extractor",
	  enabled = false,
	  energy_required = 2,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 10*3},
        {type = "item", name = "bronze-pipe", amount = 3*5},
        {type = "item", name = "basic-steam-engine", amount = 1},
        {type = "item", name = "tin-plate", amount = 5*6},
        {type = "item", name = "iron-plate", amount = 25*4},
      },
      result = "gas-extractor",
	  enabled = false,
	  energy_required = 10,
    },
  },
})