data:extend({
  {
    type = "recipe",
    name = "oil-processing",
	category = "oil-processing",
	main_product = "petroleum-gas",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "crude-oil", amount = 100},
      },
      results = 
      {
        {type = "fluid", name = "heavy-oil", amount_min = 10, amount_max = 20, probability = 0.85},
        {type = "fluid", name = "light-oil", amount_min = 15, amount_max = 30, probability = 0.8},
        {type = "fluid", name = "petroleum-gas", amount_min = 25, amount_max = 50, probability = 0.95},
      },
	  main_product = "petroleum-gas",
	  energy_required = 25,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "plastic-bar",
	category = "chemistry",
	main_product = "plastic-bar",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "light-oil", amount = 35},
        {type = "fluid", name = "petroleum-gas", amount = 10},
      },
      results = 
      {
        {type = "item", name = "plastic-bar", amount_min = 1, amount_max = 10, probability = 0.95},
      },
	  main_product = "plastic-bar",
	  energy_required = 10,
	  enabled = false,
    },
  },
})