require "data/prefix"



data.raw.recipe["small-electric-pole"].hidden = true
data.raw.recipe["medium-electric-pole"].hidden = true
data.raw.recipe["big-electric-pole"].hidden = true

data.raw.recipe["solar-panel"].hidden = true
data.raw.recipe["accumulator"].hidden = true

data.raw.recipe["steam-engine"].normal.enabled = false
data.raw.recipe["steam-engine"].expensive.enabled = false
data.raw.recipe["boiler"].enabled = false
DyWorld_Add_To_Tech(dy.."steam-energy-1", "steam-engine")
DyWorld_Add_To_Tech(dy.."steam-energy-1", "boiler")

table.remove(data.raw.recipe["solar-panel-equipment"].ingredients,1)
local result = {dy.."obsidian-solar-normal", 2}
table.insert(data.raw.recipe["solar-panel-equipment"].ingredients,result)
