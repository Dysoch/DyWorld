require "data/core/functions/prefix"
require "data/core/functions/colors"

data.raw.recipe["rocket-control-unit"].ingredients = nil
data.raw.recipe["rocket-control-unit"].normal = {
	ingredients = {},
	energy_required = 20,
	result = "rocket-control-unit",
	enabled = false,
}
data.raw.recipe["rocket-control-unit"].expensive = {
	ingredients = {},
	energy_required = 100,
	result = "rocket-control-unit",
	enabled = false,
}

DyWorld_Add_To_Recipe("rocket-control-unit", "stainless-steel-plate", 3)
DyWorld_Add_To_Recipe("rocket-control-unit", "processing-control-board", 1)
DyWorld_Add_To_Recipe("rocket-control-unit", "controller", 1)

if settings.startup["DyWorld_Extraction"].value then	
else
end

if settings.startup["DyWorld_Logistics"].value then
else
end

if settings.startup["DyWorld_Power"].value then	
else	
end

if settings.startup["DyWorld_Processing"].value then
else	
end

if settings.startup["DyWorld_Warfare"].value then
else
end
