
-- Item Groups
require("data.core.item-groups.energy")
require("data.core.item-groups.items")
require("data.core.item-groups.logistics")
require("data.core.item-groups.logistics-2")
require("data.core.item-groups.inserters")
require("data.core.item-groups.machines")
require("data.core.item-groups.metallurgy")
require("data.core.item-groups.personal")
require("data.core.item-groups.warfare-1")
require("data.core.item-groups.warfare-2")
require("data.core.item-groups.warfare-3")

--require("data.core.intermediates.resources-start")
require("data.core.prototypes.prototypes")
require("data.core.prototypes.belt-pictures")
require("data.core.prototypes.pipe-pictures")
require("data.core.prototypes.turret-pictures")
require("data.core.prototypes.wall-pictures")
require("data.core.gui_sprites")
require("data.core.keys")
require("data.core.category")
require("data.core.tile.noise-layers")
--require("data.core.tile.tiles")
require("data.core.entities.projectiles")
require("data.core.debug.armor")
require("data.core.debug.equipment")
require("data.core.debug.mining-tools")
require("data.core.tech.tech")
require("data.core.fluids.fluids")
require("data.core.intermediates.intermediates")
require("data.core.intermediates.resources")
require("data.core.intermediates.greenhouse")
require("data.core.intermediates.labs")
require("data.core.intermediates.recycler")
require("data.core.intermediates.seeds")
require("data.core.intermediates.wood")
require("data.core.intermediates.fluids")
require("data.core.geodrill.geodrill")
require("data.core.geodrill.recipes")

-- Edits
require("data.core.edits.ammo")
require("data.core.edits.entities")
require("data.core.edits.items")
require("data.core.edits.recipes")
require("data.core.edits.resource") 
require("data.core.edits.techs")

-- Needs
if settings.startup["DyWorld_Story"].value or settings.startup["DyWorld_Needs"].value then
require("data.core.needs.fluids")
require("data.core.needs.food-cooked")
require("data.core.needs.food-raw")
require("data.core.needs.hydration")
require("data.core.needs.seeds")
require("data.core.needs.farm-recipes")
end

-- More techs
require("data.core.tech.toolbelt")
require("data.core.tech.robot-battery")

-- Fluid System
require("data.core.fluid-system.recipes")

-- Science System
require("data.core.science.recipe-fluid")