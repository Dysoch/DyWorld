
data:extend({
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
        {type = "fluid", name = "molten-magnesium", amount_min = 90, amount_max = 125},
        {type = "item", name = "slag", amount_min = 1, amount_max = 5},
      },
	  energy_required = 30,
	  main_product = "molten-magnesium",
	  enabled = false,
    },
  },
})