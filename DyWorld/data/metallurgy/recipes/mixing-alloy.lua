require "data/prefix"

data:extend(
{
  {
    type = "recipe",
    name = dy.."molten-stainless-steel",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
		icon = dyworld_path_fluid.."base.png",
		tint = Material_Colors.Stainless_Steel,
        scale = 0.75,
        shift = {4, 7}
	  },
	},
    category = dy.."blast-furnace",
    energy_required = 0.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-steel", amount = 46},
      {type = "fluid", name = dy.."methane", amount = 5},
      {type = "item", name = "chromium-ore", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-stainless-steel", amount = 60},
    },
    subgroup = dy.."melting-recipes-alloy",
    order = dy.."molten-stainless-steel",
  },
  {
    type = "recipe",
    name = dy.."molten-bronze",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
		icon = dyworld_path_fluid.."base.png",
		tint = Material_Colors.Bronze,
        scale = 0.75,
        shift = {4, 7}
	  },
	},
    category = dy.."blast-furnace",
    energy_required = 0.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-copper", amount = 15},
      {type = "fluid", name = dy.."molten-tin", amount = 45},
      {type = "item", name = dy.."sand", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-bronze", amount = 60},
    },
    subgroup = dy.."melting-recipes-alloy",
    order = dy.."molten-bronze",
  },
  {
    type = "recipe",
    name = dy.."molten-billon",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
		icon = dyworld_path_fluid.."base.png",
		tint = Material_Colors.Billon,
        scale = 0.75,
        shift = {4, 7}
	  },
	},
    category = dy.."blast-furnace",
    energy_required = 0.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-copper", amount = 30},
      {type = "fluid", name = dy.."molten-silver", amount = 30},
      {type = "item", name = "stone", amount = 2},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-billon", amount = 60},
    },
    subgroup = dy.."melting-recipes-alloy",
    order = dy.."molten-billon",
  },
  {
    type = "recipe",
    name = dy.."molten-copper-tungsten",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
		icon = dyworld_path_fluid.."base.png",
		tint = Material_Colors.Copper_Tungsten,
        scale = 0.75,
        shift = {4, 7}
	  },
	},
    category = dy.."blast-furnace",
    energy_required = 0.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-copper", amount = 20},
      {type = "fluid", name = dy.."molten-tungsten", amount = 40},
      {type = "fluid", name = dy.."methane", amount = 5},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-copper-tungsten", amount = 60},
    },
    subgroup = dy.."melting-recipes-alloy",
    order = dy.."molten-copper-tungsten",
  },
  {
    type = "recipe",
    name = dy.."molten-copper-hydride",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
		icon = dyworld_path_fluid.."base.png",
		tint = Material_Colors.Copper_Hydride,
        scale = 0.75,
        shift = {4, 7}
	  },
	},
    category = dy.."blast-furnace",
    energy_required = 0.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-copper", amount = 25},
      {type = "fluid", name = dy.."hydrogen", amount = 35},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-copper-hydride", amount = 60},
    },
    subgroup = dy.."melting-recipes-alloy",
    order = dy.."molten-copper-hydride",
  },
})