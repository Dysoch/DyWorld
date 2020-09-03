data:extend({
  {
    type = "recipe",
    name = "cast-iron",
	category = "kiln-basic",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore-impure", amount = 2},
        {type = "item", name = "charcoal", amount = 1},
      },
      result = "iron-plate",
	  result_count = 1,
	  enabled = true,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore-impure", amount = 5},
        {type = "item", name = "charcoal", amount = 1},
      },
      result = "iron-plate",
	  result_count = 1,
	  enabled = true,
    },
  },
  {
    type = "recipe",
    name = "bronze-basic",
	category = "kiln-basic",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore-impure", amount = 7},
        {type = "item", name = "tin-ore-impure", amount = 1},
      },
      result = "bronze-plate",
	  result_count = 5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore-impure", amount = 21},
        {type = "item", name = "tin-ore-impure", amount = 3},
      },
      result = "bronze-plate",
	  result_count = 5,
	  enabled = false,
    },
  },
})