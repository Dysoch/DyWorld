data:extend({
	-- Tier 1 --
  {
    type = "recipe",
    name = "ore-purify-copper",
	category = "centrifuging",
	main_product = "copper-ore",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore-impure", amount = 10},
        {type = "item", name = "canister-nitrogen", amount = 2},
      },
      results = 
      {
        {type = "fluid", name = "nitrogen", amount = 70},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "copper-ore", amount_min = 6, amount_max = 10},
      },
	  energy_required = 5,
	  main_product = "copper-ore",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore-impure", amount = 10},
        {type = "item", name = "canister-nitrogen", amount = 10},
      },
      results = 
      {
        {type = "fluid", name = "nitrogen", amount = 50},
        {type = "item", name = "canister-empty", amount = 10},
        {type = "item", name = "copper-ore", amount_min = 3, amount_max = 5},
      },
	  energy_required = 5*5,
	  main_product = "copper-ore",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "ore-purify-iron",
	category = "centrifuging",
	main_product = "iron-ore",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore-impure", amount = 10},
        {type = "item", name = "canister-water", amount = 2},
      },
      results = 
      {
        {type = "fluid", name = "oxygen", amount = 70},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "iron-ore", amount_min = 6, amount_max = 10},
      },
	  energy_required = 5,
	  main_product = "iron-ore",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore-impure", amount = 10},
        {type = "item", name = "canister-water", amount = 10},
      },
      results = 
      {
        {type = "fluid", name = "oxygen", amount = 50},
        {type = "item", name = "canister-empty", amount = 10},
        {type = "item", name = "iron-ore", amount_min = 3, amount_max = 5},
      },
	  energy_required = 5*5,
	  main_product = "iron-ore",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "ore-purify-tin",
	category = "centrifuging",
	main_product = "tin-ore",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-ore-impure", amount = 10},
        {type = "item", name = "canister-hydrogen", amount = 2},
      },
      results = 
      {
        {type = "fluid", name = "hydrogen", amount = 70},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "tin-ore", amount_min = 6, amount_max = 10},
      },
	  energy_required = 5,
	  main_product = "tin-ore",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "tin-ore-impure", amount = 10},
        {type = "item", name = "canister-hydrogen", amount = 10},
      },
      results = 
      {
        {type = "fluid", name = "hydrogen", amount = 50},
        {type = "item", name = "canister-empty", amount = 10},
        {type = "item", name = "tin-ore", amount_min = 3, amount_max = 5},
      },
	  energy_required = 5*5,
	  main_product = "tin-ore",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "ore-purify-titanium",
	category = "centrifuging",
	main_product = "titanium-ore",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "titanium-ore-impure", amount = 10},
        {type = "item", name = "canister-hydrogen", amount = 2},
      },
      results = 
      {
        {type = "fluid", name = "hydrogen", amount = 70},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "titanium-ore", amount_min = 6, amount_max = 10},
      },
	  energy_required = 5,
	  main_product = "titanium-ore",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "titanium-ore-impure", amount = 10},
        {type = "item", name = "canister-hydrogen", amount = 10},
      },
      results = 
      {
        {type = "fluid", name = "hydrogen", amount = 50},
        {type = "item", name = "canister-empty", amount = 10},
        {type = "item", name = "titanium-ore", amount_min = 3, amount_max = 5},
      },
	  energy_required = 5*5,
	  main_product = "titanium-ore",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "ore-purify-aluminium",
	category = "centrifuging",
	main_product = "aluminium-ore",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "aluminium-ore-impure", amount = 10},
        {type = "item", name = "canister-hydrogen", amount = 2},
      },
      results = 
      {
        {type = "fluid", name = "hydrogen", amount = 70},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "aluminium-ore", amount_min = 6, amount_max = 10},
      },
	  energy_required = 5,
	  main_product = "aluminium-ore",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "aluminium-ore-impure", amount = 10},
        {type = "item", name = "canister-hydrogen", amount = 10},
      },
      results = 
      {
        {type = "fluid", name = "hydrogen", amount = 50},
        {type = "item", name = "canister-empty", amount = 10},
        {type = "item", name = "aluminium-ore", amount_min = 3, amount_max = 5},
      },
	  energy_required = 5*5,
	  main_product = "aluminium-ore",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "ore-purify-magnesium",
	category = "centrifuging",
	main_product = "magnesium-ore",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "magnesium-ore-impure", amount = 10},
        {type = "item", name = "canister-nitrogen", amount = 2},
      },
      results = 
      {
        {type = "fluid", name = "nitrogen", amount = 70},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "magnesium-ore", amount_min = 6, amount_max = 10},
      },
	  energy_required = 5,
	  main_product = "magnesium-ore",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "magnesium-ore-impure", amount = 10},
        {type = "item", name = "canister-nitrogen", amount = 10},
      },
      results = 
      {
        {type = "fluid", name = "nitrogen", amount = 50},
        {type = "item", name = "canister-empty", amount = 10},
        {type = "item", name = "magnesium-ore", amount_min = 3, amount_max = 5},
      },
	  energy_required = 5*5,
	  main_product = "magnesium-ore",
	  enabled = false,
    },
  },
	-- Tier 2 --
  {
    type = "recipe",
    name = "ore-purify-copper-2",
	category = "centrifuging",
	main_product = "copper-ore",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore-impure", amount = 100},
        {type = "item", name = "canister-nitrogen", amount = 2},
      },
      results = 
      {
        {type = "fluid", name = "nitrogen", amount = 70},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "copper-ore", amount_min = 60, amount_max = 100},
      },
	  energy_required = 5,
	  main_product = "copper-ore",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore-impure", amount = 100},
        {type = "item", name = "canister-nitrogen", amount = 10},
      },
      results = 
      {
        {type = "fluid", name = "nitrogen", amount = 50},
        {type = "item", name = "canister-empty", amount = 10},
        {type = "item", name = "copper-ore", amount_min = 30, amount_max = 50},
      },
	  energy_required = 5*5,
	  main_product = "copper-ore",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "ore-purify-iron-2",
	category = "centrifuging",
	main_product = "iron-ore",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore-impure", amount = 100},
        {type = "item", name = "canister-water", amount = 2},
      },
      results = 
      {
        {type = "fluid", name = "oxygen", amount = 70},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "iron-ore", amount_min = 60, amount_max = 100},
      },
	  energy_required = 5,
	  main_product = "iron-ore",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore-impure", amount = 100},
        {type = "item", name = "canister-water", amount = 10},
      },
      results = 
      {
        {type = "fluid", name = "oxygen", amount = 50},
        {type = "item", name = "canister-empty", amount = 10},
        {type = "item", name = "iron-ore", amount_min = 30, amount_max = 50},
      },
	  energy_required = 5*5,
	  main_product = "iron-ore",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "ore-purify-tin-2",
	category = "centrifuging",
	main_product = "tin-ore",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-ore-impure", amount = 100},
        {type = "item", name = "canister-hydrogen", amount = 2},
      },
      results = 
      {
        {type = "fluid", name = "hydrogen", amount = 70},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "tin-ore", amount_min = 60, amount_max = 100},
      },
	  energy_required = 5,
	  main_product = "tin-ore",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "tin-ore-impure", amount = 100},
        {type = "item", name = "canister-hydrogen", amount = 10},
      },
      results = 
      {
        {type = "fluid", name = "hydrogen", amount = 50},
        {type = "item", name = "canister-empty", amount = 10},
        {type = "item", name = "tin-ore", amount_min = 30, amount_max = 50},
      },
	  energy_required = 5*5,
	  main_product = "tin-ore",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "ore-purify-titanium-2",
	category = "centrifuging",
	main_product = "titanium-ore",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "titanium-ore-impure", amount = 100},
        {type = "item", name = "canister-hydrogen", amount = 2},
      },
      results = 
      {
        {type = "fluid", name = "hydrogen", amount = 70},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "titanium-ore", amount_min = 60, amount_max = 100},
      },
	  energy_required = 5,
	  main_product = "titanium-ore",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "titanium-ore-impure", amount = 10},
        {type = "item", name = "canister-hydrogen", amount = 10},
      },
      results = 
      {
        {type = "fluid", name = "hydrogen", amount = 50},
        {type = "item", name = "canister-empty", amount = 10},
        {type = "item", name = "titanium-ore", amount_min = 30, amount_max = 50},
      },
	  energy_required = 5*5,
	  main_product = "titanium-ore",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "ore-purify-aluminium-2",
	category = "centrifuging",
	main_product = "aluminium-ore",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "aluminium-ore-impure", amount = 100},
        {type = "item", name = "canister-hydrogen", amount = 2},
      },
      results = 
      {
        {type = "fluid", name = "hydrogen", amount = 70},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "aluminium-ore", amount_min = 60, amount_max = 100},
      },
	  energy_required = 5,
	  main_product = "aluminium-ore",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "aluminium-ore-impure", amount = 10},
        {type = "item", name = "canister-hydrogen", amount = 10},
      },
      results = 
      {
        {type = "fluid", name = "hydrogen", amount = 50},
        {type = "item", name = "canister-empty", amount = 10},
        {type = "item", name = "aluminium-ore", amount_min = 30, amount_max = 50},
      },
	  energy_required = 5*5,
	  main_product = "aluminium-ore",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "ore-purify-magnesium-2",
	category = "centrifuging",
	main_product = "magnesium-ore",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "magnesium-ore-impure", amount = 100},
        {type = "item", name = "canister-nitrogen", amount = 2},
      },
      results = 
      {
        {type = "fluid", name = "nitrogen", amount = 70},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "magnesium-ore", amount_min = 60, amount_max = 100},
      },
	  energy_required = 5,
	  main_product = "magnesium-ore",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "magnesium-ore-impure", amount = 100},
        {type = "item", name = "canister-nitrogen", amount = 10},
      },
      results = 
      {
        {type = "fluid", name = "nitrogen", amount = 50},
        {type = "item", name = "canister-empty", amount = 10},
        {type = "item", name = "magnesium-ore", amount_min = 30, amount_max = 50},
      },
	  energy_required = 5*5,
	  main_product = "magnesium-ore",
	  enabled = false,
    },
  },	
    -- Tier 3 --
  {
    type = "recipe",
    name = "ore-purify-copper-3",
	category = "centrifuging",
	main_product = "copper-ore",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore-impure", amount = 1000},
        {type = "item", name = "canister-nitrogen", amount = 2},
      },
      results = 
      {
        {type = "fluid", name = "nitrogen", amount = 70},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "copper-ore", amount_min = 600, amount_max = 1000},
      },
	  energy_required = 5,
	  main_product = "copper-ore",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore-impure", amount = 1000},
        {type = "item", name = "canister-nitrogen", amount = 10},
      },
      results = 
      {
        {type = "fluid", name = "nitrogen", amount = 50},
        {type = "item", name = "canister-empty", amount = 10},
        {type = "item", name = "copper-ore", amount_min = 300, amount_max = 500},
      },
	  energy_required = 5*5,
	  main_product = "copper-ore",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "ore-purify-iron-3",
	category = "centrifuging",
	main_product = "iron-ore",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore-impure", amount = 1000},
        {type = "item", name = "canister-water", amount = 2},
      },
      results = 
      {
        {type = "fluid", name = "oxygen", amount = 70},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "iron-ore", amount_min = 600, amount_max = 1000},
      },
	  energy_required = 5,
	  main_product = "iron-ore",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore-impure", amount = 1000},
        {type = "item", name = "canister-water", amount = 10},
      },
      results = 
      {
        {type = "fluid", name = "oxygen", amount = 50},
        {type = "item", name = "canister-empty", amount = 10},
        {type = "item", name = "iron-ore", amount_min = 300, amount_max = 500},
      },
	  energy_required = 5*5,
	  main_product = "iron-ore",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "ore-purify-tin-3",
	category = "centrifuging",
	main_product = "tin-ore",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-ore-impure", amount = 1000},
        {type = "item", name = "canister-hydrogen", amount = 2},
      },
      results = 
      {
        {type = "fluid", name = "hydrogen", amount = 70},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "tin-ore", amount_min = 600, amount_max = 1000},
      },
	  energy_required = 5,
	  main_product = "tin-ore",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "tin-ore-impure", amount = 1000},
        {type = "item", name = "canister-hydrogen", amount = 10},
      },
      results = 
      {
        {type = "fluid", name = "hydrogen", amount = 50},
        {type = "item", name = "canister-empty", amount = 10},
        {type = "item", name = "tin-ore", amount_min = 300, amount_max = 500},
      },
	  energy_required = 5*5,
	  main_product = "tin-ore",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "ore-purify-titanium-3",
	category = "centrifuging",
	main_product = "titanium-ore",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "titanium-ore-impure", amount = 1000},
        {type = "item", name = "canister-hydrogen", amount = 2},
      },
      results = 
      {
        {type = "fluid", name = "hydrogen", amount = 70},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "titanium-ore", amount_min = 600, amount_max = 1000},
      },
	  energy_required = 5,
	  main_product = "titanium-ore",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "titanium-ore-impure", amount = 100},
        {type = "item", name = "canister-hydrogen", amount = 10},
      },
      results = 
      {
        {type = "fluid", name = "hydrogen", amount = 50},
        {type = "item", name = "canister-empty", amount = 10},
        {type = "item", name = "titanium-ore", amount_min = 300, amount_max = 500},
      },
	  energy_required = 5*5,
	  main_product = "titanium-ore",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "ore-purify-aluminium-3",
	category = "centrifuging",
	main_product = "aluminium-ore",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "aluminium-ore-impure", amount = 1000},
        {type = "item", name = "canister-hydrogen", amount = 2},
      },
      results = 
      {
        {type = "fluid", name = "hydrogen", amount = 70},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "aluminium-ore", amount_min = 600, amount_max = 1000},
      },
	  energy_required = 5,
	  main_product = "aluminium-ore",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "aluminium-ore-impure", amount = 100},
        {type = "item", name = "canister-hydrogen", amount = 10},
      },
      results = 
      {
        {type = "fluid", name = "hydrogen", amount = 50},
        {type = "item", name = "canister-empty", amount = 10},
        {type = "item", name = "aluminium-ore", amount_min = 300, amount_max = 500},
      },
	  energy_required = 5*5,
	  main_product = "aluminium-ore",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "ore-purify-magnesium-3",
	category = "centrifuging",
	main_product = "magnesium-ore",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "magnesium-ore-impure", amount = 1000},
        {type = "item", name = "canister-nitrogen", amount = 2},
      },
      results = 
      {
        {type = "fluid", name = "nitrogen", amount = 70},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "magnesium-ore", amount_min = 600, amount_max = 1000},
      },
	  energy_required = 5,
	  main_product = "magnesium-ore",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "magnesium-ore-impure", amount = 1000},
        {type = "item", name = "canister-nitrogen", amount = 10},
      },
      results = 
      {
        {type = "fluid", name = "nitrogen", amount = 50},
        {type = "item", name = "canister-empty", amount = 10},
        {type = "item", name = "magnesium-ore", amount_min = 300, amount_max = 500},
      },
	  energy_required = 5*5,
	  main_product = "magnesium-ore",
	  enabled = false,
    },
  },	
})