
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

-- Warfare Enemies Module --
if settings.startup["DyWorld_Warfare"].value and settings.startup["DyWorld_Warfare_Enemies"].value and settings.startup["DyWorld_Combat_Overhaul"].value then
	require("data.warfare.data-enemies")
end

-- Equipment Module --
if settings.startup["DyWorld_Equipment"].value then
	require("data.equipment.data")
end

-- Decor Module --
if settings.startup["DyWorld_Decor"].value then
	require("data.decor.data")
end

-- Core Module --
require("data.core.data-2")

-- DyComPa Module --
require("data.dycompa.data")

for k,v in pairs(data.raw.fluid) do
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.item) do
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.module) do
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.ammo) do
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.capsule) do
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.tool) do
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.gun) do
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.armor) do
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw["repair-tool"]) do
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw["rail-planner"]) do
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.recipe) do
	if not v.icon_size then v.icon_size = 32 end
end

for k,v in pairs(data.raw.technology) do
	if not v.icon_size then v.icon_size = 128 end
end	

for i,inserter in pairs(data.raw["inserter"]) do
    inserter.allow_custom_vectors = true
	inserter.fast_replaceable_group = "inserter"
end

if settings.startup["DyWorld_Collision_Projectiles"] then
	--TODO Change projectiles so there are no unlimited ranges on them 
end