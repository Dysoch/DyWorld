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
      result = "charcoal",
	  result_count = 5,
	  enabled = true,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "limestone", amount = 5},
        {type = "item", name = "wood", amount = 15},
      },
      result = "charcoal",
	  result_count = 5,
	  enabled = true,
    },
  },
})