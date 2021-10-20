data:extend({
  {
    type = "recipe",
    name = "cast-iron-1",
	category = "kiln-basic",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore-impure", amount = 10},
        {type = "item", name = "charcoal", amount = 1},
      },
      result = "iron-ingot",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore-impure", amount = 20},
        {type = "item", name = "charcoal", amount = 3},
      },
      result = "iron-ingot",
	  result_count = 1,
	  energy_required = 15,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "cast-iron-1b",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-ingot", amount = 1},
      },
      result = "iron-plate",
	  result_count = 5,
	  energy_required = 5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-ingot", amount = 1},
      },
      result = "iron-plate",
	  result_count = 1,
	  energy_required = 10,
	  enabled = false,
    },
  },
})