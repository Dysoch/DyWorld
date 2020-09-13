data:extend({
  {
    type = "recipe",
    name = "control-board-1",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "wood", amount = 1},
        {type = "item", name = "tin-plate", amount = 1},
      },
      result = "control-board-1",
	  result_count = 2,
	  energy_required = 2.5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "wood", amount = 2},
        {type = "item", name = "tin-plate", amount = 2},
      },
      result = "control-board-1",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})