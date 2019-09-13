require "data/core/functions/prefix"
require "data/core/functions/colors"

for k,v in pairs(data.raw.tree) do
	if v.minable then
		v.minable = {
        mining_particle = "wooden-particle",
        mining_time = 0.55,
        results = {
		  {type = "item", name = "wood", amount_min = 1, amount_max = 7, probability = 0.98},
		  {type = "item", name = "acorn", amount_min = 1, amount_max = 1, probability = 0.10},
		},
      }
	else
		v.minable = {
        mining_particle = "wooden-particle",
        mining_time = 0.55,
        results = {
		  {type = "item", name = "wood", amount_min = 1, amount_max = 7, probability = 0.98},
		  {type = "item", name = "acorn", amount_min = 1, amount_max = 1, probability = 0.10},
		},
      }
	end
end