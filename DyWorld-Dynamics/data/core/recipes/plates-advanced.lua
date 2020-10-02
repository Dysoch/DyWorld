
data:extend({
  {
    type = "recipe",
    name = "slag-processing",
	category = "bloomery",
	main_product = "slag",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "slag", amount = 100},
        {type = "item", name = "canister-oxygen", amount = 1},
        {type = "item", name = "lignite", amount = 1},
      },
      results = 
      {
        {type = "item", name = "canister-empty", amount = 1},
        {type = "item", name = "slag", amount_min = 1, amount_max = 5, probability = 0.1},
        {type = "item", name = "iron-ore-impure", amount_min = 2, amount_max = 6, probability = 0.15},
        {type = "item", name = "iron-ore", amount_min = 1, amount_max = 3, probability = 0.075},
        {type = "item", name = "tin-ore-impure", amount_min = 2, amount_max = 6, probability = 0.15},
        {type = "item", name = "tin-ore", amount_min = 1, amount_max = 3, probability = 0.075},
        {type = "item", name = "copper-ore-impure", amount_min = 2, amount_max = 6, probability = 0.15},
        {type = "item", name = "copper-ore", amount_min = 1, amount_max = 3, probability = 0.075},
        {type = "item", name = "coal", amount_min = 1, amount_max = 5, probability = 0.15},
        {type = "item", name = "lignite", amount_min = 1, amount_max = 10, probability = 0.25},
        {type = "item", name = "limestone", amount_min = 1, amount_max = 10, probability = 0.05},
        {type = "item", name = "granite", amount_min = 1, amount_max = 10, probability = 0.05},
        {type = "item", name = "sandstone", amount_min = 1, amount_max = 10, probability = 0.05},
        {type = "item", name = "quartzite", amount_min = 1, amount_max = 10, probability = 0.05},
      },
	  energy_required = 12,
	  main_product = "slag",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "slag", amount = 100*3},
        {type = "item", name = "canister-oxygen", amount = 10},
        {type = "item", name = "lignite", amount = 1*6},
      },
      results = 
      {
        {type = "item", name = "canister-empty", amount = 10},
        {type = "item", name = "slag", amount_min = 1, amount_max = 5, probability = 0.1},
        {type = "item", name = "iron-ore-impure", amount_min = 2, amount_max = 6, probability = 0.15},
        {type = "item", name = "iron-ore", amount_min = 1, amount_max = 3, probability = 0.075},
        {type = "item", name = "tin-ore-impure", amount_min = 2, amount_max = 6, probability = 0.15},
        {type = "item", name = "tin-ore", amount_min = 1, amount_max = 3, probability = 0.075},
        {type = "item", name = "copper-ore-impure", amount_min = 2, amount_max = 6, probability = 0.15},
        {type = "item", name = "copper-ore", amount_min = 1, amount_max = 3, probability = 0.075},
        {type = "item", name = "coal", amount_min = 1, amount_max = 5, probability = 0.15},
        {type = "item", name = "lignite", amount_min = 1, amount_max = 10, probability = 0.25},
        {type = "item", name = "limestone", amount_min = 1, amount_max = 10, probability = 0.05},
        {type = "item", name = "granite", amount_min = 1, amount_max = 10, probability = 0.05},
        {type = "item", name = "sandstone", amount_min = 1, amount_max = 10, probability = 0.05},
        {type = "item", name = "quartzite", amount_min = 1, amount_max = 10, probability = 0.05},
      },
	  energy_required = 12*5,
	  main_product = "slag",
	  enabled = false,
    },
  },
