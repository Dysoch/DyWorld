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
    expensive =
    {
      ingredients =
      {
        {type = "fluid", name = "crude-oil", amount = 1000},
      },
      results = 
      {
        {type = "fluid", name = "heavy-oil", amount_min = 10, amount_max = 200, probability = 0.55},
        {type = "fluid", name = "light-oil", amount_min = 15, amount_max = 300, probability = 0.5},
        {type = "fluid", name = "petroleum-gas", amount_min = 25, amount_max = 500, probability = 0.65},
      },
	  main_product = "petroleum-gas",
	  energy_required = 25*5,
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
    expensive =
    {
      ingredients =
      {
        {type = "fluid", name = "light-oil", amount = 35},
        {type = "fluid", name = "petroleum-gas", amount = 10},
      },
      results = 
      {
        {type = "item", name = "plastic-bar", amount_min = 1, amount_max = 5, probability = 0.65},
      },
	  main_product = "plastic-bar",
	  energy_required = 10*5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "chemical-plant",
	category = "assembling-tier-2",
	main_product = "chemical-plant",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 2},
        {type = "item", name = "iron-plate", amount = 5},
        {type = "item", name = "copper-plate", amount = 10},
      },
      results = 
      {
        {type = "item", name = "chemical-plant", amount = 1},
      },
	  main_product = "chemical-plant",
	  energy_required = 10,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 2},
        {type = "item", name = "iron-plate", amount = 5},
        {type = "item", name = "copper-plate", amount = 10},
      },
      results = 
      {
        {type = "item", name = "chemical-plant", amount = 1},
      },
	  main_product = "chemical-plant",
	  energy_required = 10*5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "oil-refinery",
	category = "assembling-tier-2",
	main_product = "oil-refinery",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "stone-brick", amount = 5},
        {type = "item", name = "control-board-1", amount = 2},
        {type = "item", name = "iron-plate", amount = 5},
        {type = "item", name = "steel-plate", amount = 10},
      },
      results = 
      {
        {type = "item", name = "oil-refinery", amount = 1},
      },
	  main_product = "oil-refinery",
	  energy_required = 10,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "stone-brick", amount = 5*4},
        {type = "item", name = "control-board-1", amount = 2},
        {type = "item", name = "iron-plate", amount = 5*4},
        {type = "item", name = "steel-plate", amount = 10*4},
      },
      results = 
      {
        {type = "item", name = "oil-refinery", amount = 1},
      },
	  main_product = "oil-refinery",
	  energy_required = 10*5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "oil-extractor",
	category = "assembling-tier-2",
	main_product = "oil-extractor",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "engine-unit", amount = 2},
        {type = "item", name = "iron-plate", amount = 5},
        {type = "item", name = "steel-plate", amount = 10},
      },
      results = 
      {
        {type = "item", name = "oil-extractor", amount = 1},
      },
	  main_product = "oil-extractor",
	  energy_required = 10,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "engine-unit", amount = 2*5},
        {type = "item", name = "iron-plate", amount = 5*5},
        {type = "item", name = "steel-plate", amount = 10*3},
      },
      results = 
      {
        {type = "item", name = "oil-extractor", amount = 1},
      },
	  main_product = "oil-extractor",
	  energy_required = 10*5,
	  enabled = false,
    },
  },
})