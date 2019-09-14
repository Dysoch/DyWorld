
-- Core Files (Need to be loaded first)
require("data.core.functions.functions")
require("data.core.functions.keys")
require("data.core.functions.category")
require("data.core.functions.deep-copy")
require("data.core.functions.creator-recipe")
require("data.core.functions.gui_sprites")
require("data.core.functions.metallurgy-info")
require("data.core.functions.entity-info")
require("data.core.functions.transport-belt-pictures")
require("data.core.functions.pipe-pictures")
require("data.core.functions.wall-pictures")
require("data.core.functions.tech-add")
require("data.core.tech.data-tech")

-- Item Groups
require("data.core.item-groups.metals")
require("data.core.item-groups.fluids")
require("data.core.item-groups.power")
require("data.core.item-groups.warfare-personal")
require("data.core.item-groups.warfare-defensive")
require("data.core.item-groups.warfare-capsules")
require("data.core.item-groups.warfare-ammo")
require("data.core.item-groups.modules")
require("data.core.item-groups.metallurgy")
require("data.core.item-groups.inserters")
require("data.core.item-groups.intermediates")
require("data.core.item-groups.decor")
require("data.core.item-groups.personal")
require("data.core.item-groups.logistics")
require("data.core.item-groups.logistics-2")
require("data.core.item-groups.machine-production")

-- Edits & Edits Related Functions
require("data.core.edits.items")
require("data.core.edits.fluids")
require("data.core.edits.scrap")
require("data.core.edits.recipes")
require("data.core.edits.item-group-change")

-- Resources & Resources Related Functions
require("data.core.resources.resources")

-- Items & Item Related Functions
require("data.core.items.metals")
require("data.core.functions.metallurgy-info-add")
require("data.core.tech.tech-metal-processing")
require("data.core.items.intermediates")
require("data.core.items.food")
require("data.core.functions.entity-info-add")
require("data.core.items.gears")
require("data.core.items.sticks")
require("data.core.items.cables")
require("data.core.items.filters")

-- Entities & Entities Related Functions
require("data.core.entities.air-filter")
require("data.core.entities.greenhouse")
require("data.core.entities.pasture")
require("data.core.entities.caster")
require("data.core.entities.labs")
require("data.core.entities.recycler")
require("data.core.entities.forge-gear")
require("data.core.entities.forge-stick")
require("data.core.entities.forge-cable")
require("data.core.entities.blast-furnace") -- needs to be last, does tech additions for caster as well

-- Fluids & Fluids Related Functions
require("data.core.fluids.basics")
require("data.core.fluids.metallurgy-fluids")

-- Recipes & Recipes Related Functions
require("data.core.recipes.metals")
require("data.core.recipes.wood")
require("data.core.recipes.oil")
require("data.core.recipes.intermediates")
require("data.core.recipes.fluids-air-filtering")

-- Debug & Debug Related Functions
require("data.core.debug.armor")
require("data.core.debug.equipment")

require("data.core.achievements")