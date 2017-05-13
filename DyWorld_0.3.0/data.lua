
-- Core Stuff
require("data.gui_sprites")
require("data.keys")
require("data.item-groups")
require("data.edits.ammo")
require("data.edits.items")
require("data.edits.resource") 
require("data.edits.techs")

-- Templates
require("data.template.data")
require("data.template.projectiles")
require("data.template.ammo")
require("data.template.lab-tools")
require("data.template.main-tech")
require("data.template.tech") --must be after main-tech!
require("data.template.lab")
require("data.template.turret-gun")
require("data.template.turret-laser")
require("data.template.armor")
require("data.template.gun")
require("data.template.inserter-fast")
require("data.template.inserter-long")
require("data.template.inserter-stack")
require("data.template.tools")
require("data.template.transport-belt")
require("data.template.furnace-burner")
require("data.template.assembling-burner")
require("data.template.miner-burner")
require("data.template.miner-electric")
require("data.template.solar-panels")
require("data.template.accumulators")
require("data.template.roboport")
require("data.template.radar")
require("data.template.robot-construction")
require("data.template.robot-logistic")
require("data.template.logistics-storage")
--require("data.template.furnace-electric")

-- Normals
require("data.generation.fire")

-- Enemies
require("data.template.enemy-base")
require("data.template.enemy-melee")

-- Tech
require("data.template-data.tech-edits")
require("data.tech.electric")
require("data.tech.sniper")

if settings.startup["DyWorld-resource-water"].value then
require("data.optional.resource-water")
end

if settings.startup["DyWorld-modules"].value then
require("data.optional.modules")
end