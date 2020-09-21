

local DyWorld_Prototype_1 = DyDs_CopyPrototype("mining-drill", "electric-mining-drill", "basic-electric-drill", true)

DyWorld_Prototype_1.resource_categories = {"resource-solid-tier-0", "resource-solid-tier-1", "resource-solid-tier-2"}


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "basic-electric-drill",
    icon = "__base__/graphics/icons/electric-mining-drill.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."miners",
    order = "basic-electric-drill",
    place_result = "basic-electric-drill",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "basic-electric-drill",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 2},
        {type = "item", name = "iron-plate", amount = 12},
        {type = "item", name = "bronze-plate", amount = 4},
      },
      result = "basic-electric-drill",
	  enabled = false,
	  energy_required = 5,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 2*6},
        {type = "item", name = "iron-plate", amount = 12*4},
        {type = "item", name = "bronze-plate", amount = 4*5},
      },
      result = "basic-electric-drill",
	  enabled = false,
	  energy_required = 25,
    },
  },
})