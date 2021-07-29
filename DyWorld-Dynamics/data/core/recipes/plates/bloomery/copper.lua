
data:extend({
  {
    type = "recipe",
    name = "cast-copper-2",
	category = "bloomery",
	main_product = "copper-ingot",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore", amount = 50},
        {type = "item", name = "charcoal", amount = 1},
        {type = "item", name = "canister-oxygen", amount = 2},
      },
      results = 
      {
        {type = "item", name = "copper-ingot", amount = 10},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "slag", amount_min = 10, amount_max = 20},
      },
	  energy_required = 30,
	  main_product = "copper-ingot",
	  enabled = false,
    },
  },
})