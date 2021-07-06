data:extend({
  {
    type = "recipe",
    name = "dy-wood-0",
	category = "centrifuging",
	main_product = "wood-sapling",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "wood", amount = 10},
      },
      results = 
      {
        {type = "item", name = "wood-sapling", amount_min = 1, amount_max = 2, probability = 0.05},
      },
	  main_product = "wood-sapling",
	  energy_required = 30,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "dy-wood-1",
	category = "farming",
	main_product = "wood",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "wood-sapling", amount = 1},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "soil", amount = 15},
      },
      results = 
      {
        {type = "item", name = "wood", amount_min = 5, amount_max = 25},
        {type = "item", name = "bio-waste", amount_min = 1, amount_max = 50, probability = 0.3},
        {type = "item", name = "wood-sapling", amount_min = 1, amount_max = 2, probability = 0.5},
        {type = "item", name = "wood-sulfur-sapling", amount_min = 1, amount_max = 2, probability = 0.35},
        {type = "item", name = "wood-dead-sapling", amount_min = 1, amount_max = 2, probability = 0.15},
      },
	  main_product = "wood",
	  energy_required = 180,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "dy-wood-2",
	category = "farming",
	main_product = "wood-sulfur",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "wood-sulfur-sapling", amount = 1},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "soil", amount = 15},
      },
      results = 
      {
        {type = "item", name = "wood-sulfur", amount_min = 5, amount_max = 25},
        {type = "item", name = "bio-waste", amount_min = 1, amount_max = 50, probability = 0.3},
        {type = "item", name = "wood-sapling", amount_min = 1, amount_max = 2, probability = 0.15},
        {type = "item", name = "wood-sulfur-sapling", amount_min = 1, amount_max = 2, probability = 0.25},
        {type = "item", name = "wood-dead-sapling", amount_min = 1, amount_max = 2, probability = 0.35},
      },
	  main_product = "wood-sulfur",
	  energy_required = 300,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "dy-wood-3",
	category = "farming",
	main_product = "wood-dead",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "wood-dead-sapling", amount = 1},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "soil", amount = 15},
      },
      results = 
      {
        {type = "item", name = "wood-dead", amount_min = 5, amount_max = 25},
        {type = "item", name = "bio-waste", amount_min = 1, amount_max = 50, probability = 0.3},
        {type = "item", name = "wood-sapling", amount_min = 1, amount_max = 2, probability = 0.5},
        {type = "item", name = "wood-sulfur-sapling", amount_min = 1, amount_max = 2, probability = 0.35},
        {type = "item", name = "wood-dead-sapling", amount_min = 1, amount_max = 2, probability = 0.25},
      },
	  main_product = "wood-dead",
	  energy_required = 120,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "dy-wood-4",
	category = "smelting",
	main_product = "bio-waste",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "wood-dead", amount = 10},
      },
      results = 
      {
        {type = "item", name = "bio-waste", amount_min = 10, amount_max = 50, probability = 0.63},
      },
	  main_product = "bio-waste",
	  energy_required = 5,
	  enabled = false,
    },
  },
})