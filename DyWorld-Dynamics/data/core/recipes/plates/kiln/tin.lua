data:extend({
  {
    type = "recipe",
    name = "tin-basic",
	category = "kiln-basic",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-ore-impure", amount = 7},
      },
      result = "tin-ingot",
	  result_count = 1,
	  energy_required = 2.5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "tin-ore-impure", amount = 11},
      },
      result = "tin-ingot",
	  result_count = 1,
	  energy_required = 12.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "tin-basic-2",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-ingot", amount = 1},
      },
      result = "tin-plate",
	  result_count = 5,
	  energy_required = 5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "tin-ingot", amount = 1},
      },
      result = "tin-plate",
	  result_count = 1,
	  energy_required = 10,
	  enabled = false,
    },
  },
})