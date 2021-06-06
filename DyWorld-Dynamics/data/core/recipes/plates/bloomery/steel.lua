
data:extend({
  {
    type = "recipe",
    name = "cast-steel-2",
	category = "bloomery",
	main_product = "steel-plate",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore", amount = 10},
        {type = "item", name = "coal", amount = 1},
        {type = "item", name = "canister-oxygen", amount = 2},
      },
      results = 
      {
        {type = "item", name = "steel-plate", amount = 3},
        {type = "item", name = "canister-empty", amount = 2},
        {type = "item", name = "slag", amount_min = 1, amount_max = 5},
      },
	  energy_required = 15,
	  main_product = "steel-plate",
	  enabled = false,
    },
  },
})