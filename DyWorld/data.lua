
-- Core Stuff
require("data.core.data")

if settings.startup["DyWorld_Defense"].value then
	require("data.defense.data")
end

if settings.startup["DyWorld_Enemies"].value then
	require("data.enemies.data")
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

for k,v in pairs(data.raw.unit) do
	if not v.loot then
		v.loot = {}
	end
end