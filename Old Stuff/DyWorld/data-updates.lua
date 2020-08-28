
-- Extraction Module --
require("data.extraction.data")

-- Logistics Module --
require("data.logistics.data")

-- Power Module --
require("data.power.data")

-- Processing Module --
require("data.processing.data")

-- Warfare Module --
require("data.warfare.data")

-- Warfare Enemies Module --
require("data.warfare.data-enemies")

-- Equipment Module --
require("data.equipment.data")

-- Decor Module --
require("data.decor.data")

-- Core Module --
require("data.core.data-2")

-- Experimental Module --
--require("data.experimental.data")
-- Will be added in 0.9.5

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
	--inserter.fast_replaceable_group = "inserter"
end

if settings.startup["DyWorld_Collision_Projectiles"] then
	--TODO Change projectiles so there are no unlimited ranges on them 
end