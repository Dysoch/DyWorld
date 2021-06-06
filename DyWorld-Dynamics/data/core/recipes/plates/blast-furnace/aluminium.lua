
data:extend({
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
})