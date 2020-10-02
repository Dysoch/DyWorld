

local DyWorld_Prototype_1 = DyDs_CopyPrototype("construction-robot", "construction-robot", "construction-robot-2", true)
local DyWorld_Prototype_2 = DyDs_CopyPrototype("logistic-robot", "logistic-robot", "logistic-robot-2", true)
DyWorld_Prototype_1.max_health = 1000
DyWorld_Prototype_2.max_health = 1000
DyWorld_Prototype_1.max_payload_size = 5
DyWorld_Prototype_2.max_payload_size = 5
DyWorld_Prototype_1.max_energy = "10MJ"
DyWorld_Prototype_2.max_energy = "10MJ"
DyWorld_Prototype_1.speed_multiplier_when_out_of_energy = 0.5
DyWorld_Prototype_2.speed_multiplier_when_out_of_energy = 0.5
DyWorld_Prototype_1.speed = (40 / 216)
DyWorld_Prototype_2.speed = (30 / 216)

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  {
    type = "item",
    name = "construction-robot-2",
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/construction-robot.png",
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."transport-loader",
    order = "2",
    place_result = "construction-robot-2",
    stack_size = 500,
  },
  {
    type = "recipe",
    name = "construction-robot-2",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 3},
        {type = "item", name = "bronze-gear", amount = 1},
      },
      result = "construction-robot-2",
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
      result = "construction-robot-2",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  {
    type = "item",
    name = "logistic-robot-2",
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/logistic-robot.png",
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."transport-loader",
    order = "2",
    place_result = "logistic-robot-2",
    stack_size = 500,
  },
  {
    type = "recipe",
    name = "logistic-robot-2",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 3},
        {type = "item", name = "bronze-gear", amount = 1},
      },
      result = "logistic-robot-2",
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
      result = "logistic-robot-2",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})