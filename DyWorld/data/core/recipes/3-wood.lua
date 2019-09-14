require "data/core/functions/prefix"
require "data/core/functions/colors"

for k,v in pairs(data.raw.tree) do
	if v.minable then
		if v.minable.result and v.minable.count then
			local COUNT = v.minable.count
			local RESULT = v.minable.result
			v.minable.results = {
				{type = "item", name = RESULT, amount_min = math.ceil(COUNT * 0.5), amount_max = math.ceil(COUNT * 2.5), probability = 0.98},
				{type = "item", name = "acorn", amount_min = 1, amount_max = 1, probability = 0.10},
			}
		end
	end
end

