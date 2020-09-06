

for k,v in pairs(data.raw["simple-entity"]) do
	if v.minable then
		if v.minable.results then
			v.minable.results = {
				{type = "item", name = "sandstone", amount_min = 5, amount_max = 30, probability = 0.5},
				{type = "item", name = "limestone", amount_min = 15, amount_max = 50, probability = 0.5},
				{type = "item", name = "quartzite", amount_min = 10, amount_max = 25, probability = 0.5},
				{type = "item", name = "granite", amount_min = 2, amount_max = 20, probability = 0.5},
			}
		elseif v.minable.result then
			COUNT = v.minable.count
			RESULT = v.minable.result
			v.minable.results = {
				{type = "item", name = "sandstone", amount_min = 5, amount_max = 30, probability = 0.5},
				{type = "item", name = "limestone", amount_min = 15, amount_max = 50, probability = 0.5},
				{type = "item", name = "quartzite", amount_min = 10, amount_max = 25, probability = 0.5},
				{type = "item", name = "granite", amount_min = 2, amount_max = 20, probability = 0.5},
			}
			v.minable.result = nil
			v.minable.count = nil
		end
	end
end
