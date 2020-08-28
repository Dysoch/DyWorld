require "data/core/functions/prefix"
require "data/core/functions/colors"

for k,v in pairs(data.raw.tree) do
	if v.minable then
		if v.minable.result and v.minable.count then
			local COUNT = v.minable.count
			local RESULT = v.minable.result
			if not v.minable.results then v.minable.results = {} end
			INSERT = {type = "item", name = RESULT, amount_min = math.ceil(COUNT * 0.5), amount_max = math.ceil(COUNT * 2.5), probability = 0.98}
			table.insert(v.minable.results, INSERT)
			INSERT = {type = "item", name = "acorn", amount_min = 1, amount_max = 1, probability = 0.10}
			table.insert(v.minable.results, INSERT)
			INSERT = {type = "item", name = "resin", amount_min = 1, amount_max = 1, probability = 0.01}
			table.insert(v.minable.results, INSERT)
			INSERT = {type = "item", name = "carrot", amount_min = 1, amount_max = 1, probability = 0.005}
			table.insert(v.minable.results, INSERT)
		elseif v.minable.results then
			INSERT = {type = "item", name = "wood", amount_min = math.ceil(5 * 0.5), amount_max = math.ceil(5 * 2.5), probability = 0.98}
			table.insert(v.minable.results, INSERT)
			INSERT = {type = "item", name = "acorn", amount_min = 1, amount_max = 1, probability = 0.10}
			table.insert(v.minable.results, INSERT)
			INSERT = {type = "item", name = "resin", amount_min = 1, amount_max = 1, probability = 0.01}
			table.insert(v.minable.results, INSERT)
			INSERT = {type = "item", name = "carrot", amount_min = 1, amount_max = 1, probability = 0.005}
			table.insert(v.minable.results, INSERT)
		end
	end
end

