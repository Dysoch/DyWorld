require "data/core/functions/prefix"
require "data/core/functions/colors"

data.raw.recipe["satellite"].ingredients = nil
data.raw.recipe["satellite"].normal = {
	ingredients = {},
	energy_required = 10,
	result = "satellite",
	enabled = false,
}
data.raw.recipe["satellite"].expensive = {
	ingredients = {},
	energy_required = 60,
	result = "satellite",
	enabled = false,
}

DyWorld_Add_To_Recipe("satellite", "arditium-tungstenate-plate", 60)
DyWorld_Add_To_Recipe("satellite", "logic-control-board", 25)
DyWorld_Add_To_Recipe("satellite", "low-density-structure", 50)
DyWorld_Add_To_Recipe("satellite", "rocket-fuel", 25)
DyWorld_Add_To_Recipe("satellite", "controller", 15)

if settings.startup["DyWorld_Extraction"].value then	
else
end

if settings.startup["DyWorld_Logistics"].value then
else
end

if settings.startup["DyWorld_Power"].value then	
	DyWorld_Add_To_Recipe("satellite", "titanium-solar-panel", 50)
	DyWorld_Add_To_Recipe("satellite", "copper-accumulator", 50) --temp
else
	DyWorld_Add_To_Recipe("satellite", "solar-panel", 50)		
	DyWorld_Add_To_Recipe("satellite", "accumulator", 50)		
end

if settings.startup["DyWorld_Processing"].value then
else	
end

if settings.startup["DyWorld_Warfare"].value then
else
end
