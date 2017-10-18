require "data/prefix"

data.raw.recipe.centrifuge.ingredients = {{"iron-plate", 25}, {"stone", 100}, {"electronic-circuit", 25}, {"iron-gear-wheel", 10}}
data.raw.recipe["basic-oil-processing"].results = {
    {type = "fluid", name = "dyworld-clean-oil", amount = 50},
	{type = "fluid", name = "dyworld-sludge", amount = 40},
	{type = "fluid", name = "petroleum-gas", amount = 10}
}
data.raw.recipe["advanced-oil-processing"].ingredients = {
    {type = "fluid", name = "dyworld-water-clean", amount = 50},
	{type = "fluid", name = "crude-oil", amount = 100},
}
data.raw.recipe["advanced-oil-processing"].results = {
    {type = "fluid", name = "dyworld-clean-oil", amount = 70},
	{type = "fluid", name = "dyworld-sludge", amount = 10},
	{type = "fluid", name = "petroleum-gas", amount = 40}
}
data.raw.recipe["coal-liquefaction"].results = {
    {type = "fluid", name = "dyworld-clean-oil", amount = 40},
	{type = "fluid", name = "dyworld-sludge", amount = 15},
	{type = "fluid", name = "petroleum-gas", amount = 15}
}
data.raw.recipe["sulfur"].ingredients = {
    {type = "fluid", name = "petroleum-gas", amount = 20},
	{type = "fluid", name = "dyworld-sewage", amount = 40},
}

if settings.startup["DyWorld_Logistics"].value then
data.raw.recipe["transport-belt"].enabled = false
end