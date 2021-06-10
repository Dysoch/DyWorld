



for k,v in pairs(data.raw["simple-entity"]) do
	if (string.find(v.name, "wreck", 1, true) or string.find(v.name, "wreckage", 1, true)) then
		if v.minable then
			if v.minable.results then
				v.minable.results = {
					{type = "item", name = "bronze-plate", amount_min = 1, amount_max = 5, probability = 0.75},
					{type = "item", name = "iron-plate", amount_min = 1, amount_max = 2, probability = 0.75},
					{type = "item", name = "copper-plate", amount_min = 1, amount_max = 3, probability = 0.75},
					{type = "item", name = "steel-plate", amount_min = 1, amount_max = 1, probability = 0.75},
					{type = "item", name = "tin-plate", amount_min = 1, amount_max = 5, probability = 0.75},
					{type = "item", name = "exotic-partical", amount_min = 1, amount_max = 1, probability = 0.1},
				}
			elseif v.minable.result then
				v.minable.results = {
					{type = "item", name = "bronze-plate", amount_min = 1, amount_max = 5, probability = 0.75},
					{type = "item", name = "iron-plate", amount_min = 1, amount_max = 2, probability = 0.75},
					{type = "item", name = "copper-plate", amount_min = 1, amount_max = 3, probability = 0.75},
					{type = "item", name = "steel-plate", amount_min = 1, amount_max = 1, probability = 0.75},
					{type = "item", name = "tin-plate", amount_min = 1, amount_max = 5, probability = 0.75},
					{type = "item", name = "exotic-partical", amount_min = 1, amount_max = 1, probability = 0.1},
				}
				v.minable.result = nil
				v.minable.count = nil
			end
		end
	end
end

for k,v in pairs(data.raw.container) do
	if (string.find(v.name, "wreck", 1, true) or string.find(v.name, "wreckage", 1, true)) then
		if v.minable then
			if v.minable.results then
				v.minable.results = {
					{type = "item", name = "bronze-plate", amount_min = 1, amount_max = 5, probability = 0.75},
					{type = "item", name = "iron-plate", amount_min = 1, amount_max = 2, probability = 0.75},
					{type = "item", name = "copper-plate", amount_min = 1, amount_max = 3, probability = 0.75},
					{type = "item", name = "steel-plate", amount_min = 1, amount_max = 1, probability = 0.75},
					{type = "item", name = "tin-plate", amount_min = 1, amount_max = 5, probability = 0.75},
					{type = "item", name = "exotic-partical", amount_min = 1, amount_max = 1, probability = 0.1},
				}
			elseif v.minable.result then
				v.minable.results = {
					{type = "item", name = "bronze-plate", amount_min = 1, amount_max = 5, probability = 0.75},
					{type = "item", name = "iron-plate", amount_min = 1, amount_max = 2, probability = 0.75},
					{type = "item", name = "copper-plate", amount_min = 1, amount_max = 3, probability = 0.75},
					{type = "item", name = "steel-plate", amount_min = 1, amount_max = 1, probability = 0.75},
					{type = "item", name = "tin-plate", amount_min = 1, amount_max = 5, probability = 0.75},
					{type = "item", name = "exotic-partical", amount_min = 1, amount_max = 1, probability = 0.1},
				}
				v.minable.result = nil
				v.minable.count = nil
			end
		end
	end
end