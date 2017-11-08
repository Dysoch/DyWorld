require "data/prefix"



data.raw.recipe["transport-belt"].hidden = true
data.raw.recipe["fast-transport-belt"].hidden = true
data.raw.recipe["express-transport-belt"].normal.hidden = true
data.raw.recipe["express-transport-belt"].expensive.hidden = true

data.raw.recipe["underground-belt"].hidden = true
data.raw.recipe["fast-underground-belt"].hidden = true
data.raw.recipe["express-underground-belt"].hidden = true

data.raw.recipe["splitter"].hidden = true
data.raw.recipe["fast-splitter"].hidden = true
data.raw.recipe["express-splitter"].hidden = true

data.raw.recipe["pipe"].hidden = true
data.raw.recipe["pipe-to-ground"].hidden = true
data.raw.recipe["storage-tank"].hidden = true

data.raw.recipe["offshore-pump"].hidden = true
data.raw.recipe["pump"].normal.hidden = true
data.raw.recipe["pump"].expensive.hidden = true

data.raw.recipe["inserter"].hidden = true
data.raw.recipe["long-handed-inserter"].hidden = true
data.raw.recipe["fast-inserter"].hidden = true
data.raw.recipe["filter-inserter"].hidden = true
data.raw.recipe["stack-inserter"].hidden = true
data.raw.recipe["stack-filter-inserter"].hidden = true

data.raw.recipe["science-pack-2"].enabled = true

table.remove(data.raw.recipe["lab"].ingredients,3)
local result = {dy.."stone-transport-belt", 2}
table.insert(data.raw.recipe["lab"].ingredients,result)

table.remove(data.raw.recipe["boiler"].ingredients,2)
local result = {dy.."stone-pipe", 4}
table.insert(data.raw.recipe["boiler"].ingredients,result)

table.remove(data.raw.recipe["steam-engine"].normal.ingredients,2)
table.remove(data.raw.recipe["steam-engine"].expensive.ingredients,2)
local result = {dy.."stone-pipe", 5}
table.insert(data.raw.recipe["steam-engine"].normal.ingredients,result)
table.insert(data.raw.recipe["steam-engine"].expensive.ingredients,result)

table.remove(data.raw.recipe["fluid-wagon"].ingredients,3)
local result = {dy.."tin-pipe", 8}
table.insert(data.raw.recipe["fluid-wagon"].ingredients,result)

table.remove(data.raw.recipe["science-pack-2"].ingredients,2)
table.remove(data.raw.recipe["science-pack-2"].ingredients,1)
local result = {dy.."stone-transport-belt", 1}
table.insert(data.raw.recipe["science-pack-2"].ingredients,result)
local result = {dy.."lead-basic-inserter", 1}
table.insert(data.raw.recipe["science-pack-2"].ingredients,result)

table.remove(data.raw.recipe["rocket-silo"].ingredients,3)
local result = {dy.."lead-pipe", 100}
table.insert(data.raw.recipe["rocket-silo"].ingredients,result)

table.remove(data.raw.recipe["pumpjack"].ingredients,4)
local result = {dy.."copper-pipe", 10}
table.insert(data.raw.recipe["pumpjack"].ingredients,result)

table.remove(data.raw.recipe["chemical-plant"].ingredients,4)
local result = {dy.."tin-pipe", 5}
table.insert(data.raw.recipe["chemical-plant"].ingredients,result)

table.remove(data.raw.recipe["oil-refinery"].ingredients,5)
local result = {dy.."steel-pipe", 10}
table.insert(data.raw.recipe["oil-refinery"].ingredients,result)

table.remove(data.raw.recipe["engine-unit"].ingredients,3)
local result = {dy.."iron-pipe", 2}
table.insert(data.raw.recipe["engine-unit"].ingredients,result)

table.remove(data.raw.recipe["heat-exchanger"].ingredients,3)
local result = {dy.."iron-pipe", 10}
table.insert(data.raw.recipe["heat-exchanger"].ingredients,result)

table.remove(data.raw.recipe["steam-turbine"].ingredients,3)
local result = {dy.."steel-pipe", 20}
table.insert(data.raw.recipe["steam-turbine"].ingredients,result)
