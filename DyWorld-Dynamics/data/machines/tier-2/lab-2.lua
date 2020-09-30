

local DyWorld_Prototype_1 = DyDs_CopyPrototype("lab", "lab", "lab-2", true)
local lab_inputs =
{
  "canister-empty",
}

DyWorld_Prototype_1.inputs = lab_inputs


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "lab-2",
    icon = "__base__/graphics/icons/lab.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."labs",
    order = "lab-2",
    place_result = "lab-2",
    stack_size = 100,
  },
  {
    type = "recipe",
    name = "lab-2",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 3},
        {type = "item", name = "iron-plate", amount = 8},
        {type = "item", name = "bronze-plate", amount = 2},
      },
      result = "lab-2",
	  enabled = false,
	  energy_required = 5,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 3*5},
        {type = "item", name = "iron-plate", amount = 8*4},
        {type = "item", name = "bronze-plate", amount = 2*3},
      },
      result = "lab-2",
	  enabled = false,
	  energy_required = 25,
    },
  },
})