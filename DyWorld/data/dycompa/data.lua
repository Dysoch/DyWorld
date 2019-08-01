
-- Edits
require("data.dycompa.edits.item-group-change")

if settings.startup["DyWorld_Logistics"].value then
	require("data.dycompa.changes.dyworld-logistic")
end

if settings.startup["DyWorld_Processing"].value then
	require("data.dycompa.changes.dyworld-processing")
end