

local DyWorld_Prototype_1 = DyDs_CopyPrototype("electric-pole", "small-electric-pole", "basic-power-pole", true)


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "basic-power-pole",
    icon = "__base__/graphics/icons/small-electric-pole.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."power-transfer",
    order = "1",
    place_result = "basic-power-pole",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "basic-power-pole",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "wood", amount = 4},
        {type = "item", name = "iron-plate", amount = 1},
        {type = "item", name = "copper-cable", amount = 2},
      },
      result = "basic-power-pole",
      result_count = 4,
	  enabled = false,
	  energy_required = 1,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "wood", amount = 4*3},
        {type = "item", name = "iron-plate", amount = 1*5},
        {type = "item", name = "copper-cable", amount = 2*4},
      },
      result = "basic-power-pole",
	  enabled = false,
	  energy_required = 10,
    },
  },
})