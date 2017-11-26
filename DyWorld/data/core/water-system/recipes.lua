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
      {type = "fluid", name = dy.."acid", amount = 5},
      {type = "fluid", name = "crude-oil", amount = 2.5},
      {type = "fluid", name = dy.."methane", amount = 2.5},
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
      {type = "fluid", name = dy.."hydrogen", amount = 100},
      {type = "fluid", name = dy.."oxygen", amount = 200},
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
    energy_required = 5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."sludge", amount = 2500},
    },
    results=
    {
      {type = "item", name = "stone", amount_min = 1, amount_max = 4, probability = 1},
      {type = "item", name = dy.."sand", amount_min = 1, amount_max = 10, probability = 0.75},
      {type = "item", name = "coal", amount_min = 1, amount_max = 4, probability = 0.35},
      {type = "item", name = "iron-ore", amount_min = 1, amount_max = 2, probability = 0.19},
      {type = "item", name = "copper-ore", amount_min = 1, amount_max = 1, probability = 0.125},
      {type = "item", name = "gold-ore", amount_min = 1, amount_max = 1, probability = 0.07},
      {type = "item", name = "tin-ore", amount_min = 1, amount_max = 1, probability = 0.1},
      {type = "item", name = "silver-ore", amount_min = 1, amount_max = 1, probability = 0.09},
      {type = "item", name = "lead-ore", amount_min = 1, amount_max = 1, probability = 0.12},
      {type = "item", name = "chromium-ore", amount_min = 1, amount_max = 1, probability = 0.14},
      {type = "item", name = "tungsten-ore", amount_min = 1, amount_max = 1, probability = 0.07},
      {type = "item", name = "cadmium-ore", amount_min = 1, amount_max = 1, probability = 0.09},
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
      {type = "fluid", name = "light-oil", amount = 15},
      {type = "fluid", name = "petroleum-gas", amount = 20},
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
      {type = "fluid", name = "heavy-oil", amount = 20},
      {type = "fluid", name = "light-oil", amount = 20},
      {type = "fluid", name = "petroleum-gas", amount = 25},
      {type = "fluid", name = dy.."sewage", amount = 30},
      {type = "fluid", name = dy.."acid", amount = 5},
    },
    subgroup = dy.."fluid-recipes",
    order = "advanced-clean-oil-processing"
  },
})