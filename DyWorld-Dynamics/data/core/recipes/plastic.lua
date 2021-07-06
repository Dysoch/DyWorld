data:extend({
  {
    type = "recipe",
    name = "polycarbonate",
	category = "centrifuging",
	main_product = "polycarbonate",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "naphtha", amount = 25},
        {type = "item", name = "carbon", amount = 10},
        {type = "fluid", name = "steam", amount = 100},
      },
      results = 
      {
        {type = "item", name = "polycarbonate", amount_min = 25, amount_max = 35},
        {type = "fluid", name = "water", amount_min = 10, amount_max = 30},
      },
	  energy_required = 10,
	  main_product = "polycarbonate",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "polyurethane",
	category = "centrifuging",
	main_product = "polyurethane",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "naphtha", amount = 50},
        {type = "item", name = "carbon", amount = 10},
        {type = "fluid", name = "natural-gas", amount = 50},
        {type = "fluid", name = "nitrogen", amount = 50},
      },
      results = 
      {
        {type = "item", name = "polyurethane", amount_min = 25, amount_max = 35, probability = 1},
      },
	  energy_required = 10,
	  main_product = "polyurethane",
	  enabled = false,
    },
  },
})