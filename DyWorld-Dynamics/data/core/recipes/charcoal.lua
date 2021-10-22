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
        {type = "item", name = "wood", amount = 6},
      },
      results = 
      {
        {type = "item", name = "charcoal", amount_min = 4, amount_max = 8},
      },
	  energy_required = 2.5,
	  enabled = true,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "limestone", amount = 1},
        {type = "item", name = "sand", amount = 1},
        {type = "item", name = "wood", amount = 7},
      },
      results = 
      {
        {type = "item", name = "charcoal", amount_min = 4, amount_max = 8},
      },
	  energy_required = 7.5,
	  enabled = true,
    },
  },
})