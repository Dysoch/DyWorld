




data.raw.recipe["burner-turbine"].expensive = nil
data.raw.recipe["burner-turbine"].normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 15},
        {type = "item", name = "basic-kiln", amount = 1},
      },
      result = "burner-turbine",
	  result_count = 1,
	  energy_required = 2,
	  enabled = false,
    }
	
data.raw.recipe["motor"].expensive = nil
data.raw.recipe["motor"].normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 4},
        {type = "item", name = "bronze-gear", amount = 1},
      },
      result = "motor",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    }
	
data.raw.recipe["electric-motor"].expensive = nil
data.raw.recipe["electric-motor"].normal =
    {
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 2},
        {type = "item", name = "copper-cable", amount = 3},
        {type = "item", name = "motor", amount = 1},
      },
      result = "electric-motor",
	  result_count = 1,
	  energy_required = 2,
	  enabled = false,
    }
	
data.raw.recipe["fuel-processor"].normal.hidden = nil
data.raw.recipe["fuel-processing"].hidden = nil
data.raw.recipe["stone-tablet"].hidden = nil
data.raw.recipe["stone-tablet"].enabled = false

for _, recipe in pairs(data.raw.recipe) do
  if string.find(recipe.name, "science-pack", 1, true) then
    recipe.category = "assembling-tier-2"
  end
end