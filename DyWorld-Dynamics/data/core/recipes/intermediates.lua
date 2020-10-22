

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
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "wood", amount = 5},
      },
      results = 
      {
        {type = "item", name = "resin", amount_min = 1, amount_max = 3},
      },
	  main_product = "resin",
	  energy_required = 2.5*5,
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
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "resin", amount = 5},
      },
      results = 
      {
        {type = "item", name = "rubber", amount_min = 1, amount_max = 3},
      },
	  main_product = "rubber",
	  energy_required = 2.5*5,
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
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "resin", amount = 3},
        {type = "item", name = "quartzite", amount = 3*2},
      },
      results = 
      {
        {type = "item", name = "glass", amount_min = 3, amount_max = 5},
      },
	  main_product = "glass",
	  energy_required = 1.5*5,
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
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "sand", amount = 100*5},
      },
      results = 
      {
        {type = "item", name = "glass", amount_min = 3, amount_max = 5},
      },
	  main_product = "glass",
	  energy_required = 1.5*5,
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
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "sandstone", amount = 100*5},
      },
      results = 
      {
        {type = "item", name = "sand", amount_min = 30, amount_max = 150},
      },
	  main_product = "sand",
	  energy_required = 12.5*5,
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
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "quartzite", amount = 75*5},
        {type = "item", name = "limestone", amount = 25*5},
      },
      results = 
      {
        {type = "item", name = "sand", amount_min = 30, amount_max = 150},
      },
	  main_product = "sand",
	  energy_required = 25*5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "engine-unit",
	category = "assembling-tier-2",
	main_product = "engine-unit",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 3},
        {type = "item", name = "rubber", amount = 1},
        {type = "item", name = "control-board-1", amount = 1},
      },
      results = 
      {
        {type = "item", name = "engine-unit", amount = 1},
      },
	  main_product = "engine-unit",
	  energy_required = 2.5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 3*5},
        {type = "item", name = "rubber", amount = 1*3},
        {type = "item", name = "control-board-1", amount = 1*4},
      },
      results = 
      {
        {type = "item", name = "engine-unit", amount = 1},
      },
	  main_product = "engine-unit",
	  energy_required = 2.5*5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "flying-robot-frame",
	category = "assembling-tier-2",
	main_product = "flying-robot-frame",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "heavy-oil", amount = 15},
        {type = "item", name = "steel-plate", amount = 3},
        {type = "item", name = "engine-unit", amount = 1},
        {type = "item", name = "control-board-1", amount = 2},
      },
      results = 
      {
        {type = "item", name = "flying-robot-frame", amount = 1},
      },
	  main_product = "flying-robot-frame",
	  energy_required = 2.5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "fluid", name = "heavy-oil", amount = 15*2},
        {type = "item", name = "steel-plate", amount = 3*5},
        {type = "item", name = "engine-unit", amount = 1*3},
        {type = "item", name = "control-board-1", amount = 2*3},
      },
      results = 
      {
        {type = "item", name = "flying-robot-frame", amount = 1},
      },
	  main_product = "flying-robot-frame",
	  energy_required = 2.5*5,
	  enabled = false,
    },
  },
})