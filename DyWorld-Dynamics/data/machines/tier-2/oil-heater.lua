

local DyWorld_Prototype_1 = DyDs_CopyPrototype("boiler", "boiler", "oil-boiler-1", true)
local DyWorld_Prototype_2 = DyDs_CopyPrototype("boiler", "boiler", "oil-boiler-2", true)
local DyWorld_Prototype_3 = DyDs_CopyPrototype("boiler", "boiler", "oil-boiler-3", true)
local DyWorld_Prototype_4 = DyDs_CopyPrototype("boiler", "boiler", "oil-boiler-4", true)
local DyWorld_Prototype_5 = DyDs_CopyPrototype("boiler", "boiler", "oil-boiler-5", true)
DyWorld_Prototype_1.fluid_box.filter = "crude-oil"
DyWorld_Prototype_2.fluid_box.filter = "crude-oil"
DyWorld_Prototype_3.fluid_box.filter = "crude-oil"
DyWorld_Prototype_4.fluid_box.filter = "crude-oil"
DyWorld_Prototype_5.fluid_box.filter = "crude-oil"
DyWorld_Prototype_1.output_fluid_box.filter = "crude-oil"
DyWorld_Prototype_2.output_fluid_box.filter = "crude-oil"
DyWorld_Prototype_3.output_fluid_box.filter = "crude-oil"
DyWorld_Prototype_4.output_fluid_box.filter = "crude-oil"
DyWorld_Prototype_5.output_fluid_box.filter = "crude-oil"
DyWorld_Prototype_1.energy_usage = "300kW"
DyWorld_Prototype_2.energy_usage = "600kW"
DyWorld_Prototype_3.energy_usage = "900kW"
DyWorld_Prototype_4.energy_usage = "1200kW"
DyWorld_Prototype_5.energy_usage = "1500kW"
DyWorld_Prototype_1.energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.4kW"
    }
DyWorld_Prototype_2.energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.4kW"
    }
DyWorld_Prototype_3.energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.4kW"
    }
DyWorld_Prototype_4.energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.4kW"
    }
DyWorld_Prototype_5.energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.4kW"
    }
DyWorld_Prototype_1.target_temperature = 50
DyWorld_Prototype_2.target_temperature = 120
DyWorld_Prototype_3.target_temperature = 200
DyWorld_Prototype_4.target_temperature = 260
DyWorld_Prototype_5.target_temperature = 325

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  DyWorld_Prototype_3,
  DyWorld_Prototype_4,
  DyWorld_Prototype_5,
  {
    type = "item",
    name = "oil-boiler-1",
    icon = "__base__/graphics/icons/boiler.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."oil-refinery",
    order = "5a",
    place_result = "oil-boiler-1",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "oil-boiler-1",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 10},
        {type = "item", name = "bronze-pipe", amount = 3},
        {type = "item", name = "tin-plate", amount = 5},
        {type = "item", name = "iron-plate", amount = 25},
      },
      result = "oil-boiler-1",
	  enabled = false,
	  energy_required = 2,
    },
  },
  {
    type = "item",
    name = "oil-boiler-2",
    icon = "__base__/graphics/icons/boiler.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."oil-refinery",
    order = "5b",
    place_result = "oil-boiler-2",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "oil-boiler-2",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 10},
        {type = "item", name = "bronze-pipe", amount = 3},
        {type = "item", name = "tin-plate", amount = 5},
        {type = "item", name = "iron-plate", amount = 25},
      },
      result = "oil-boiler-2",
	  enabled = false,
	  energy_required = 2,
    },
  },
  {
    type = "item",
    name = "oil-boiler-3",
    icon = "__base__/graphics/icons/boiler.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."oil-refinery",
    order = "5c",
    place_result = "oil-boiler-3",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "oil-boiler-3",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 10},
        {type = "item", name = "bronze-pipe", amount = 3},
        {type = "item", name = "tin-plate", amount = 5},
        {type = "item", name = "iron-plate", amount = 25},
      },
      result = "oil-boiler-3",
	  enabled = false,
	  energy_required = 2,
    },
  },
  {
    type = "item",
    name = "oil-boiler-4",
    icon = "__base__/graphics/icons/boiler.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."oil-refinery",
    order = "5d",
    place_result = "oil-boiler-4",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "oil-boiler-4",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 10},
        {type = "item", name = "bronze-pipe", amount = 3},
        {type = "item", name = "tin-plate", amount = 5},
        {type = "item", name = "iron-plate", amount = 25},
      },
      result = "oil-boiler-4",
	  enabled = false,
	  energy_required = 2,
    },
  },
  {
    type = "item",
    name = "oil-boiler-5",
    icon = "__base__/graphics/icons/boiler.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."oil-refinery",
    order = "5e",
    place_result = "oil-boiler-5",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "oil-boiler-5",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 10},
        {type = "item", name = "bronze-pipe", amount = 3},
        {type = "item", name = "tin-plate", amount = 5},
        {type = "item", name = "iron-plate", amount = 25},
      },
      result = "oil-boiler-5",
	  enabled = false,
	  energy_required = 2,
    },
  },
})