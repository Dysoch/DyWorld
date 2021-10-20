data:extend({
  {
    type = "recipe",
    name = "cast-copper-1",
	category = "kiln-basic",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore-impure", amount = 10},
      },
      result = "copper-ingot",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore-impure", amount = 20},
      },
      result = "copper-ingot",
	  result_count = 1,
	  energy_required = 15,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "cast-copper-1b",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "copper-ingot", amount = 1},
      },
      result = "copper-plate",
	  result_count = 5,
	  energy_required = 5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "copper-ingot", amount = 1},
      },
      result = "copper-plate",
	  result_count = 1,
	  energy_required = 10,
	  enabled = false,
    },
  },
})