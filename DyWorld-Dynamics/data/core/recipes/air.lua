data:extend({
  {
    type = "recipe",
    name = "filter-oxygen",
	category = "air-filter",
	main_product = "oxygen",
    normal =
    {
      ingredients =
      {
      },
      results = 
      {
        {type = "fluid", name = "oxygen", amount_min = 50, amount_max = 500},
      },
	  main_product = "oxygen",
	  energy_required = 15,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
      },
      results = 
      {
        {type = "fluid", name = "oxygen", amount_min = 50, amount_max = 500},
      },
	  main_product = "oxygen",
	  energy_required = 15*5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "filter-hydrogen",
	category = "air-filter",
	main_product = "hydrogen",
    normal =
    {
      ingredients =
      {
      },
      results = 
      {
        {type = "fluid", name = "hydrogen", amount_min = 50, amount_max = 500},
      },
	  main_product = "hydrogen",
	  energy_required = 15,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
      },
      results = 
      {
        {type = "fluid", name = "hydrogen", amount_min = 50, amount_max = 500},
      },
	  main_product = "hydrogen",
	  energy_required = 15*5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "filter-nitrogen",
	category = "air-filter",
	main_product = "nitrogen",
    normal =
    {
      ingredients =
      {
      },
      results = 
      {
        {type = "fluid", name = "nitrogen", amount_min = 50, amount_max = 500},
      },
	  main_product = "nitrogen",
	  energy_required = 15,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
      },
      results = 
      {
        {type = "fluid", name = "nitrogen", amount_min = 50, amount_max = 500},
      },
	  main_product = "nitrogen",
	  energy_required = 15*5,
	  enabled = false,
    },
  },
})