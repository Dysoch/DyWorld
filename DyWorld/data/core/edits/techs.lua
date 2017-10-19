require "data/prefix"

local Tech_Add = {
	["automation"] = {{type = "unlock-recipe", recipe = dy.."greenhouse"}, {type = "unlock-recipe", recipe = dy.."wood-creation-1"}, {type = "unlock-recipe", recipe = dy.."wood-seed"}},
	["oil-processing"] = {{type = "unlock-recipe", recipe = dy.."water-seperation-1"}, {type = "unlock-recipe", recipe = dy.."sludge-seperation"}, {type = "unlock-recipe", recipe = "centrifuge"}, {type = "unlock-recipe", recipe = dy.."basic-clean-oil-processing"}, {type = "unlock-recipe", recipe = dy.."fertilizer-seperation"}},
	["advanced-oil-processing"] = {{type = "unlock-recipe", recipe = dy.."water-seperation-2"}, {type = "unlock-recipe", recipe = dy.."advanced-clean-oil-processing"}},
	["sulfur-processing"] = {{type = "unlock-recipe", recipe = dy.."acid-seperation"}},
} 

for k,v in pairs(Tech_Add) do
	for _,z in pairs(v) do
		table.insert(data.raw.technology[k].effects,z)
	end
end