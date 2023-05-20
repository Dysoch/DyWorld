

local db = "database."

-- Prefixs and Calls --
Dy = "dyworld-"
Dy_icon_temp = "__DyCore__/graphics/questionmark.png"
Dy_icon = "__DyWorld-Dynamics-2__/graphics/icons/"
Dy_icon_ore = "__DyWorld-Dynamics-2__/graphics/icons/ores/"

require(db.."colors")
require(db.."tables")

-- Resources --
require(db.."resources.ores")

-- Items --
require(db.."items.main")

-- Fluids --
require(db.."fluids.main")

-- Tech --
require(db.."tech.main")
require(db.."tech.biological")
require(db.."tech.combat")
require(db.."tech.infrastructure")
require(db.."tech.intermediates")
require(db.."tech.metallurgy")
require(db.."tech.space")