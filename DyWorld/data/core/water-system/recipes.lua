require "data/prefix"

data:extend(
{
  {
    type = "recipe",
    name = dy.."water-seperation-1",
	icon = dyworld_path_icon_temp,
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
      {type = "fluid", name = dy.."sludge", amount = 7.5},
      {type = "fluid", name = dy.."acid", amount = 5},
      {type = "fluid", name = "crude-oil", amount = 5},
      {type = "fluid", name = dy.."methane", amount = 2.5},
    },
    subgroup = "fluid-recipes",
    order = dy.."water-seperation",
  },
  {
    type = "recipe",
    name = dy.."water-seperation-2",
	icon = dyworld_path_icon_temp,
    category = "centrifuging",
    energy_required = 30,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 250},
    },
    results=
    {
      {type = "fluid", name = dy.."hydrogen", amount = 250},
      {type = "fluid", name = dy.."oxygen", amount = 500},
    },
    subgroup = "fluid-recipes",
    order = dy.."water-seperation",
  },
  {
    type = "recipe",
    name = dy.."sludge-seperation",
	icon = dyworld_path_icon_temp,
    category = "centrifuging",
    energy_required = 5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."sludge", amount = 250},
    },
    results=
    {
      {type = "item", name = "stone", amount_min = 1, amount_max = 4, probability = 1},
      {type = "item", name = "iron-ore", amount_min = 1, amount_max = 2, probability = 0.25},
      {type = "item", name = "copper-ore", amount_min = 1, amount_max = 1, probability = 0.125},
    },
    subgroup = "fluid-recipes",
    order = dy.."sludge-seperation",
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
        scale = 0.5,
        shift = {4, -8}
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
    subgroup = "fluid-recipes",
    order = dy.."acid-seperation",
  },
  {
    type = "recipe",
    name = dy.."fertilizer-seperation",
	icon = dyworld_path_icon_temp,
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
    subgroup = "fluid-recipes",
    order = dy.."fertilizer-seperation",
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
        scale = 0.5,
        shift = {4, -8}
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
    subgroup = "fluid-recipes",
    order = dy.."basic-clean-oil-processing"
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
        scale = 0.5,
        shift = {4, -8}
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
      {type = "fluid", name = dy.."sewage", amount = 15},
      {type = "fluid", name = dy.."acid", amount = 20},
    },
    subgroup = "fluid-recipes",
    order = dy.."advanced-clean-oil-processing"
  },
})