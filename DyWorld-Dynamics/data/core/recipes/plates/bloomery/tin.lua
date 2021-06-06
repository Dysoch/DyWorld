
data:extend({
  {
    type = "recipe",
    name = "cast-tin-2",
	category = "bloomery",
	main_product = "tin-plate",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-ore", amount = 50},
        {type = "item", name = "charcoal", amount = 1},
        {type = "item", name = "canister-oxygen", amount = 2},
      },
      results = 
      {
        {type = "item", name = "tin-plate", amount = 35},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "slag", amount_min = 10, amount_max = 20},
      },
	  energy_required = 30,
	  main_product = "tin-plate",
	  enabled = false,
    },
  },
})