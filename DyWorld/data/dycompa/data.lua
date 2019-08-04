
-- Edits
require("data.dycompa.edits.item-group-change")
require("data.dycompa.changes.dyworld-core")

if settings.startup["DyWorld_Logistics"].value then
	require("data.dycompa.changes.dyworld-logistic")
end

if settings.startup["DyWorld_Processing"].value then
	require("data.dycompa.changes.dyworld-processing")
end

if settings.startup["DyWorld_Power"].value then
	require("data.dycompa.changes.dyworld-power")
end

if settings.startup["DyWorld_Extraction"].value then
	require("data.dycompa.changes.dyworld-extraction")
end

if settings.startup["DyWorld_Warfare"].value then
	
end

if settings.startup["DyWorld_Equipment"].value then
	
end

if settings.startup["DyWorld_Decor"].value then
	
end