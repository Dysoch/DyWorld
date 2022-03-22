
data:extend({
  {
    type = "recipe",
    name = "cast-steel-3b",
	category = "casting-furnace",
	main_product = "steel-plate",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "molten-steel", amount = 1},
        {type = "item", name = "mold-plate", amount = 1},
      },
      results =
      {
        {type = "item", name = "steel-plate", amount = 1},
        {type = "item", name = "mold-plate", amount = 1, probability = 0.995},
      },
	  energy_required = 0.25,
	  main_product = "steel-plate",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "fluid", name = "molten-steel", amount = 1},
        {type = "item", name = "mold-plate", amount = 1},
      },
      results =
      {
        {type = "item", name = "steel-plate", amount = 1},
        {type = "item", name = "mold-plate", amount = 1, probability = 0.995},
      },
	  energy_required = 0.25,
	  main_product = "steel-plate",
	  enabled = false,
    },
  },
})