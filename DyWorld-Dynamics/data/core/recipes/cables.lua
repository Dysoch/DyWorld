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
  },
  {
    type = "recipe",
    name = "red-wire",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "copper-cable", amount = 2},
        {type = "item", name = "control-board-1", amount = 1},
        {type = "item", name = "tin-plate", amount = 1},
      },
      result = "red-wire",
	  result_count = 2,
	  energy_required = 1.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "green-wire",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "copper-cable", amount = 2},
        {type = "item", name = "control-board-1", amount = 1},
        {type = "item", name = "bronze-plate", amount = 1},
      },
      result = "green-wire",
	  result_count = 2,
	  energy_required = 1.5,
	  enabled = false,
    },
  },
})