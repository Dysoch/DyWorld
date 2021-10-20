data:extend({
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
	  energy_required = 5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore-impure", amount = 21},
        {type = "item", name = "tin-ore-impure", amount = 3},
        --{type = "item", name = "sand", amount = 2},
      },
      result = "bronze-plate",
	  result_count = 5,
	  energy_required = 25,
	  enabled = false,
    },
  },
})