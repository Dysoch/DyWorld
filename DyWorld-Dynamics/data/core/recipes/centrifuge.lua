data:extend({
  {
    type = "recipe",
    name = "ilmenite",
	category = "centrifuging",
	main_product = "ilmenite",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "granite", amount = 10},
        {type = "fluid", name = "water", amount = 50},
      },
      results = 
      {
        {type = "item", name = "ilmenite", amount_min = 5, amount_max = 8, probability = 0.85},
        {type = "item", name = "biotite", amount_min = 3, amount_max = 8, probability = 0.15},
      },
	  energy_required = 15,
	  main_product = "ilmenite",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "granite", amount = 10 * ER_Mod},
        {type = "fluid", name = "water", amount = 50 * ER_Mod},
      },
      results = 
      {
        {type = "item", name = "ilmenite", amount_min = 5, amount_max = 8, probability = 0.85},
        {type = "item", name = "biotite", amount_min = 3, amount_max = 8, probability = 0.15},
      },
	  energy_required = 15 * ER_Mod,
	  main_product = "ilmenite",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "biotite",
	category = "centrifuging",
	main_product = "biotite",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "granite", amount = 15},
        {type = "fluid", name = "water", amount = 50},
      },
      results = 
      {
        {type = "item", name = "ilmenite", amount_min = 3, amount_max = 8, probability = 0.15},
        {type = "item", name = "biotite", amount_min = 5, amount_max = 8, probability = 0.85},
      },
	  energy_required = 15,
	  main_product = "biotite",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "granite", amount = 15 * ER_Mod},
        {type = "fluid", name = "water", amount = 50 * ER_Mod},
      },
      results = 
      {
        {type = "item", name = "ilmenite", amount_min = 3, amount_max = 8, probability = 0.15},
        {type = "item", name = "biotite", amount_min = 5, amount_max = 8, probability = 0.85},
      },
	  energy_required = 15 * ER_Mod,
	  main_product = "biotite",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "titanium-ore",
	category = "centrifuging",
	main_product = "titanium-ore-impure",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "ilmenite", amount = 15},
        {type = "fluid", name = "water", amount = 50},
      },
      results = 
      {
        {type = "item", name = "titanium-ore-impure", amount_min = 1, amount_max = 10, probability = 0.90},
        {type = "item", name = "iron-ore-impure", amount_min = 1, amount_max = 5, probability = 0.25},
      },
	  energy_required = 10,
	  main_product = "titanium-ore-impure",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "ilmenite", amount = 15 * ER_Mod},
        {type = "fluid", name = "water", amount = 50 * ER_Mod},
      },
      results = 
      {
        {type = "item", name = "titanium-ore-impure", amount_min = 1, amount_max = 10, probability = 0.90},
        {type = "item", name = "iron-ore-impure", amount_min = 1, amount_max = 5, probability = 0.25},
      },
	  energy_required = 10 * ER_Mod,
	  main_product = "titanium-ore-impure",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "aluminium-ore",
	category = "centrifuging",
	main_product = "aluminium-ore-impure",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "biotite", amount = 15},
        {type = "fluid", name = "water", amount = 50},
      },
      results = 
      {
        {type = "item", name = "aluminium-ore-impure", amount_min = 1, amount_max = 10, probability = 0.90},
        {type = "item", name = "iron-ore-impure", amount_min = 1, amount_max = 5, probability = 0.25},
        {type = "item", name = "magnesium-ore-impure", amount_min = 1, amount_max = 5, probability = 0.15},
      },
	  energy_required = 10,
	  main_product = "aluminium-ore-impure",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "biotite", amount = 15 * ER_Mod},
        {type = "fluid", name = "water", amount = 50 * ER_Mod},
      },
      results = 
      {
        {type = "item", name = "aluminium-ore-impure", amount_min = 1, amount_max = 10, probability = 0.90},
        {type = "item", name = "iron-ore-impure", amount_min = 1, amount_max = 5, probability = 0.25},
        {type = "item", name = "magnesium-ore-impure", amount_min = 1, amount_max = 5, probability = 0.15},
      },
	  energy_required = 10 * ER_Mod,
	  main_product = "aluminium-ore-impure",
	  enabled = false,
    },
  },
})