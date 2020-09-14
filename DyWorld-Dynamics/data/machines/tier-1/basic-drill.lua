

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
        {"wood", 3}
      },
      result = "basic-electric-drill",
	  enabled = false,
	  energy_required = 2,
    },
    expensive =
    {
      ingredients =
      {
        {"wood", 10}
      },
      result = "basic-electric-drill",
	  enabled = false,
	  energy_required = 10,
    },
  },
})