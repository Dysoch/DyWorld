
data:extend({
  {
    type = "recipe",
    name = "cast-bronze-2",
	category = "bloomery",
	main_product = "bronze-plate",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-ore", amount = 10},
        {type = "item", name = "copper-ore", amount = 70},
        {type = "item", name = "canister-water", amount = 2},
      },
      results = 
      {
        {type = "item", name = "bronze-plate", amount = 75},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "slag", amount_min = 5, amount_max = 50},
      },
	  energy_required = 30,
	  main_product = "bronze-plate",
	  enabled = false,
    },
  },
})