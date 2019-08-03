require "data/core/functions/prefix"


data.raw.recipe["iron-plate"].ingredients = nil
data.raw.recipe["iron-plate"].normal = {
	energy_required = 3.2,
	ingredients = {{type = "item", name = "iron-ore", amount = 1}},
	result = "iron-plate",
}
data.raw.recipe["iron-plate"].expensive = {
	energy_required = 5,
	ingredients = {{type = "item", name = "iron-ore", amount = 5}},
	result = "iron-plate",
}

data.raw.recipe["copper-plate"].ingredients = nil
data.raw.recipe["copper-plate"].normal = {
	energy_required = 3.2,
	ingredients = {{type = "item", name = "copper-ore", amount = 1}},
	result = "copper-plate",
}
data.raw.recipe["copper-plate"].expensive = {
	energy_required = 5,
	ingredients = {{type = "item", name = "copper-ore", amount = 5}},
	result = "copper-plate",
}

data.raw.recipe["steel-plate"].ingredients = nil
data.raw.recipe["steel-plate"].normal = {
	energy_required = 5,
	enabled = false,
	ingredients = {{type = "item", name = "iron-plate", amount = 5}},
	result = "steel-plate",
}
data.raw.recipe["steel-plate"].expensive = {
	energy_required = 5,
	enabled = false,
	ingredients = {{type = "item", name = "iron-plate", amount = 25}},
	result = "steel-plate",
}

data.raw.recipe["stone-brick"].ingredients = nil
data.raw.recipe["stone-brick"].normal = {
	energy_required = 3.2,
	ingredients = {{type = "item", name = "stone", amount = 2}},
	result = "stone-brick",
}
data.raw.recipe["stone-brick"].expensive = {
	energy_required = 5,
	ingredients = {{type = "item", name = "stone", amount = 10}},
	result = "stone-brick",
}
