data:extend({
  {
    type = "recipe",
    name = "cast-iron-1",
	category = "kiln-basic",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore-impure", amount = 2},
        {type = "item", name = "charcoal", amount = 1},
      },
      result = "iron-plate",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "cast-copper-1",
	category = "kiln-basic",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore-impure", amount = 2},
      },
      result = "copper-plate",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "bronze-basic",
	category = "kiln-basic",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore-impure", amount = 7},
        {type = "item", name = "tin-ore-impure", amount = 1},
      },
      result = "bronze-plate",
	  result_count = 5,
	  energy_required = 5,
	  enabled = false,
    },
  },
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
      result = "tin-plate",
	  result_count = 5,
	  energy_required = 2.5,
	  enabled = false,
    },
  },
})