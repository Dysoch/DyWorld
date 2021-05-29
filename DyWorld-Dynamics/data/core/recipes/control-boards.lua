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
  },
  {
    type = "recipe",
    name = "control-board-2",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "green-wire", amount = 1},
        {type = "item", name = "red-wire", amount = 1},
        {type = "item", name = "copper-cable", amount = 2},
        {type = "item", name = "steel-plate", amount = 1},
        {type = "item", name = "plastic-bar", amount = 2},
      },
      result = "control-board-2",
	  result_count = 2,
	  energy_required = 2.5,
	  enabled = false,
    },
  },
})