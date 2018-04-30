
require("dycompa.dyworld-core")

if settings.startup["DyWorld_Warfare"].value then
	require("dycompa.dyworld-warfare")
end

if settings.startup["DyWorld_Modules"].value then
	require("dycompa.dyworld-modules")
end

if settings.startup["DyWorld_Processing"].value then
	require("dycompa.dyworld-processing")
end

if settings.startup["DyWorld_Power"].value then
	require("dycompa.dyworld-power")
end

if settings.startup["DyWorld_Logistics"].value then
	require("dycompa.dyworld-logistic")
end

if settings.startup["DyWorld_Extraction"].value then
	require("dycompa.dyworld-extraction")
end

if settings.startup["DyWorld_Equipment"].value then
	require("dycompa.dyworld-equipment")
end

--if data.raw.item["farl-roboport"] then require("dycompa.farl") end

--if data.raw.item["ucoin"] then require("dycompa.black-market") end