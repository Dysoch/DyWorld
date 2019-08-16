require "data/core/functions/prefix"
require "data/core/functions/colors"

data.raw.recipe["rocket-silo"].ingredients = nil
data.raw.recipe["rocket-silo"].normal = {
	ingredients = {},
	energy_required = 60,
	result = "rocket-silo",
	enabled = false,
}
data.raw.recipe["rocket-silo"].expensive = {
	ingredients = {},
	energy_required = 300,
	result = "rocket-silo",
	enabled = false,
}

DyWorld_Add_To_Recipe("rocket-silo", "electranium-plate", 500)
DyWorld_Add_To_Recipe("rocket-silo", "tungsten-plate", 500)
DyWorld_Add_To_Recipe("rocket-silo", "controller", 100)
DyWorld_Add_To_Recipe("rocket-silo", "frame", 10)
DyWorld_Add_To_Recipe("rocket-silo", "logic-control-board", 250)

if settings.startup["DyWorld_Extraction"].value then	
else
end

if settings.startup["DyWorld_Logistics"].value then
	DyWorld_Add_To_Recipe("rocket-silo", "arditium-pipe", 50)
else
	DyWorld_Add_To_Recipe("rocket-silo", "pipe", 50)	
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
