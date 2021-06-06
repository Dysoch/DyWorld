
data:extend({
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
})