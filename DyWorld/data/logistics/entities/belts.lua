require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

--@todo change belt script to work with predefined data table
for i=1,Belt_Amount do
local DyWorld_Prototype = DyWorld_CopyPrototype("transport-belt", "express-transport-belt", "express-transport-belt-"..i, true)
DyWorld_Prototype.speed = 0.1 * i

data:extend({DyWorld_Prototype})

local DyWorld_Prototype = DyWorld_CopyPrototype("item", "express-transport-belt", "express-transport-belt-"..i, true)

data:extend({DyWorld_Prototype})

local DyWorld_Prototype = DyWorld_CopyPrototype("recipe", "express-transport-belt", "express-transport-belt-"..i, true)

data:extend({DyWorld_Prototype})
end