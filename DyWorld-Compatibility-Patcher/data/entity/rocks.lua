

for k,v in pairs(data.raw["simple-entity"]) do
	if (string.find(v.name, "rock", 1, true) or string.find(v.name, "boulder", 1, true)) then
		if v.minable then
			if v.minable.results then
				v.minable.results = {
					{type = "item", name = "sandstone", amount_min = 5, amount_max = 30, probability = 0.5},
					{type = "item", name = "limestone", amount_min = 15, amount_max = 50, probability = 0.5},
					{type = "item", name = "quartzite", amount_min = 10, amount_max = 25, probability = 0.5},
					{type = "item", name = "granite", amount_min = 2, amount_max = 20, probability = 0.5},
					{type = "item", name = "exotic-partical", amount_min = 1, amount_max = 1, probability = 0.001},
				}
			elseif v.minable.result then
				v.minable.results = {
					{type = "item", name = "sandstone", amount_min = 5, amount_max = 30, probability = 0.5},
					{type = "item", name = "limestone", amount_min = 15, amount_max = 50, probability = 0.5},
					{type = "item", name = "quartzite", amount_min = 10, amount_max = 25, probability = 0.5},
					{type = "item", name = "granite", amount_min = 2, amount_max = 20, probability = 0.5},
					{type = "item", name = "exotic-partical", amount_min = 1, amount_max = 1, probability = 0.001},
				}
				v.minable.result = nil
				v.minable.count = nil
			end
		end
		if v.loot then
			if v.loot[1].item == "stone" then
				v.loot = {
					{item = "granite", amount_min = 2, amount_max = 20, probability = 0.15},
					{item = "quartzite", amount_min = 10, amount_max = 25, probability = 0.15},
					{item = "limestone", amount_min = 15, amount_max = 50, probability = 0.15},
					{item = "sandstone", amount_min = 5, amount_max = 30, probability = 0.15},
					{item = "exotic-partical", amount_min = 1, amount_max = 1, probability = 0.001},
				}
			end
		end
	end
end
