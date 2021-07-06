data:extend({
  {
    type = "recipe",
    name = "oil-to-petroleum",
	category = "oil-processing",
	main_product = "petroleum-gas",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "crude-oil", amount = 100, maximum_temperature = 25},
      },
      results = 
      {
        {type = "fluid", name = "petroleum-gas", amount_min = 25, amount_max = 100, probability = 0.95},
      },
	  main_product = "petroleum-gas",
	  energy_required = 10,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "oil-to-gasoline",
	category = "oil-processing",
	main_product = "gasoline",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "crude-oil", amount = 200, minimum_temperature = 25, maximum_temperature = 60},
      },
      results = 
      {
        {type = "fluid", name = "petroleum-gas", amount_min = 25, amount_max = 100, probability = 0.95},
        {type = "fluid", name = "gasoline", amount_min = 25, amount_max = 100, probability = 0.95},
      },
	  main_product = "gasoline",
	  energy_required = 10,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "oil-to-naphtha",
	category = "oil-processing",
	main_product = "naphtha",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "crude-oil", amount = 300, minimum_temperature = 60, maximum_temperature = 180},
      },
      results = 
      {
        {type = "fluid", name = "petroleum-gas", amount_min = 25, amount_max = 100, probability = 0.95},
        {type = "fluid", name = "gasoline", amount_min = 25, amount_max = 100, probability = 0.95},
        {type = "item", name = "naphtha", amount_min = 25, amount_max = 50, probability = 0.95},
      },
	  main_product = "naphtha",
	  energy_required = 10,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "oil-to-light-oil",
	category = "oil-processing",
	main_product = "light-oil",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "crude-oil", amount = 400, minimum_temperature = 180, maximum_temperature = 235},
      },
      results = 
      {
        {type = "fluid", name = "petroleum-gas", amount_min = 25, amount_max = 100, probability = 0.95},
        {type = "fluid", name = "gasoline", amount_min = 25, amount_max = 100, probability = 0.95},
        {type = "item", name = "naphtha", amount_min = 25, amount_max = 50, probability = 0.95},
        {type = "fluid", name = "light-oil", amount_min = 25, amount_max = 100, probability = 0.95},
      },
	  main_product = "light-oil",
	  energy_required = 10,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "oil-to-heavy-oil",
	category = "oil-processing",
	main_product = "heavy-oil",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "crude-oil", amount = 500, minimum_temperature = 235, maximum_temperature = 300},
      },
      results = 
      {
        {type = "fluid", name = "petroleum-gas", amount_min = 25, amount_max = 100, probability = 0.95},
        {type = "fluid", name = "gasoline", amount_min = 25, amount_max = 100, probability = 0.95},
        {type = "item", name = "naphtha", amount_min = 25, amount_max = 50, probability = 0.95},
        {type = "fluid", name = "light-oil", amount_min = 25, amount_max = 100, probability = 0.95},
        {type = "fluid", name = "heavy-oil", amount_min = 25, amount_max = 100, probability = 0.95},
      },
	  main_product = "heavy-oil",
	  energy_required = 10,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "oil-to-lubricant",
	category = "oil-processing",
	main_product = "lubricant",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "crude-oil", amount = 600, minimum_temperature = 300, maximum_temperature = 350},
      },
      results = 
      {
        {type = "fluid", name = "petroleum-gas", amount_min = 25, amount_max = 100, probability = 0.95},
        {type = "fluid", name = "gasoline", amount_min = 25, amount_max = 100, probability = 0.95},
        {type = "item", name = "naphtha", amount_min = 25, amount_max = 50, probability = 0.95},
        {type = "fluid", name = "light-oil", amount_min = 25, amount_max = 100, probability = 0.95},
        {type = "fluid", name = "heavy-oil", amount_min = 25, amount_max = 100, probability = 0.95},
        {type = "fluid", name = "lubricant", amount_min = 25, amount_max = 100, probability = 0.95},
      },
	  main_product = "lubricant",
	  energy_required = 10,
	  enabled = false,
    },
  },
})