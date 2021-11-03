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
  },
  {
    type = "recipe",
    name = "corpse-centrifuge",
	category = "centrifuging",
	main_product = "bodily-fluid",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "enemy-corpse", amount = 1},
      },
      results = 
      {
        {type = "item", name = "bio-waste", amount_min = 1, amount_max = 10, probability = 0.02},
        {type = "item", name = "chitin", amount_min = 1, amount_max = 15, probability = 0.95},
        {type = "fluid", name = "bodily-fluid", amount_min = 10, amount_max = 500},
      },
	  energy_required = 10,
	  main_product = "bodily-fluid",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "bodily-fluid-centrifuge",
	category = "centrifuging",
	main_product = "acidic-residue",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "bodily-fluid", amount = 500},
      },
      results = 
      {
        {type = "item", name = "bio-waste", amount_min = 1, amount_max = 100, probability = 0.02},
        {type = "item", name = "dna-myriapod", amount_min = 5, amount_max = 15, probability = 0.75},
        {type = "item", name = "dna-arachnid", amount_min = 5, amount_max = 15, probability = 0.75},
        {type = "item", name = "acidic-residue", amount_min = 25, amount_max = 70},
        {type = "fluid", name = "blood", amount_min = 25, amount_max = 250},
      },
	  energy_required = 30,
	  main_product = "acidic-residue",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "acidic-residue-centrifuge",
	category = "centrifuging",
	main_product = "sulfur",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "acidic-residue", amount = 50},
        {type = "item", name = "soil", amount = 25},
      },
      results = 
      {
        {type = "item", name = "bio-waste", amount_min = 1, amount_max = 100, probability = 0.02},
        {type = "item", name = "sulfur", amount = 25},
        {type = "item", name = "soil", amount_min = 1, amount_max = 25, probability = 0.02},
      },
	  energy_required = 30,
	  main_product = "sulfur",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "blood-centrifuge",
	category = "centrifuging",
	main_product = "blood-bottle",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "blood", amount = 100},
        {type = "item", name = "glass", amount = 50},
      },
      results = 
      {
        {type = "item", name = "bio-waste", amount_min = 1, amount_max = 100, probability = 0.02},
        {type = "item", name = "blood-bottle", amount = 25},
        {type = "item", name = "acidic-residue", amount_min = 1, amount_max = 10, probability = 0.5},
      },
	  energy_required = 30,
	  main_product = "blood-bottle",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "fish-centrifuge-1",
	category = "centrifuging",
	main_product = "raw-fish-pike-filet",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "raw-fish-pike", amount = 1},
      },
      results = 
      {
        {type = "item", name = "bio-waste", amount_min = 1, amount_max = 100, probability = 0.02},
        {type = "item", name = "raw-fish-pike-filet", amount = 2},
        --{type = "item", name = "salt", amount_min = 1, amount_max = 5},
        {type = "fluid", name = "bodily-fluid", amount_min = 1, amount_max = 30},
      },
	  energy_required = 10,
	  main_product = "raw-fish-pike-filet",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "fish-centrifuge-2",
	category = "centrifuging",
	main_product = "raw-fish-salmon-filet",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "raw-fish-salmon", amount = 1},
      },
      results = 
      {
        {type = "item", name = "bio-waste", amount_min = 1, amount_max = 100, probability = 0.02},
        {type = "item", name = "raw-fish-salmon-filet", amount = 2},
        --{type = "item", name = "salt", amount_min = 1, amount_max = 8},
        {type = "fluid", name = "bodily-fluid", amount_min = 5, amount_max = 50},
      },
	  energy_required = 10,
	  main_product = "raw-fish-salmon-filet",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "bio-waste-refining",
	category = "centrifuging",
	main_product = "bio-waste",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bio-waste", amount = 50},
        {type = "fluid", name = "water", amount = 100},
      },
      results = 
      {
        {type = "item", name = "bio-waste", amount_min = 1, amount_max = 10, probability = 0.02},
        {type = "item", name = "dna-myriapod", amount_min = 1, amount_max = 10, probability = 0.1},
        {type = "item", name = "dna-arachnid", amount_min = 1, amount_max = 10, probability = 0.1},
        {type = "item", name = "acidic-residue", amount_min = 1, amount_max = 10, probability = 0.1},
        {type = "fluid", name = "blood", amount_min = 1, amount_max = 50, probability = 0.1},
        {type = "fluid", name = "water", amount_min = 1, amount_max = 50, probability = 0.1},
        {type = "item", name = "wood-sapling", amount_min = 1, amount_max = 10, probability = 0.1},
        {type = "item", name = "wood-sulfur-sapling", amount_min = 1, amount_max = 10, probability = 0.1},
        {type = "item", name = "wood-dead-sapling", amount_min = 1, amount_max = 10, probability = 0.1},
        {type = "item", name = "wood", amount_min = 1, amount_max = 10, probability = 0.1},
        {type = "item", name = "wood-sulfur", amount_min = 1, amount_max = 10, probability = 0.1},
        {type = "item", name = "wood-dead", amount_min = 1, amount_max = 10, probability = 0.1},
      },
	  energy_required = 10,
	  main_product = "bio-waste",
	  enabled = false,
    },
  },
  -- To add to tech
  {
    type = "recipe",
    name = "petroleum-centrifuge",
	category = "centrifuging",
	main_product = "petroleum-gas",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "petroleum-gas", amount = 100},
      },
      results = 
      {
        {type = "fluid", name = "petroleum-gas", amount_min = 1, amount_max = 50, probability = 0.1},
        {type = "fluid", name = "oxygen", amount_min = 1, amount_max = 15, probability = 0.2},
        {type = "fluid", name = "hydrogen", amount_min = 1, amount_max = 15, probability = 0.15},
        {type = "fluid", name = "nitrogen", amount_min = 1, amount_max = 20, probability = 0.3},
        {type = "item", name = "sulfur", amount_min = 1, amount_max = 10, probability = 0.2},
        {type = "item", name = "carbon", amount_min = 1, amount_max = 15, probability = 0.5},
      },
	  energy_required = 10,
	  main_product = "petroleum-gas",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "natural-gas-centrifuge",
	category = "centrifuging",
	main_product = "natural-gas",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "natural-gas", amount = 100},
      },
      results = 
      {
        {type = "fluid", name = "natural-gas", amount_min = 1, amount_max = 50, probability = 0.1},
        {type = "fluid", name = "methane", amount_min = 1, amount_max = 15, probability = 0.5},
        {type = "fluid", name = "hydrogen", amount_min = 1, amount_max = 15, probability = 0.15},
        {type = "fluid", name = "nitrogen", amount_min = 1, amount_max = 20, probability = 0.3},
        {type = "item", name = "sulfur", amount_min = 1, amount_max = 10, probability = 0.2},
        {type = "item", name = "carbon", amount_min = 1, amount_max = 15, probability = 0.5},
      },
	  energy_required = 10,
	  main_product = "natural-gas",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "charcoal-centrifuge",
	category = "centrifuging",
	main_product = "carbon",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "charcoal", amount = 10},
      },
      results = 
      {
        {type = "item", name = "charcoal", amount_min = 1, amount_max = 1, probability = 0.1},
        {type = "item", name = "sulfur", amount_min = 1, amount_max = 10, probability = 0.2},
        {type = "item", name = "carbon", amount_min = 10, amount_max = 35, probability = 0.95},
      },
	  energy_required = 10,
	  main_product = "carbon",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "cliff-explosives-1",
	category = "centrifuging",
	main_product = "cliff-explosives",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "charcoal", amount = 10},
        {type = "item", name = "sulfur", amount = 1},
        {type = "fluid", name = "light-oil", amount = 10},
      },
      results = 
      {
        {type = "item", name = "cliff-explosives", amount = 1},
      },
	  energy_required = 2.5,
	  main_product = "cliff-explosives",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "water-to-ore",
	category = "centrifuging",
	main_product = "water",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "lignite", amount = 5},
        {type = "item", name = "sand", amount = 50},
        {type = "fluid", name = "steam", amount = 1000},
      },
      results = 
      {
        {type = "fluid", name = "water", amount = 10},
        {type = "item", name = "iron-ore-impure", amount_min = 2, amount_max = 6, probability = 0.15},
        {type = "item", name = "iron-ore", amount_min = 1, amount_max = 3, probability = 0.075},
        {type = "item", name = "tin-ore-impure", amount_min = 2, amount_max = 6, probability = 0.15},
        {type = "item", name = "tin-ore", amount_min = 1, amount_max = 3, probability = 0.075},
        {type = "item", name = "copper-ore-impure", amount_min = 2, amount_max = 6, probability = 0.15},
        {type = "item", name = "copper-ore", amount_min = 1, amount_max = 3, probability = 0.075},
        {type = "item", name = "titanium-ore-impure", amount_min = 2, amount_max = 6, probability = 0.15},
        {type = "item", name = "titanium-ore", amount_min = 1, amount_max = 3, probability = 0.075},
        {type = "item", name = "magnesium-ore-impure", amount_min = 2, amount_max = 6, probability = 0.15},
        {type = "item", name = "magnesium-ore", amount_min = 1, amount_max = 3, probability = 0.075},
        {type = "item", name = "aluminium-ore-impure", amount_min = 2, amount_max = 6, probability = 0.15},
        {type = "item", name = "aluminium-ore", amount_min = 1, amount_max = 3, probability = 0.075},
        {type = "item", name = "coal", amount_min = 1, amount_max = 5, probability = 0.15},
        {type = "item", name = "sand", amount_min = 1, amount_max = 10, probability = 0.25},
        {type = "item", name = "limestone", amount_min = 1, amount_max = 10, probability = 0.05},
        {type = "item", name = "granite", amount_min = 1, amount_max = 10, probability = 0.05},
        {type = "item", name = "sandstone", amount_min = 1, amount_max = 10, probability = 0.05},
        {type = "item", name = "quartzite", amount_min = 1, amount_max = 10, probability = 0.05},
      },
	  energy_required = 2.5,
	  main_product = "water",
	  enabled = false,
    },
  },
})