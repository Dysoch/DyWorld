require "data/prefix"

data:extend(
{
  {
    type = "recipe",
    name = dy.."water-seperation-1",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
	    icon = data.raw.fluid["water"].icon,
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = "centrifuging",
    energy_required = 5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 120},
    },
    results=
    {
      {type = "fluid", name = dy.."water-clean", amount = 80},
      {type = "fluid", name = dy.."sewage", amount = 20},
      {type = "fluid", name = dy.."sludge", amount = 10},
      {type = "fluid", name = dy.."acid", amount = 6},
      {type = "fluid", name = "crude-oil", amount = 0.5},
      {type = "fluid", name = dy.."methane", amount = 3.5},
    },
    subgroup = dy.."fluid-recipes",
    order = "water-seperation",
  },
  {
    type = "recipe",
    name = dy.."conductive-fluid",
    icons = 
	{
	  {
	    icon = dyworld_path_fluid.."conductive-fluid.png",
	  },
	},
    category = "chemistry",
    energy_required = 5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = "sulfuric-acid", amount = 50},
      {type = "item", name = "lithium-ore", amount = 5},
    },
    results=
    {
      {type = "fluid", name = dy.."conductive-fluid", amount = 50},
    },
    subgroup = dy.."fluid-recipes",
    order = "water-seperation",
  },
  {
    type = "recipe",
    name = dy.."clean-water-seperation-1",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
	    icon = data.raw.fluid[dy.."water-clean"].icon,
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = "centrifuging",
    energy_required = 1,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 250},
      {type = "item", name = dy.."sand", amount = 10},
    },
    results=
    {
      {type = "fluid", name = dy.."water-clean", amount = 250},
      {type = "fluid", name = dy.."sludge", amount = 10},
    },
    subgroup = dy.."fluid-recipes",
    order = "water-seperation",
  },
  {
    type = "recipe",
    name = dy.."water-seperation-2",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
	    icon = data.raw.fluid["water"].icon,
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = "centrifuging",
    energy_required = 15,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 100},
    },
    results=
    {
      {type = "fluid", name = "hydrogen", amount = 200},
      {type = "fluid", name = "oxygen", amount = 100},
    },
    subgroup = dy.."fluid-recipes",
    order = "water-seperation",
  },
  {
    type = "recipe",
    name = dy.."sludge-seperation",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
	    icon = data.raw.fluid[dy.."sludge"].icon,
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = "centrifuging",
    energy_required = 15,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."sludge", amount = 2500},
    },
    results =
    {
      {type = "item", name = "bauxite", amount_min = 1, amount_max = 5, probability = 1},
      {type = "item", name = dy.."sand", amount_min = 1, amount_max = 10, probability = 0.75},
      {type = "item", name = "carbolycite", amount_min = 1, amount_max = 5, probability = 0.35},
      {type = "item", name = "chalcopyrite", amount_min = 1, amount_max = 5, probability = 0.19},
      {type = "item", name = "hematite", amount_min = 1, amount_max = 5, probability = 0.125},
      {type = "item", name = "galena", amount_min = 1, amount_max = 5, probability = 0.07},
      {type = "item", name = "prolycotherium", amount_min = 1, amount_max = 5, probability = 0.1},
      {type = "item", name = "radicium", amount_min = 1, amount_max = 5, probability = 0.06},
    },
    subgroup = dy.."fluid-recipes",
    order = "sludge-seperation",
  },
  {
    type = "recipe",
    name = dy.."acid-seperation",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
	    icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = "centrifuging",
    enabled = false,
    energy_required = 2.5,
    ingredients =
    {
      {type = "fluid", name = dy.."acid", amount = 100},
    },
    results =
    {
      {type = "fluid", name = "sulfuric-acid", amount = 60},
      {type = "fluid", name = dy.."sludge", amount = 15},
      {type = "fluid", name = dy.."water-clean", amount = 25},
    },
    subgroup = dy.."fluid-recipes",
    order = "acid-seperation",
  },
  {
    type = "recipe",
    name = dy.."fertilizer-seperation",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
	    icon = data.raw.fluid[dy.."fertilized-water"].icon,
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = "centrifuging",
    energy_required = 5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."sewage", amount = 250},
    },
    results=
    {
      {type = "fluid", name = dy.."fertilized-water", amount = 100},
      {type = "fluid", name = dy.."sludge", amount = 150},
    },
    subgroup = dy.."fluid-recipes",
    order = "fertilizer-seperation",
  },
  {
    type = "recipe",
    name = dy.."basic-clean-oil-processing",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
	  },
	  {
	    icon = "__base__/graphics/icons/fluid/crude-oil.png",
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = "centrifuging",
    enabled = false,
    energy_required = 2.5,
    ingredients =
    {
      {type = "fluid", name = dy.."clean-oil", amount = 60}
    },
    results =
    {
      {type = "fluid", name = "heavy-oil", amount = 15},
      {type = "fluid", name = "petroleum-gas", amount = 20},
      {type = "fluid", name = "light-oil", amount = 15},
      {type = "fluid", name = dy.."sewage", amount = 10},
    },
    subgroup = dy.."fluid-recipes",
    order = "basic-clean-oil-processing"
  },
  {
    type = "recipe",
    name = dy.."advanced-clean-oil-processing",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
	    icon = "__base__/graphics/icons/fluid/crude-oil.png",
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = "centrifuging",
    enabled = false,
    energy_required = 2.5,
    ingredients =
    {
      {type = "fluid", name = dy.."clean-oil", amount = 75},
      {type = "fluid", name = dy.."water-clean", amount = 25},
    },
    results =
    {
      {type = "fluid", name = "petroleum-gas", amount = 25},
      {type = "fluid", name = "light-oil", amount = 20},
      {type = "fluid", name = "heavy-oil", amount = 20},
      {type = "fluid", name = dy.."sewage", amount = 30},
      {type = "fluid", name = dy.."acid", amount = 5},
    },
    subgroup = dy.."fluid-recipes",
    order = "advanced-clean-oil-processing"
  },
  {
    type = "recipe",
    name = dy.."rocket-fuel",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
	    icon = "__base__/graphics/icons/fluid/crude-oil.png",
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = "centrifuging",
    enabled = false,
    energy_required = 30,
    ingredients =
    {
      {type = "fluid", name = "petroleum-gas", amount = 25},
      {type = "fluid", name = "oxygen", amount = 75},
    },
    results =
    {
      {type = "fluid", name = dy.."rocket-fuel", amount = 50},
    },
    subgroup = dy.."fluid-recipes",
    order = "rocket-fuel"
  },
  {
    type = "recipe",
    name = dy.."advanced-lubricant",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
	    icon = "__base__/graphics/icons/fluid/lubricant.png",
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = "centrifuging",
    enabled = false,
    energy_required = 30,
    ingredients =
    {
      {type = "fluid", name = "lubricant", amount = 25},
      {type = "fluid", name = "hydrogen", amount = 75},
    },
    results =
    {
      {type = "fluid", name = dy.."advanced-lubricant", amount = 50},
    },
    subgroup = dy.."fluid-recipes",
    order = "advanced-lubricant"
  },
  {
    type = "recipe",
    name = dy.."super-lubricant",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
	    icon = "__base__/graphics/icons/fluid/lubricant.png",
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = "centrifuging",
    enabled = false,
    energy_required = 60,
    ingredients =
    {
      {type = "fluid", name = dy.."advanced-lubricant", amount = 25},
      {type = "fluid", name = "hydrogen", amount = 250},
      {type = "fluid", name = dy.."methane", amount = 75},
      {type = "fluid", name = dy.."rocket-fuel", amount = 25},
    },
    results =
    {
      {type = "fluid", name = dy.."super-lubricant", amount = 50},
    },
    subgroup = dy.."fluid-recipes",
    order = "super-lubricant"
  },
  {
    type = "recipe",
    name = dy.."ore-grinding-1",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
	    icon = "__base__/graphics/icons/fluid/water.png",
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = dy.."grinder",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "chalcopyrite", amount = 5},
      {type = "fluid", name = dy.."water-clean", amount = 25},
    },
    results =
    {
      {type = "item", name = dy.."sand", amount_min = 5, amount_max = 75},
    },
    subgroup = dy.."fluid-recipes",
    order = dy.."ore-grinding-1",
  },
  {
    type = "recipe",
    name = dy.."ore-grinding-2",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
	    icon = "__base__/graphics/icons/fluid/water.png",
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = dy.."grinder",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "hematite", amount = 5},
      {type = "fluid", name = dy.."water-clean", amount = 25},
    },
    results =
    {
      {type = "item", name = dy.."sand", amount_min = 5, amount_max = 75},
    },
    subgroup = dy.."fluid-recipes",
    order = dy.."ore-grinding-2",
  },
  {
    type = "recipe",
    name = dy.."ore-grinding-3",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
	    icon = "__base__/graphics/icons/fluid/water.png",
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = dy.."grinder",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "galena", amount = 5},
      {type = "fluid", name = dy.."water-clean", amount = 25},
    },
    results =
    {
      {type = "item", name = dy.."sand", amount_min = 5, amount_max = 75},
    },
    subgroup = dy.."fluid-recipes",
    order = dy.."ore-grinding-3",
  },
  {
    type = "recipe",
    name = dy.."ore-grinding-4",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
	    icon = "__base__/graphics/icons/fluid/water.png",
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = dy.."grinder",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "prolycotherium", amount = 5},
      {type = "fluid", name = dy.."water-clean", amount = 25},
    },
    results =
    {
      {type = "item", name = dy.."sand", amount_min = 5, amount_max = 75},
    },
    subgroup = dy.."fluid-recipes",
    order = dy.."ore-grinding-4",
  },
  {
    type = "recipe",
    name = dy.."ore-grinding-5",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
	    icon = "__base__/graphics/icons/fluid/water.png",
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = dy.."grinder",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "carbolycite", amount = 5},
      {type = "fluid", name = dy.."water-clean", amount = 25},
    },
    results =
    {
      {type = "item", name = dy.."sand", amount_min = 5, amount_max = 75},
    },
    subgroup = dy.."fluid-recipes",
    order = dy.."ore-grinding-5",
  },
  {
    type = "recipe",
    name = dy.."ore-grinding-6",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
	    icon = "__base__/graphics/icons/fluid/water.png",
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = dy.."grinder",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "bauxite", amount = 5},
      {type = "fluid", name = dy.."water-clean", amount = 25},
    },
    results =
    {
      {type = "item", name = dy.."sand", amount_min = 5, amount_max = 75},
    },
    subgroup = dy.."fluid-recipes",
    order = dy.."ore-grinding-6",
  },
  {
    type = "recipe",
    name = dy.."ore-grinding-7",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
	    icon = "__base__/graphics/icons/fluid/water.png",
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = dy.."grinder",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "radicium", amount = 5},
      {type = "fluid", name = dy.."water-clean", amount = 25},
    },
    results =
    {
      {type = "item", name = dy.."sand", amount_min = 5, amount_max = 75},
    },
    subgroup = dy.."fluid-recipes",
    order = dy.."ore-grinding-7",
  },
  {
    type = "recipe",
    name = dy.."acid-creation",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
	    icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = "centrifuging",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "sulfur", amount = 5},
      {type = "fluid", name = "water", amount = 25},
      {type = "fluid", name = dy.."methane", amount = 25},
    },
    results =
    {
      {type = "fluid", name = dy.."acid", amount_min = 50, amount_max = 100},
    },
    subgroup = dy.."fluid-recipes",
    order = dy.."acid-creation",
  },
})

DyWorld_Add_To_Tech("advanced-oil-processing", dy.."advanced-lubricant")
DyWorld_Add_To_Tech("advanced-oil-processing", dy.."super-lubricant")
DyWorld_Add_To_Tech("automation", dy.."ore-grinding-1")
DyWorld_Add_To_Tech("automation", dy.."ore-grinding-2")
DyWorld_Add_To_Tech("automation", dy.."ore-grinding-3")
DyWorld_Add_To_Tech("automation", dy.."ore-grinding-4")
DyWorld_Add_To_Tech("automation", dy.."ore-grinding-5")
DyWorld_Add_To_Tech("automation", dy.."ore-grinding-6")
DyWorld_Add_To_Tech("automation", dy.."ore-grinding-7")
DyWorld_Add_To_Tech("automation-2", dy.."acid-creation")
DyWorld_Add_To_Tech("fluid-handling-4", dy.."clean-water-seperation-1")