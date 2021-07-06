data:extend({
  {
    type = "recipe",
    name = "cooked-fish-1",
	category = "kiln-basic",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "raw-fish-pike", amount = 1},
      },
      result = "cooked-fish",
	  result_count = 1,
	  energy_required = 5,
	  enabled = true,
    },
  },
  {
    type = "recipe",
    name = "cooked-fish-2",
	category = "kiln-basic",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "raw-fish-salmon", amount = 1},
      },
      result = "cooked-fish",
	  result_count = 1,
	  energy_required = 5,
	  enabled = true,
    },
  },
  {
    type = "recipe",
    name = "cooked-fish-filet-1",
	category = "smelting",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "raw-fish-pike-filet", amount = 1},
      },
      result = "cooked-fish-pike-filet",
	  result_count = 1,
	  energy_required = 2.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "cooked-fish-filet-2",
	category = "smelting",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "raw-fish-salmon-filet", amount = 1},
      },
      result = "cooked-fish-salmon-filet",
	  result_count = 1,
	  energy_required = 2.5,
	  enabled = false,
    },
  },
})