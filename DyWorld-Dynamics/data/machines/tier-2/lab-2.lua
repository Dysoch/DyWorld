

local DyWorld_Prototype_1 = DyDs_CopyPrototype("lab", "lab", "lab-2", true)
local DyWorld_Prototype_2 = DyDs_CopyPrototype("lab", "lab", "lab-3", true)
local lab_inputs =
{
  "canister-empty",
}

DyWorld_Prototype_1.inputs = lab_inputs
DyWorld_Prototype_2.inputs = lab_inputs


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
  },
  DyWorld_Prototype_2,
  {
    type = "item",
    name = "lab-3",
    icon = "__base__/graphics/icons/lab.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."labs",
    order = "lab-3",
    place_result = "lab-3",
    stack_size = 100,
  },
  {
    type = "recipe",
    name = "lab-3",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 3},
        {type = "item", name = "iron-plate", amount = 8},
        {type = "item", name = "bronze-plate", amount = 2},
      },
      result = "lab-3",
	  enabled = false,
	  energy_required = 5,
    },
  },
})