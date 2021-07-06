
data:extend({
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
        {type = "fluid", name = "molten-tin", amount_min = 90, amount_max = 125},
        {type = "item", name = "slag", amount_min = 1, amount_max = 5},
      },
	  energy_required = 30,
	  main_product = "molten-tin",
	  enabled = false,
    },
  },
})