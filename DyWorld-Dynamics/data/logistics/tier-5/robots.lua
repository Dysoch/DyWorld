

local DyWorld_Prototype_1 = DyDs_CopyPrototype("construction-robot", "construction-robot", "construction-robot-3", true)
local DyWorld_Prototype_2 = DyDs_CopyPrototype("logistic-robot", "logistic-robot", "logistic-robot-3", true)
local DyWorld_Prototype_3 = DyDs_CopyPrototype("roboport", "roboport", "roboport-3", true)
DyWorld_Prototype_1.max_health = 5000
DyWorld_Prototype_2.max_health = 5000
DyWorld_Prototype_1.max_payload_size = 15
DyWorld_Prototype_2.max_payload_size = 15
DyWorld_Prototype_1.max_energy = "50MJ"
DyWorld_Prototype_2.max_energy = "50MJ"
DyWorld_Prototype_1.speed_multiplier_when_out_of_energy = 0.8
DyWorld_Prototype_2.speed_multiplier_when_out_of_energy = 0.8
DyWorld_Prototype_1.speed = (200 / 216)
DyWorld_Prototype_2.speed = (180 / 216)
DyWorld_Prototype_3.max_health = 10000
DyWorld_Prototype_3.energy_source.input_flow_limit = "125MW"
DyWorld_Prototype_3.energy_source.buffer_capacity = "2500MJ"
DyWorld_Prototype_3.energy_usage = "1000kW"
DyWorld_Prototype_3.charging_energy = "20000kW"
DyWorld_Prototype_3.logistics_radius = 160
DyWorld_Prototype_3.construction_radius = 220
DyWorld_Prototype_3.robot_slots_count = 2
DyWorld_Prototype_3.material_slots_count = 9
DyWorld_Prototype_3.fast_replaceable_group = "robot"

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  DyWorld_Prototype_3,
  {
    type = "item",
    name = "construction-robot-3",
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/construction-robot.png",
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."robot-construction",
    order = "3",
    place_result = "construction-robot-3",
    stack_size = 500,
  },
  {
    type = "recipe",
    name = "construction-robot-3",
	category = "assembling-tier-5",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 3},
        {type = "item", name = "bronze-gear", amount = 1},
      },
      result = "construction-robot-3",
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
      result = "construction-robot-3",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  {
    type = "item",
    name = "logistic-robot-3",
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/logistic-robot.png",
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."robot-logistic",
    order = "3",
    place_result = "logistic-robot-3",
    stack_size = 500,
  },
  {
    type = "recipe",
    name = "logistic-robot-3",
	category = "assembling-tier-5",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 3},
        {type = "item", name = "bronze-gear", amount = 1},
      },
      result = "logistic-robot-3",
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
      result = "logistic-robot-3",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  {
    type = "item",
    name = "roboport-3",
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/roboport.png",
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."roboport",
    order = "3",
    place_result = "roboport-3",
    stack_size = 50,
  },
  {
    type = "recipe",
    name = "roboport-3",
	category = "assembling-tier-5",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 3},
        {type = "item", name = "bronze-gear", amount = 1},
      },
      result = "roboport-3",
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
      result = "roboport-3",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})