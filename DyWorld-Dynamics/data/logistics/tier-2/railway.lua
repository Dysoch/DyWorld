data:extend({
  {
    type = "recipe",
    name = "train-stop",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 4},
        {type = "item", name = "iron-plate", amount = 6},
        {type = "item", name = "control-board-1", amount = 1},
        {type = "item", name = "stone-brick", amount = 1},
      },
      result = "train-stop",
	  result_count = 1,
	  energy_required = 2.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "rail-1",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 2},
        {type = "item", name = "stone-brick", amount = 1},
      },
      result = "rail",
	  result_count = 1,
	  energy_required = 1.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "rail-signal",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "glass", amount = 3},
        {type = "item", name = "control-board-1", amount = 1},
        {type = "item", name = "iron-plate", amount = 2},
        {type = "item", name = "stone-brick", amount = 1},
      },
      result = "rail-signal",
	  result_count = 1,
	  energy_required = 1.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "rail-chain-signal",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "glass", amount = 3},
        {type = "item", name = "control-board-1", amount = 1},
        {type = "item", name = "iron-plate", amount = 2},
        {type = "item", name = "stone-brick", amount = 1},
      },
      result = "rail-chain-signal",
	  result_count = 1,
	  energy_required = 1.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "rail-2",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 2},
        {type = "item", name = "stone-brick", amount = 1},
      },
      result = "rail",
	  result_count = 2,
	  energy_required = 1.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "rail-3",
	category = "assembling-tier-4",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 2},
        {type = "item", name = "titanium-plate", amount = 2},
        {type = "item", name = "stone-brick", amount = 1},
      },
      result = "rail",
	  result_count = 5,
	  energy_required = 1.5,
	  enabled = false,
    },
  },
})