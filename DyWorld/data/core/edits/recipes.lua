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
data.raw.recipe["science-pack-1"].category = "crafting-with-fluid"
data.raw.recipe["science-pack-1"].energy_required = 2.5
data.raw.recipe["science-pack-1"].ingredients = {
    {type = "fluid", name = dy.."science-fluid-1", amount = 5},
	{type = "item", name = dy.."glass", amount = 2},
}
data.raw.recipe["science-pack-2"].category = "crafting-with-fluid"
data.raw.recipe["science-pack-2"].energy_required = 2.5
data.raw.recipe["science-pack-2"].ingredients = {
    {type = "fluid", name = dy.."science-fluid-2", amount = 5},
	{type = "item", name = dy.."glass", amount = 2},
}
data.raw.recipe["science-pack-3"].category = "crafting-with-fluid"
data.raw.recipe["science-pack-3"].energy_required = 2.5
data.raw.recipe["science-pack-3"].ingredients = {
    {type = "fluid", name = dy.."science-fluid-3", amount = 5},
	{type = "item", name = dy.."glass", amount = 2},
}
data.raw.recipe["military-science-pack"].category = "crafting-with-fluid"
data.raw.recipe["military-science-pack"].energy_required = 2.5
data.raw.recipe["military-science-pack"].ingredients = {
    {type = "fluid", name = dy.."science-fluid-4", amount = 5},
	{type = "item", name = dy.."glass", amount = 2},
}
data.raw.recipe["production-science-pack"].category = "crafting-with-fluid"
data.raw.recipe["production-science-pack"].energy_required = 2.5
data.raw.recipe["production-science-pack"].ingredients = {
    {type = "fluid", name = dy.."science-fluid-5", amount = 5},
	{type = "item", name = dy.."glass", amount = 2},
}
data.raw.recipe["high-tech-science-pack"].category = "crafting-with-fluid"
data.raw.recipe["high-tech-science-pack"].energy_required = 2.5
data.raw.recipe["high-tech-science-pack"].ingredients = {
    {type = "fluid", name = dy.."science-fluid-6", amount = 5},
	{type = "item", name = dy.."glass", amount = 2},
}

data.raw.recipe["rocket-fuel"].category = "crafting-with-fluid"
data.raw.recipe["rocket-fuel"].energy_required = 2.5
data.raw.recipe["rocket-fuel"].ingredients = {
    {type = "fluid", name = dy.."rocket-fuel", amount = 5},
	{type = "item", name = "steel-plate", amount = 1},
}

table.remove(data.raw.recipe["electronic-circuit"].normal.ingredients,2)
local result = {"copper-pcb", 1}
table.insert(data.raw.recipe["electronic-circuit"].normal.ingredients,result)

table.remove(data.raw.recipe["advanced-circuit"].normal.ingredients,3)
table.remove(data.raw.recipe["advanced-circuit"].normal.ingredients,1)
local result = {"silver-pcb", 2}
table.insert(data.raw.recipe["advanced-circuit"].normal.ingredients,result)
local result = {"lead-pcb", 1}
table.insert(data.raw.recipe["advanced-circuit"].normal.ingredients,result)

table.remove(data.raw.recipe["processing-unit"].normal.ingredients,2)
table.remove(data.raw.recipe["processing-unit"].normal.ingredients,1)
local result = {"steel-pcb", 2}
table.insert(data.raw.recipe["processing-unit"].normal.ingredients,result)
local result = {"tungsten-pcb", 3}
table.insert(data.raw.recipe["processing-unit"].normal.ingredients,result)
local result = {"gold-cable", 5}
table.insert(data.raw.recipe["processing-unit"].normal.ingredients,result)
