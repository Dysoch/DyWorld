
data:extend({
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
        {type = "item", name = "slag", amount_min = 1, amount_max = 5},
      },
	  energy_required = 30,
	  main_product = "molten-steel",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore", amount = 225},
        {type = "item", name = "coal", amount = 4},
        {type = "fluid", name = "oxygen", amount = 250},
      },
      results = 
      {
        {type = "fluid", name = "molten-steel", amount_min = 75, amount_max = 85},
        {type = "item", name = "slag", amount_min = 1, amount_max = 15},
      },
	  energy_required = 30,
	  main_product = "molten-steel",
	  enabled = false,
    },
  },
})