
data:extend({
	-- Slag -- 
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
  },
-- Ores Stage 2
	-- Iron -- 
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
  },
	-- Copper -- 
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
  },
	-- Tin -- 
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
  },
	-- Bronze -- 
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
  },
	-- Steel -- 
  {
    type = "recipe",
    name = "cast-steel-2",
	category = "bloomery",
	main_product = "steel-plate",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore", amount = 10},
        {type = "item", name = "coal", amount = 1},
        {type = "item", name = "canister-oxygen", amount = 2},
      },
      results = 
      {
        {type = "item", name = "steel-plate", amount = 3},
        {type = "item", name = "canister-empty", amount = 2},
      },
	  energy_required = 15,
	  main_product = "steel-plate",
	  enabled = false,
    },
  },
-- Ores Stage 3
	-- Iron -- 
  {
    type = "recipe",
    name = "cast-iron-3a",
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
  },
  {
    type = "recipe",
    name = "cast-iron-3b",
	category = "casting-furnace",
	main_product = "iron-plate",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "molten-iron", amount = 1},
      },
      results = 
      {
        {type = "item", name = "iron-plate", amount = 1},
      },
	  energy_required = 0.25,
	  main_product = "iron-plate",
	  enabled = false,
    },
  },
	-- Copper -- 
  {
    type = "recipe",
    name = "cast-copper-3a",
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
  },
  {
    type = "recipe",
    name = "cast-copper-3b",
	category = "casting-furnace",
	main_product = "copper-plate",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "molten-copper", amount = 1},
      },
      results = 
      {
        {type = "item", name = "copper-plate", amount = 1},
      },
	  energy_required = 0.25,
	  main_product = "copper-plate",
	  enabled = false,
    },
  },
	-- Tin -- 
  {
    type = "recipe",
    name = "cast-tin-3a",
	category = "blast-furnace",
	main_product = "molten-tin",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-ore", amount = 100},
        {type = "fluid", name = "hydrogen", amount = 60},
      },
      results = 
      {
        {type = "fluid", name = "molten-tin", amount_min = 90, amount_max = 100},
        {type = "item", name = "slag", amount_min = 1, amount_max = 5},
      },
	  energy_required = 30,
	  main_product = "molten-tin",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "cast-tin-3b",
	category = "casting-furnace",
	main_product = "tin-plate",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "molten-tin", amount = 1},
      },
      results = 
      {
        {type = "item", name = "tin-plate", amount = 1},
      },
	  energy_required = 0.25,
	  main_product = "tin-plate",
	  enabled = false,
    },
  },
	-- Steel -- 
  {
    type = "recipe",
    name = "cast-steel-3a",
	category = "blast-furnace",
	main_product = "molten-steel",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore", amount = 200},
        {type = "item", name = "coal", amount = 1},
        {type = "fluid", name = "oxygen", amount = 50},
      },
      results = 
      {
        {type = "fluid", name = "molten-steel", amount_min = 75, amount_max = 85},
      },
	  energy_required = 30,
	  main_product = "molten-steel",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "cast-steel-3b",
	category = "casting-furnace",
	main_product = "steel-plate",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "molten-steel", amount = 1},
      },
      results = 
      {
        {type = "item", name = "steel-plate", amount = 1},
      },
	  energy_required = 0.25,
	  main_product = "steel-plate",
	  enabled = false,
    },
  },
	-- Titanium -- 
  {
    type = "recipe",
    name = "cast-titanium-3a",
	category = "blast-furnace",
	main_product = "molten-titanium",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "titanium-ore", amount = 100},
        {type = "item", name = "lignite", amount = 1},
        {type = "item", name = "limestone", amount = 1},
        {type = "fluid", name = "oxygen", amount = 50},
      },
      results = 
      {
        {type = "fluid", name = "molten-titanium", amount_min = 90, amount_max = 100},
        {type = "item", name = "slag", amount_min = 1, amount_max = 5},
      },
	  energy_required = 30,
	  main_product = "molten-titanium",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "cast-titanium-3b",
	category = "casting-furnace",
	main_product = "titanium-plate",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "molten-titanium", amount = 1},
      },
      results = 
      {
        {type = "item", name = "titanium-plate", amount = 1},
      },
	  energy_required = 0.25,
	  main_product = "titanium-plate",
	  enabled = false,
    },
  },
	-- Aluminium -- 
  {
    type = "recipe",
    name = "cast-aluminium-3a",
	category = "blast-furnace",
	main_product = "molten-aluminium",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "aluminium-ore", amount = 100},
        {type = "item", name = "lignite", amount = 1},
        {type = "item", name = "limestone", amount = 1},
        {type = "fluid", name = "oxygen", amount = 50},
      },
      results = 
      {
        {type = "fluid", name = "molten-aluminium", amount_min = 90, amount_max = 100},
        {type = "item", name = "slag", amount_min = 1, amount_max = 5},
      },
	  energy_required = 30,
	  main_product = "molten-aluminium",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "cast-aluminium-3b",
	category = "casting-furnace",
	main_product = "aluminium-plate",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "molten-aluminium", amount = 1},
      },
      results = 
      {
        {type = "item", name = "aluminium-plate", amount = 1},
      },
	  energy_required = 0.25,
	  main_product = "aluminium-plate",
	  enabled = false,
    },
  },
	-- Magnesium -- 
  {
    type = "recipe",
    name = "cast-magnesium-3a",
	category = "blast-furnace",
	main_product = "molten-magnesium",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "magnesium-ore", amount = 100},
        {type = "item", name = "lignite", amount = 1},
        {type = "item", name = "limestone", amount = 1},
        {type = "fluid", name = "oxygen", amount = 50},
      },
      results = 
      {
        {type = "fluid", name = "molten-magnesium", amount_min = 90, amount_max = 100},
        {type = "item", name = "slag", amount_min = 1, amount_max = 5},
      },
	  energy_required = 30,
	  main_product = "molten-magnesium",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "cast-magnesium-3b",
	category = "casting-furnace",
	main_product = "magnesium-plate",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "molten-magnesium", amount = 1},
      },
      results = 
      {
        {type = "item", name = "magnesium-plate", amount = 1},
      },
	  energy_required = 0.25,
	  main_product = "magnesium-plate",
	  enabled = false,
    },
  },
})