require "data/core/functions/prefix"

data.raw.recipe["automation-science-pack"].category = "crafting-with-fluid"
data.raw.recipe["automation-science-pack"].energy_required = 2.5
data.raw.recipe["automation-science-pack"].ingredients = {
    {type = "fluid", name = "science-1", amount = 5},
	{type = "item", name = "iron-plate", amount = 2},
	--{type = "item", name = "glass", amount = 1},
}
data.raw.recipe["logistic-science-pack"].category = "crafting-with-fluid"
data.raw.recipe["logistic-science-pack"].energy_required = 2.5
data.raw.recipe["logistic-science-pack"].ingredients = {
    {type = "fluid", name = "science-2", amount = 5},
	{type = "item", name = "steel-plate", amount = 2},
	--{type = "item", name = "glass", amount = 1},
}
data.raw.recipe["chemical-science-pack"].category = "crafting-with-fluid"
data.raw.recipe["chemical-science-pack"].energy_required = 2.5
data.raw.recipe["chemical-science-pack"].ingredients = {
    {type = "fluid", name = "science-3", amount = 5},
	{type = "item", name = "lead-plate", amount = 2},
	--{type = "item", name = "glass", amount = 1},
}
data.raw.recipe["military-science-pack"].category = "crafting-with-fluid"
data.raw.recipe["military-science-pack"].energy_required = 2.5
data.raw.recipe["military-science-pack"].ingredients = {
    {type = "fluid", name = "science-4", amount = 5},
	{type = "item", name = "gold-plate", amount = 2},
	--{type = "item", name = "glass", amount = 1},
}
data.raw.recipe["production-science-pack"].category = "crafting-with-fluid"
data.raw.recipe["production-science-pack"].energy_required = 2.5
data.raw.recipe["production-science-pack"].ingredients = {
    {type = "fluid", name = "science-5", amount = 5},
	{type = "item", name = "arditium-plate", amount = 2},
	--{type = "item", name = "glass", amount = 1},
}
data.raw.recipe["utility-science-pack"].category = "crafting-with-fluid"
data.raw.recipe["utility-science-pack"].energy_required = 2.5
data.raw.recipe["utility-science-pack"].ingredients = {
    {type = "fluid", name = "science-6", amount = 5},
	{type = "item", name = "tungsten-plate", amount = 2},
	--{type = "item", name = "glass", amount = 1},
}

data.raw.item.satellite.rocket_launch_product = {"space-artifact", 100}