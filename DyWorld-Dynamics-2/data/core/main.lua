

local core = "data.core."


-- Core --
require(core.."keys")
require(core.."style")
require(core.."items") -- Items
require(core.."fluids") -- Fluids
require(core.."tech") -- Technology

-- Entities --
require(core.."entities.blast-furnace")
require(core.."entities.bloomery")
require(core.."entities.caster")
require(core.."entities.grinder")

-- Recipes --
require(core.."recipes") -- Recipes

--require(core.."recipes.hematite") --todo later
require(core.."recipes.wood-basic")
require(core.."recipes.stone-basic")
require(core.."recipes.circuits")
require(core.."recipes.metal-cable")
require(core.."recipes.metal-frame")
require(core.."recipes.metal-gear")
require(core.."recipes.metal-stick")
require(core.."recipes.ore-main")