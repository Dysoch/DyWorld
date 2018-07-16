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
    energy_required = 5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 90},
      {type = "item", name = "chalcopyrite", amount = 10},
    },
    results=
    {
      {type = "fluid", name = dy.."sludge", amount = 10},
      {type = "item", name = "copper-ore", amount = 6},
      {type = "item", name = "zinc-ore", amount = 3},
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
    energy_required = 5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 75},
      {type = "item", name = "hematite", amount = 10},
    },
    results=
    {
      {type = "fluid", name = dy.."sludge", amount = 10},
      {type = "item", name = "iron-ore", amount = 5},
      {type = "item", name = "tin-ore", amount = 3},
      {type = "item", name = "nickel-ore", amount = 2},
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
    energy_required = 5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = dy.."methane", amount = 475},
      {type = "item", name = "galena", amount = 10},
    },
    results=
    {
      {type = "fluid", name = dy.."sludge", amount = 10},
      {type = "item", name = "lead-ore", amount = 7},
      {type = "item", name = "silver-ore", amount = 2},
      {type = "item", name = "gold-ore", amount = 1},
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
    energy_required = 5,
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
      {type = "item", name = "tungsten-ore", amount = 3},
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
    energy_required = 5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 375},
      {type = "item", name = "carbolycite", amount = 10},
    },
    results=
    {
      {type = "fluid", name = dy.."sludge", amount = 10},
      {type = "item", name = "coal", amount = 7},
      {type = "item", name = "sulfur", amount = 2},
      {type = "item", name = dy.."sand", amount = 1},
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
    energy_required = 5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 500},
      {type = "item", name = "bauxite", amount = 10},
    },
    results=
    {
      {type = "fluid", name = dy.."sludge", amount = 10},
      {type = "item", name = "stone", amount = 7},
      {type = "item", name = "aluminium-ore", amount = 2},
      {type = "item", name = "gold-ore", amount = 1},
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
    energy_required = 5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = dy.."methane", amount = 2500},
      {type = "item", name = "radicium", amount = 10},
    },
    results=
    {
      {type = "fluid", name = dy.."sludge", amount = 10},
      {type = "item", name = "uranium-ore", amount = 7},
      {type = "item", name = "stone", amount = 2},
      {type = "item", name = "gold-ore", amount = 1},
    },
    subgroup = dy.."metal-0-ore-recipes",
    order = "radicium-seperation",
  },
})