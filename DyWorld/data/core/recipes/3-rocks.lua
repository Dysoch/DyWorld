require "data/core/functions/prefix"
require "data/core/functions/colors"

for k,v in pairs(data.raw["simple-entity"]) do
	if v.minable then
		if v.minable.results then
			insert_1 = {type = "item", name = "sand", amount_min = 10, amount_max = 200, probability = 0.4}
			insert_2 = {type = "item", name = "obsidian", amount_min = 1, amount_max = 15, probability = 0.1}
			table.insert(v.minable.results, insert_1)
			table.insert(v.minable.results, insert_2)
		elseif v.minable.result then
			COUNT = v.minable.count
			RESULT = v.minable.result
			v.minable.results = {
				{type = "item", name = RESULT, amount_min = math.ceil(COUNT * 0.5), amount_max = math.ceil(COUNT * 2.5), probability = 1},
				{type = "item", name = "sand", amount_min = 10, amount_max = 200, probability = 0.4},
			}
			v.minable.result = nil
			v.minable.count = nil
		end
	end
end
