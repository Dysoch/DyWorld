

data.raw.inserter["burner-inserter"].energy_source.fuel_category = "carbon"
data.raw.item["burner-inserter"].stack_size = 200
data.raw.item["burner-inserter"].subgroup = DyDs.."inserter-tier-1"
data.raw.item["burner-inserter"].order = "1"

data:extend({
  {
    type = "recipe",
    name = "burner-inserter",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 1},
        {type = "item", name = "bronze-gear", amount = 1},
        {type = "item", name = "iron-ore", amount = 1},
      },
      result = "burner-inserter",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    },
  },
})