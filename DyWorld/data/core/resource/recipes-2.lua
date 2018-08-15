require "data/prefix"

data:extend(
{
  {
    type = "recipe",
    name = dy.."chalcopyrite-seperation",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
		icon = dyworld_path_icon.."base-ore.png",
		tint = Material_Colors.Copper,
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = "centrifuging",
    energy_required = 2.5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 90},
      {type = "item", name = "chalcopyrite", amount = 10},
    },
    results=
    {
      {type = "fluid", name = dy.."sludge", amount = 10},
      {type = "item", name = "copper-ore", amount_min = 8, amount_max = 13},
      {type = "item", name = "zinc-ore", amount_min = 2, amount_max = 10},
      {type = "item", name = "sulfur", amount = 1},
    },
    subgroup = dy.."metal-0-ore-recipes",
    order = "chalcopyrite-seperation",
  },
  {
    type = "recipe",
    name = dy.."hematite-seperation",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
		icon = dyworld_path_icon.."base-ore.png",
		tint = Material_Colors.Iron,
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = "centrifuging",
    energy_required = 2.5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 75},
      {type = "item", name = "hematite", amount = 10},
    },
    results=
    {
      {type = "fluid", name = dy.."sludge", amount = 10},
      {type = "item", name = "iron-ore", amount_min = 7, amount_max = 13},
      {type = "item", name = "tin-ore", amount_min = 3, amount_max = 8},
      {type = "item", name = "nickel-ore", amount_min = 1, amount_max = 6},
    },
    subgroup = dy.."metal-0-ore-recipes",
    order = "hematite-seperation",
  },
  {
    type = "recipe",
    name = dy.."galena-seperation",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
		icon = dyworld_path_icon.."base-ore.png",
		tint = Material_Colors.Lead,
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = "centrifuging",
    energy_required = 2.5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = dy.."methane", amount = 475},
      {type = "item", name = "galena", amount = 10},
    },
    results=
    {
      {type = "fluid", name = dy.."sludge", amount = 10},
      {type = "item", name = "lead-ore", amount_min = 5, amount_max = 12},
      {type = "item", name = "silver-ore", amount_min = 3, amount_max = 6},
      {type = "item", name = "gold-ore", amount_min = 1, amount_max = 3},
    },
    subgroup = dy.."metal-0-ore-recipes",
    order = "galena-seperation",
  },
  {
    type = "recipe",
    name = dy.."prolycotherium-seperation",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
		icon = dyworld_path_icon.."base-ore.png",
		tint = Material_Colors.Tin,
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = "centrifuging",
    energy_required = 2.5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = "hydrogen", amount = 250},
      {type = "item", name = "prolycotherium", amount = 10},
    },
    results=
    {
      {type = "fluid", name = dy.."sludge", amount = 10},
      {type = "item", name = "chromium-ore", amount = 7},
      {type = "item", name = "tungsten-ore", amount_min = 1, amount_max = 3},
      {type = "item", name = "titanium-ore", amount_min = 1, amount_max = 3},
    },
    subgroup = dy.."metal-0-ore-recipes",
    order = "prolycotherium-seperation",
  },
  {
    type = "recipe",
    name = dy.."carbolycite-seperation",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
		icon = dyworld_path_icon.."base-ore.png",
		tint = Material_Colors.Tungsten,
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = "centrifuging",
    energy_required = 2.5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 375},
      {type = "item", name = "carbolycite", amount = 10},
    },
    results=
    {
      {type = "fluid", name = dy.."sludge", amount = 10},
      {type = "item", name = "coal", amount_min = 5, amount_max = 15},
      {type = "item", name = "sulfur", amount = 1},
      {type = "item", name = dy.."sand", amount_min = 5, amount_max = 75},
    },
    subgroup = dy.."metal-0-ore-recipes",
    order = "carbolycite-seperation",
  },
  {
    type = "recipe",
    name = dy.."bauxite-seperation",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
		icon = dyworld_path_icon.."base-ore.png",
		tint = Material_Colors.Stone,
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = "centrifuging",
    energy_required = 2.5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 500},
      {type = "item", name = "bauxite", amount = 10},
    },
    results=
    {
      {type = "fluid", name = dy.."sludge", amount = 10},
      {type = "item", name = "stone", amount_min = 5, amount_max = 17},
      {type = "item", name = "aluminium-ore", amount_min = 2, amount_max = 7},
      {type = "item", name = "gold-ore", amount_min = 1, amount_max = 3},
      {type = "item", name = "lithium-ore", amount_min = 1, amount_max = 3},
    },
    subgroup = dy.."metal-0-ore-recipes",
    order = "bauxite-seperation",
  },
  {
    type = "recipe",
    name = dy.."radicium-seperation",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
		icon = dyworld_path_icon.."base-ore.png",
		tint = Material_Colors.Uranium,
        scale = 0.75,
        shift = {4, 8}
	  },
	},
    category = "centrifuging",
    energy_required = 2.5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = dy.."methane", amount = 2500},
      {type = "item", name = "radicium", amount = 10},
    },
    results=
    {
      {type = "fluid", name = dy.."sludge", amount = 10},
      {type = "item", name = "uranium-ore", amount_min = 5, amount_max = 12},
      {type = "item", name = "stone", amount_min = 1, amount_max = 8},
      {type = "item", name = "gold-ore", amount_min = 1, amount_max = 3},
    },
    subgroup = dy.."metal-0-ore-recipes",
    order = "radicium-seperation",
  },
})