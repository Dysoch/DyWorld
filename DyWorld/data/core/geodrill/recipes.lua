require "data/prefix"

data:extend(
{
  {
    type = "recipe",
    name = dy.."ground-mining",
    icons = 
	{
	  {
	    icon = data.raw.item["electric-mining-drill"].icon,
	  },
	  {
	    icon = data.raw.item["stone"].icon,
        scale = 0.25,
        shift = {4, 8}
	  },
	  {
	    icon = data.raw.item[dy.."sand"].icon,
        scale = 0.25,
        shift = {3, 8}
	  },
	  {
	    icon = data.raw.item[dy.."obsidian"].icon,
        scale = 0.25,
        shift = {2, 8}
	  },
	  {
	    icon = data.raw.item[dy.."crystal"].icon,
        scale = 0.25,
        shift = {1, 8}
	  },
	  {
	    icon = data.raw.item[dy.."crystai"].icon,
        scale = 0.25,
        shift = {0, 8}
	  },
	  {
	    icon = data.raw.item[dy.."chitin"].icon,
        scale = 0.25,
        shift = {-1, 8}
	  },
	},
    category = dy.."geodrill",
    energy_required = 60,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 100},
    },
    results=
    {
      {type = "item", name = "stone", amount_min = 1, amount_max = 25, probability = 0.35},
      {type = "item", name = dy.."sand", amount_min = 1, amount_max = 25, probability = 0.15},
      {type = "item", name = dy.."obsidian", amount_min = 1, amount_max = 5, probability = 0.15},
      {type = "item", name = dy.."chitin", amount_min = 1, amount_max = 5, probability = 0.15},
      {type = "item", name = dy.."crystal", amount_min = 1, amount_max = 5, probability = 0.03},
      {type = "item", name = dy.."crystai", amount_min = 1, amount_max = 5, probability = 0.02},
      {type = "item", name = "coal", amount_min = 1, amount_max = 25, probability = 0.09},
      {type = "item", name = "iron-ore", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "copper-ore", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "gold-ore", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "tin-ore", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "silver-ore", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "lead-ore", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "chromium-ore", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "tungsten-ore", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "zinc-ore", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "aluminium-ore", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "nickel-ore", amount_min = 1, amount_max = 5, probability = 0.09},
    },
    subgroup = dy.."fluid-recipes",
    order = "ground-mining",
  },
})

DyWorld_Add_To_Tech("steel-processing", dy.."ground-mining")