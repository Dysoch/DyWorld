require "data/prefix"

data:extend(
{
  {
    type = "recipe",
    name = dy.."molten-steel",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
	  },
	  {
		icon = dyworld_path_fluid.."base.png",
		tint = Material_Colors.Steel,
        scale = 0.75,
        shift = {4, 7}
	  },
	},
    category = dy.."blast-furnace",
    energy_required = 0.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-iron", amount = 45},
      {type = "item", name = "coal", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-steel", amount = 60},
    },
    subgroup = dy.."melting-recipes-alloy",
    order = dy.."molten-steel",
  },
})