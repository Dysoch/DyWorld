data:extend({
  {
    type = "recipe",
    name = "charcoal-basic",
	category = "kiln-basic",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "limestone", amount = 1},
        {type = "item", name = "wood", amount = 5},
      },
      results = 
      {
        {type = "item", name = "charcoal", amount_min = 2, amount_max = 4},
      },
	  energy_required = 2.5,
	  enabled = true,
    },
  },
})