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
        {type = "item", name = "polycarbonate", amount = 2},
      },
      result = "control-board-2",
	  result_count = 2,
	  energy_required = 2.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "control-board-3",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-2", amount = 1},
        {type = "item", name = "polyurethane", amount = 2},
        {type = "item", name = "quartz", amount = 2},
        {type = "fluid", name = "sulfuric-acid", amount = 25},
      },
      result = "control-board-3",
	  result_count = 1,
	  energy_required = 10,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "control-board-4",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-3", amount = 1},
        {type = "item", name = "polylactic-acid", amount = 2},
        {type = "fluid", name = "lubricant", amount = 20},
      },
      result = "control-board-4",
	  result_count = 1,
	  energy_required = 25,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "control-board-5",
	category = "assembling-tier-4",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-4", amount = 1},
        {type = "item", name = "polyvinyl-chloride", amount = 2},
        {type = "item", name = "polyepoxide", amount = 2},
        {type = "item", name = "exotic-partical", amount = 25},
      },
      result = "control-board-5",
	  result_count = 1,
	  energy_required = 50,
	  enabled = false,
    },
  },
})