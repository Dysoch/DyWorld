
require("data.core.tech.tech-core")
require("data.core.tech.specials.mining-speed")

-- Extraction Module --
if settings.startup["DyWorld_Extraction"].value then
	--require("data.core.tech.tech-extraction")
end

-- Logistics Module --
if settings.startup["DyWorld_Logistics"].value then
	require("data.core.tech.tech-logistics")
end

-- Power Module --
if settings.startup["DyWorld_Power"].value then
	require("data.core.tech.tech-power")
end

-- Processing Module --
if settings.startup["DyWorld_Processing"].value then
	--require("data.core.tech.tech-processing")
end

-- Warfare Module --
if settings.startup["DyWorld_Warfare"].value then
	require("data.core.tech.tech-warfare")
end

-- Equipment Module --
if settings.startup["DyWorld_Equipment"].value then
	--require("data.core.tech.tech-equipment")
end