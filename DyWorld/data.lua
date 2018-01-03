
-- Core Stuff
require("data.prefix")
require("data.ms-core")

-- first we populate the Material Table
if settings.startup["DyWorld_Warfare"].value then
    require("data.ms-warfare")
end

if settings.startup["DyWorld_Metallurgy"].value then
    require("data.ms-metallurgy")
end

require("data.core.data")

-- then we add items/entities etc
if settings.startup["DyWorld_Metallurgy"].value then
	require("data.metallurgy.data")
end

if settings.startup["DyWorld_Extraction"].value then
	require("data.extraction.data")
end

if settings.startup["DyWorld_Logistics"].value then
	require("data.logistics.data")
end

if settings.startup["DyWorld_Modules"].value then
	require("data.modules.data")
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