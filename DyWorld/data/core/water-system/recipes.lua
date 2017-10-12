require "data/prefix"

data:extend(
{
  {
    type = "recipe",
    name = dy.."water-seperation",
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
      {type = "item", name = "iron-ore", amount_min = 1, amount_max = 2, probability = 0.6},
      {type = "item", name = "copper-ore", amount_min = 1, amount_max = 1, probability = 0.4},
    },
    subgroup = "fluid-recipes",
    order = dy.."sludge-seperation",
  },
  {
    type = "recipe",
    name = dy.."acid-seperation",
	icon = dyworld_path_icon_temp,
    category = "centrifuging",
    energy_required = 5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."acid", amount = 250},
    },
    results=
    {
      {type = "fluid", name = "sulfuric-acid", amount = 100},
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
})