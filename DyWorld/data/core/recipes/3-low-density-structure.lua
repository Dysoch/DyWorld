require "data/core/functions/prefix"
require "data/core/functions/colors"

data.raw.recipe["low-density-structure"].ingredients = nil
data.raw.recipe["low-density-structure"].normal = {
	ingredients = {},
	energy_required = 20,
	result = "low-density-structure",
	enabled = false,
}
data.raw.recipe["low-density-structure"].expensive = {
	ingredients = {},
	energy_required = 180,
	result = "low-density-structure",
	enabled = false,
}

DyWorld_Add_To_Recipe("low-density-structure", "bronze-plate", 20)
DyWorld_Add_To_Recipe("low-density-structure", "invar-plate", 10)
DyWorld_Add_To_Recipe("low-density-structure", "housing", 3)

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