-- Ores Stage 2
  {
    type = "recipe",
    name = "cast-iron-2",
	category = "bloomery",
	main_product = "iron-plate",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore", amount = 50},
        {type = "item", name = "charcoal", amount = 1},
        {type = "item", name = "canister-oxygen", amount = 2},
      },
      results = 
      {
        {type = "item", name = "iron-plate", amount = 35},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "slag", amount_min = 10, amount_max = 20},
      },
	  energy_required = 30,
	  main_product = "iron-plate",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore", amount = 50*2},
        {type = "item", name = "charcoal", amount = 5},
        {type = "item", name = "canister-oxygen", amount = 10},
      },
      results = 
      {
        {type = "item", name = "iron-plate", amount = 35},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "slag", amount_min = 10, amount_max = 20},
      },
	  energy_required = 30*5,
	  main_product = "iron-plate",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "cast-copper-2",
	category = "bloomery",
	main_product = "copper-plate",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore", amount = 50},
        {type = "item", name = "charcoal", amount = 1},
        {type = "item", name = "canister-oxygen", amount = 2},
      },
      results = 
      {
        {type = "item", name = "copper-plate", amount = 35},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "slag", amount_min = 10, amount_max = 20},
      },
	  energy_required = 30,
	  main_product = "copper-plate",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore", amount = 50*2},
        {type = "item", name = "charcoal", amount = 5},
        {type = "item", name = "canister-oxygen", amount = 10},
      },
      results = 
      {
        {type = "item", name = "copper-plate", amount = 35},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "slag", amount_min = 10, amount_max = 20},
      },
	  energy_required = 30*5,
	  main_product = "copper-plate",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "cast-tin-2",
	category = "bloomery",
	main_product = "tin-plate",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-ore", amount = 50},
        {type = "item", name = "charcoal", amount = 1},
        {type = "item", name = "canister-oxygen", amount = 2},
      },
      results = 
      {
        {type = "item", name = "tin-plate", amount = 35},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "slag", amount_min = 10, amount_max = 20},
      },
	  energy_required = 30,
	  main_product = "tin-plate",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "tin-ore", amount = 50*2},
        {type = "item", name = "charcoal", amount = 5},
        {type = "item", name = "canister-oxygen", amount = 10},
      },
      results = 
      {
        {type = "item", name = "tin-plate", amount = 35},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "slag", amount_min = 10, amount_max = 20},
      },
	  energy_required = 30*5,
	  main_product = "tin-plate",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "cast-bronze-2",
	category = "bloomery",
	main_product = "bronze-plate",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-ore", amount = 10},
        {type = "item", name = "copper-ore", amount = 70},
        {type = "item", name = "canister-water", amount = 2},
      },
      results = 
      {
        {type = "item", name = "bronze-plate", amount = 70},
        {type = "item", name = "canister-empty", amount = 2},
      },
	  energy_required = 30,
	  main_product = "bronze-plate",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "tin-ore", amount = 10},
        {type = "item", name = "copper-ore", amount = 70},
        {type = "item", name = "canister-water", amount = 10},
      },
      results = 
      {
        {type = "item", name = "bronze-plate", amount = 50},
        {type = "item", name = "canister-empty", amount = 10},
      },
	  energy_required = 30*5,
	  main_product = "bronze-plate",
	  enabled = false,
    },
  },
-- Ores Stage 3
  {
    type = "recipe",
    name = "cast-iron-3",
	category = "blast-furnace",
	main_product = "molten-iron",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore", amount = 100},
        {type = "item", name = "lignite", amount = 1},
        {type = "item", name = "limestone", amount = 1},
        {type = "fluid", name = "oxygen", amount = 50},
      },
      results = 
      {
        {type = "fluid", name = "molten-iron", amount_min = 90, amount_max = 100},
        {type = "item", name = "slag", amount_min = 1, amount_max = 5},
      },
	  energy_required = 30,
	  main_product = "molten-iron",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore", amount = 100*2},
        {type = "item", name = "lignite", amount = 10},
        {type = "item", name = "limestone", amount = 10},
        {type = "fluid", name = "oxygen", amount = 50*3},
      },
      results = 
      {
        {type = "fluid", name = "molten-iron", amount_min = 90, amount_max = 100},
        {type = "item", name = "slag", amount_min = 1, amount_max = 5},
      },
	  energy_required = 30*5,
	  main_product = "molten-iron",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "cast-copper-3",
	category = "blast-furnace",
	main_product = "molten-copper",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore", amount = 100},
        {type = "item", name = "sandstone", amount = 1},
        {type = "fluid", name = "nitrogen", amount = 75},
      },
      results = 
      {
        {type = "fluid", name = "molten-copper", amount_min = 90, amount_max = 100},
        {type = "item", name = "slag", amount_min = 1, amount_max = 5},
      },
	  energy_required = 30,
	  main_product = "molten-copper",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore", amount = 100*2},
        {type = "item", name = "sandstone", amount = 10},
        {type = "fluid", name = "nitrogen", amount = 50*3},
      },
      results = 
      {
        {type = "fluid", name = "molten-copper", amount_min = 90, amount_max = 100},
        {type = "item", name = "slag", amount_min = 1, amount_max = 5},
      },
	  energy_required = 30*5,
	  main_product = "molten-copper",
	  enabled = false,
    },
  },
})