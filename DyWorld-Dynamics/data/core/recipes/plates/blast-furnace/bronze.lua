
data:extend({
  {
    type = "recipe",
    name = "cast-bronze-3a",
	category = "blast-furnace",
	main_product = "molten-bronze",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore", amount = 70},
        {type = "item", name = "tin-ore", amount = 10},
        {type = "fluid", name = "nitrogen", amount = 75},
      },
      results = 
      {
        {type = "fluid", name = "molten-bronze", amount_min = 90, amount_max = 125},
        {type = "item", name = "slag", amount_min = 1, amount_max = 5},
      },
	  energy_required = 30,
	  main_product = "molten-bronze",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore", amount = 85},
        {type = "item", name = "tin-ore", amount = 15},
        {type = "fluid", name = "nitrogen", amount = 75},
      },
      results = 
      {
        {type = "fluid", name = "molten-bronze", amount_min = 90, amount_max = 125},
        {type = "item", name = "slag", amount_min = 1, amount_max = 15},
      },
	  energy_required = 30,
	  main_product = "molten-bronze",
	  enabled = false,
    },
  },
})