data:extend({
  {
    type = "recipe",
    name = "copper-cable",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "copper-plate", amount = 2},
      },
      result = "copper-cable",
	  result_count = 5,
	  energy_required = 2.5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "copper-plate", amount = 5},
      },
      result = "copper-cable",
	  result_count = 5,
	  energy_required = 5,
	  enabled = false,
    },
  },
})