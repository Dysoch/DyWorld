



data:extend({
  {
    type = "technology",
    name = "copper-processing",
    icon_size = 128,
    icon = "__base__/graphics/technology/automation-1.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bloomery"
      },
    },
    unit =
    {
      count = 15,
      ingredients = 
	  {
		{"copper-ore-impure", 25},
		{"copper-ore", 25},
		{"copper-plate", 1},
	  },
      time = 2.5
    },
    order = "1-1"
  },
  {
    type = "technology",
    name = "iron-processing",
    icon_size = 128,
    icon = "__base__/graphics/technology/automation-1.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bloomery"
      },
    },
    unit =
    {
      count = 25,
      ingredients = 
	  {
		{"iron-ore-impure", 25},
		{"iron-ore", 25},
		{"iron-plate", 1},
	  },
      time = 5
    },
    order = "1-1"
  },
  {
    type = "technology",
    name = "tin-processing",
    icon_size = 128,
    icon = "__base__/graphics/technology/automation-1.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bloomery"
      },
    },
    unit =
    {
      count = 10,
      ingredients = 
	  {
		{"tin-ore-impure", 25},
		{"tin-ore", 25},
		{"tin-plate", 1},
	  },
      time = 1
    },
    order = "1-1"
  },
})