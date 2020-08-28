require "data/prefix"

data:extend(
{
  {
    type = "recipe",
    name = dy.."molten-stainless-copilinvar-tungstate",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
		icon = dyworld_path_fluid.."base.png",
		tint = Material_Colors.Stainless_Copilinvar_Tungstate,
        scale = 0.75,
        shift = {4, 7}
	  },
	},
    category = dy.."blast-furnace",
    energy_required = 0.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-stainless-steel", amount = 20},
      {type = "fluid", name = dy.."molten-copper-tungsten", amount = 20},
      {type = "fluid", name = dy.."molten-elinvar", amount = 20},
      {type = "fluid", name = dy.."methane", amount = 100},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-stainless-copilinvar-tungstate", amount = 60},
    },
    subgroup = dy.."melting-recipes-alloy-4",
    order = dy.."molten-stainless-copilinvar-tungstate",
  },
})