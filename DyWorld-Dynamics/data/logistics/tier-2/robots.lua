

local DyWorld_Prototype_1 = DyDs_CopyPrototype("construction-robot", "construction-robot", "construction-robot-1", true)
local DyWorld_Prototype_2 = DyDs_CopyPrototype("logistic-robot", "logistic-robot", "logistic-robot-1", true)
DyWorld_Prototype_1.max_health = 250
DyWorld_Prototype_2.max_health = 250
DyWorld_Prototype_1.speed = (15 / 216)
DyWorld_Prototype_2.speed = (12.5 / 216)

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  {
    type = "item",
    name = "construction-robot-1",
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/construction-robot.png",
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."transport-loader",
    order = "1",
    place_result = "construction-robot-1",
    stack_size = 500,
  },
  {
    type = "recipe",
    name = "construction-robot-1",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 3},
        {type = "item", name = "bronze-gear", amount = 1},
      },
      result = "construction-robot-1",
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
      },
      result = "construction-robot-1",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  {
    type = "item",
    name = "logistic-robot-1",
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/logistic-robot.png",
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."transport-loader",
    order = "1",
    place_result = "logistic-robot-1",
    stack_size = 500,
  },
  {
    type = "recipe",
    name = "logistic-robot-1",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 3},
        {type = "item", name = "bronze-gear", amount = 1},
      },
      result = "logistic-robot-1",
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
      },
      result = "logistic-robot-1",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})