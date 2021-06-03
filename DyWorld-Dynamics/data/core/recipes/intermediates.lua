

	-- Tier 2 --

data:extend({
  {
    type = "recipe",
    name = "resin",
	category = "assembling-tier-2",
	main_product = "resin",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "wood", amount = 1},
      },
      results = 
      {
        {type = "item", name = "resin", amount_min = 3, amount_max = 5},
      },
	  main_product = "resin",
	  energy_required = 2.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "stone-furnace",
	category = "assembling-tier-1",
	main_product = "stone-furnace",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "stone-brick", amount = 10},
      },
      results = 
      {
        {type = "item", name = "stone-furnace", amount = 1},
      },
	  main_product = "stone-furnace",
	  energy_required = 2.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "rubber",
	category = "smelting",
	main_product = "rubber",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "resin", amount = 3},
      },
      results = 
      {
        {type = "item", name = "rubber", amount_min = 3, amount_max = 5},
      },
	  main_product = "rubber",
	  energy_required = 2.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "glass-1",
	category = "smelting",
	main_product = "glass",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "resin", amount = 1},
        {type = "item", name = "quartzite", amount = 3},
      },
      results = 
      {
        {type = "item", name = "glass", amount_min = 5, amount_max = 8},
      },
	  main_product = "glass",
	  energy_required = 1.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "glass-2",
	category = "smelting",
	main_product = "glass",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "sand", amount = 100},
      },
      results = 
      {
        {type = "item", name = "glass", amount_min = 5, amount_max = 8},
      },
	  main_product = "glass",
	  energy_required = 1.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "sand-1",
	category = "grinder",
	main_product = "sand",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "sandstone", amount = 100},
      },
      results = 
      {
        {type = "item", name = "sand", amount_min = 50, amount_max = 180},
      },
	  main_product = "sand",
	  energy_required = 12.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "sand-2",
	category = "grinder",
	main_product = "sand",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "quartzite", amount = 75},
        {type = "item", name = "limestone", amount = 25},
      },
      results = 
      {
        {type = "item", name = "sand", amount_min = 50, amount_max = 180},
      },
	  main_product = "sand",
	  energy_required = 25,
	  enabled = false,
    },
  },
})