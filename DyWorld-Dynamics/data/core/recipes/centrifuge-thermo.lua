data:extend({
  {
    type = "recipe",
    name = "process-spend-uranium-ore",
	category = "thermo-centrifuge",
	main_product = "uranium-235",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "spend-uranium-ore", amount = 10},
        {type = "fluid", name = "water", amount = 50},
      },
      results = 
      {
        {type = "item", name = "uranium-235", amount_min = 8, amount_max = 10},
        {type = "item", name = "uranium-238", amount_min = 1, amount_max = 1, probability = 0.05},
      },
	  energy_required = 20,
	  main_product = "uranium-235",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "process-spend-uranium-235",
	category = "thermo-centrifuge",
	main_product = "uranium-238",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "spend-uranium-235", amount = 10},
        {type = "fluid", name = "water", amount = 50},
      },
      results = 
      {
        {type = "item", name = "uranium-238", amount_min = 8, amount_max = 10},
        {type = "item", name = "uranium-235", amount_min = 1, amount_max = 1, probability = 0.01},
      },
	  energy_required = 30,
	  main_product = "uranium-238",
	  enabled = false,
    },
  },
})