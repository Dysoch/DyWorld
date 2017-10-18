require "data/prefix"

data:extend(
{
  {
    type = "recipe",
    name = dy.."molten-rock",
	icon = dyworld_path_icon_temp,
    category = dy.."blast-furnace",
    energy_required = 5,
	enabled = false,
    ingredients =
    {
      {type = "item", name = "stone", amount = 10},
      {type = "item", name = "coal", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-rock", amount = 125},
    },
    subgroup = dy.."melting-recipes",
    order = dy.."molten-rock",
  },
  {
    type = "recipe",
    name = dy.."molten-iron",
	icon = dyworld_path_icon_temp,
    category = dy.."blast-furnace",
    energy_required = 1,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-rock", amount = 10, minimum_temperature = 1150},
      {type = "item", name = "iron-ore", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-iron", amount = 14},
      {type = "fluid", name = dy.."sludge", amount = 10},
    },
    subgroup = dy.."melting-recipes",
    order = dy.."molten-iron",
  },
})