
data:extend({
	-- Slag -- 
  {
    type = "recipe",
    name = "slag-processing",
	category = "bloomery",
	main_product = "slag",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "slag", amount = 100},
        {type = "item", name = "canister-oxygen", amount = 1},
        {type = "item", name = "lignite", amount = 1},
      },
      results = 
      {
        {type = "item", name = "canister-empty", amount = 1},
        {type = "item", name = "slag", amount_min = 1, amount_max = 5, probability = 0.1},
        {type = "item", name = "iron-ore-impure", amount_min = 2, amount_max = 6, probability = 0.15},
        {type = "item", name = "iron-ore", amount_min = 1, amount_max = 3, probability = 0.075},
        {type = "item", name = "tin-ore-impure", amount_min = 2, amount_max = 6, probability = 0.15},
        {type = "item", name = "tin-ore", amount_min = 1, amount_max = 3, probability = 0.075},
        {type = "item", name = "copper-ore-impure", amount_min = 2, amount_max = 6, probability = 0.15},
        {type = "item", name = "copper-ore", amount_min = 1, amount_max = 3, probability = 0.075},
        {type = "item", name = "coal", amount_min = 1, amount_max = 5, probability = 0.15},
        {type = "item", name = "lignite", amount_min = 1, amount_max = 10, probability = 0.25},
        {type = "item", name = "limestone", amount_min = 1, amount_max = 10, probability = 0.05},
        {type = "item", name = "granite", amount_min = 1, amount_max = 10, probability = 0.05},
        {type = "item", name = "sandstone", amount_min = 1, amount_max = 10, probability = 0.05},
        {type = "item", name = "quartzite", amount_min = 1, amount_max = 10, probability = 0.05},
      },
	  energy_required = 12,
	  main_product = "slag",
	  enabled = false,
    },
  },
})