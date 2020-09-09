data:extend({
  {
    type = "recipe",
    name = "bronze-gear",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 2},
      },
      result = "bronze-gear",
	  result_count = 1,
	  energy_required = 2.5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 5},
      },
      result = "bronze-gear",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "iron-gear",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 2},
      },
      result = "iron-gear",
	  result_count = 1,
	  energy_required = 3.5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 5},
      },
      result = "iron-gear",
	  result_count = 1,
	  energy_required = 8,
	  enabled = false,
    },
  },
})