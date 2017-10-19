require "data/prefix"




local result_1 = {type = "unlock-recipe", recipe = "transport-belt"}
table.insert(data.raw.technology["logistics"].effects,result_1)
table.insert(data.raw.technology["logistics-2"].prerequisites,"steel-processing")
