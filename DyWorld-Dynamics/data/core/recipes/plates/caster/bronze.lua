
data:extend({
  {
    type = "recipe",
    name = "cast-bronze-3b",
	category = "casting-furnace",
	main_product = "bronze-plate",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "molten-bronze", amount = 1},
        {type = "item", name = "mold-plate", amount = 1},
      },
      results =
      {
        {type = "item", name = "bronze-plate", amount = 1},
        {type = "item", name = "mold-plate", amount = 1, probability = 0.995},
      },
	  energy_required = 0.25,
	  main_product = "bronze-plate",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "fluid", name = "molten-bronze", amount = 1},
        {type = "item", name = "mold-plate", amount = 1},
      },
      results =
      {
        {type = "item", name = "bronze-plate", amount = 1},
        {type = "item", name = "mold-plate", amount = 1, probability = 0.995},
      },
	  energy_required = 0.25,
	  main_product = "bronze-plate",
	  enabled = false,
    },
  },
})