
DyWorld_TD = {}

-- Core Stuff
require("data.prefix")
require("data.ms-core")

-- first we populate the Material Table
if settings.startup["DyWorld_Warfare"].value then
    require("data.ms-warfare")
end

require("data.ms-metallurgy")

require("data.core.populate-item-group")
require("data.core.data")

-- then we add items/entities etc
require("data.metallurgy.data")
require("data.modules.data")

if settings.startup["DyWorld_Extraction"].value then
	require("data.extraction.data")
end

if settings.startup["DyWorld_Logistics"].value then
	require("data.logistics.data")
end

if settings.startup["DyWorld_Power"].value then
	require("data.power.data")
end

if settings.startup["DyWorld_Processing"].value then
	require("data.processing.data")
end

if settings.startup["DyWorld_Warfare"].value then
	require("data.warfare.data")
end

if settings.startup["DyWorld_Equipment"].value then
	require("data.equipment.data")
end

if settings.startup["DyWorld_Chemistry"].value then
	require("data.chemistry.data")
end

--require("data.decor.data")