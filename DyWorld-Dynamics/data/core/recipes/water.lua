data:extend({
  {
    type = "recipe",
    name = "water-centrifuge",
	category = "centrifuging",
	main_product = "water",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "water", amount = 500},
      },
      results = 
      {
        {type = "fluid", name = "water", amount_min = 1, amount_max = 50, probability = 0.01},
        {type = "fluid", name = "oxygen", amount_min = 50, amount_max = 500},
        {type = "fluid", name = "hydrogen", amount_min = 100, amount_max = 500},
        {type = "fluid", name = "nitrogen", amount_min = 50, amount_max = 500},
      },
	  main_product = "water",
	  energy_required = 15,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "water-centrifuge-2",
	category = "centrifuging",
	main_product = "bottle-dirty-water",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "water", amount = 500},
      },
      results = 
      {
        {type = "item", name = "bottle-dirty-water", amount_min = 1, amount_max = 10, probability = 1},
        {type = "item", name = "bottle-clean-water", amount_min = 1, amount_max = 2, probability = 0.1},
        {type = "item", name = "bottle-mineral-water", amount_min = 1, amount_max = 1, probability = 0.01},
      },
	  main_product = "bottle-dirty-water",
	  energy_required = 15,
	  enabled = false,
    },
  },
})