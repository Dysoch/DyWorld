require "data/prefix"

data:extend(
{
  {
    type = "recipe",
    name = dy.."molten-elinvar",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
	  },
	  {
		icon = dyworld_path_fluid.."base.png",
		tint = Material_Colors.Elinvar,
        scale = 0.75,
        shift = {4, 7}
	  },
	},
    category = dy.."blast-furnace",
    energy_required = 0.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-iron", amount = 20},
      {type = "fluid", name = dy.."molten-chromium", amount = 20},
      {type = "fluid", name = dy.."molten-nickel", amount = 20},
      {type = "fluid", name = "oxygen", amount = 5},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-elinvar", amount = 60},
    },
    subgroup = dy.."melting-recipes-alloy",
    order = dy.."molten-elinvar",
  },
})