require "data/prefix"




local result = {type = "unlock-recipe", recipe = "transport-belt"}
table.insert(data.raw.technology["logistics"].effects,result)
table.insert(data.raw.technology["logistics-2"].prerequisites,"steel-processing")

local result = {type = "unlock-recipe", recipe = "science-pack-2"}
table.insert(data.raw.technology[dy.."lead-processing"].effects,result)
