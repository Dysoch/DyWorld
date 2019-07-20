

-- Core Module --
require("data.core.data")

-- Metallurgy Module --
require("data.metallurgy.data")

-- Modules Module --
require("data.modules.data")

-- Extraction Module --
if settings.startup["DyWorld_Extraction"].value then
	require("data.extraction.data")
end

-- Logistics Module --
if settings.startup["DyWorld_Logistics"].value then
	require("data.logistics.data")
end

-- Power Module --
if settings.startup["DyWorld_Power"].value then
	require("data.power.data")
end

-- Processing Module --
if settings.startup["DyWorld_Processing"].value then
	require("data.processing.data")
end

-- Warfare Module --
if settings.startup["DyWorld_Warfare"].value then
	require("data.warfare.data")
end

-- Equipment Module --
if settings.startup["DyWorld_Equipment"].value then
	require("data.equipment.data")
end

-- Decor Module --
if settings.startup["DyWorld_Decor"].value then
	require("data.decor.data")
end
