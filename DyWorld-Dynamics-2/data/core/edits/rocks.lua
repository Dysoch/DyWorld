
local Mine_Results = {
	{type = "item", name = "hematite", amount_min = 1, amount_max = 10, probability = 0.15},
	{type = "item", name = "chalcopyrite", amount_min = 1, amount_max = 10, probability = 0.15},
	{type = "item", name = "bauxite", amount_min = 1, amount_max = 10, probability = 0.15},
	{type = "item", name = "sphalerite", amount_min = 1, amount_max = 10, probability = 0.15},
	{type = "item", name = "galena", amount_min = 1, amount_max = 10, probability = 0.15},
	{type = "item", name = "tin-pyrite", amount_min = 1, amount_max = 10, probability = 0.15},
	{type = "item", name = "argentite", amount_min = 1, amount_max = 10, probability = 0.15},
	{type = "item", name = "calaverite", amount_min = 1, amount_max = 10, probability = 0.15},
	{type = "item", name = "rock-salt", amount_min = 1, amount_max = 10, probability = 0.15},
	{type = "item", name = "carnalite", amount_min = 1, amount_max = 10, probability = 0.15},
	{type = "item", name = "cinnabar", amount_min = 1, amount_max = 10, probability = 0.15},
	{type = "item", name = "dolomite", amount_min = 1, amount_max = 10, probability = 0.15},
	{type = "item", name = "limestone", amount_min = 1, amount_max = 10, probability = 0.15},
	{type = "item", name = "phosphorite", amount_min = 1, amount_max = 10, probability = 0.15},
	{type = "item", name = "pyrolusite", amount_min = 1, amount_max = 10, probability = 0.15},
	{type = "item", name = "carbon", amount_min = 1, amount_max = 10, probability = 0.15},
	{type = "item", name = "iron-chunk", amount_min = 1, amount_max = 100, probability = 0.35},
	{type = "item", name = "copper-chunk", amount_min = 1, amount_max = 100, probability = 0.35},
	{type = "item", name = "aluminium-chunk", amount_min = 1, amount_max = 100, probability = 0.05},
	{type = "item", name = "zinc-chunk", amount_min = 1, amount_max = 100, probability = 0.05},
	{type = "item", name = "lead-chunk", amount_min = 1, amount_max = 100, probability = 0.05},
	{type = "item", name = "tin-chunk", amount_min = 1, amount_max = 100, probability = 0.05},
	{type = "item", name = "magnesium-chunk", amount_min = 1, amount_max = 100, probability = 0.05},
	{type = "item", name = "silver-chunk", amount_min = 1, amount_max = 100, probability = 0.01},
	{type = "item", name = "gold-chunk", amount_min = 1, amount_max = 100, probability = 0.01},
	{type = "item", name = "manganese-chunk", amount_min = 1, amount_max = 100, probability = 0.01},
}
local Loot_Results = {
	{item = "hematite", amount_min = 1, amount_max = 10, probability = 0.15},
	{item = "chalcopyrite", amount_min = 1, amount_max = 10, probability = 0.15},
	{item = "bauxite", amount_min = 1, amount_max = 10, probability = 0.15},
	{item = "sphalerite", amount_min = 1, amount_max = 10, probability = 0.15},
	{item = "galena", amount_min = 1, amount_max = 10, probability = 0.15},
	{item = "tin-pyrite", amount_min = 1, amount_max = 10, probability = 0.15},
	{item = "argentite", amount_min = 1, amount_max = 10, probability = 0.15},
	{item = "calaverite", amount_min = 1, amount_max = 10, probability = 0.15},
	{item = "rock-salt", amount_min = 1, amount_max = 10, probability = 0.15},
	{item = "carnalite", amount_min = 1, amount_max = 10, probability = 0.15},
	{item = "cinnabar", amount_min = 1, amount_max = 10, probability = 0.15},
	{item = "dolomite", amount_min = 1, amount_max = 10, probability = 0.15},
	{item = "limestone", amount_min = 1, amount_max = 10, probability = 0.15},
	{item = "phosphorite", amount_min = 1, amount_max = 10, probability = 0.15},
	{item = "pyrolusite", amount_min = 1, amount_max = 10, probability = 0.15},
	{item = "carbon", amount_min = 1, amount_max = 10, probability = 0.15},
	{item = "iron-chunk", amount_min = 1, amount_max = 100, probability = 0.35},
	{item = "copper-chunk", amount_min = 1, amount_max = 100, probability = 0.35},
	{item = "aluminium-chunk", amount_min = 1, amount_max = 100, probability = 0.05},
	{item = "zinc-chunk", amount_min = 1, amount_max = 100, probability = 0.05},
	{item = "lead-chunk", amount_min = 1, amount_max = 100, probability = 0.05},
	{item = "tin-chunk", amount_min = 1, amount_max = 100, probability = 0.05},
	{item = "magnesium-chunk", amount_min = 1, amount_max = 100, probability = 0.05},
	{item = "silver-chunk", amount_min = 1, amount_max = 100, probability = 0.01},
	{item = "gold-chunk", amount_min = 1, amount_max = 100, probability = 0.01},
	{item = "manganese-chunk", amount_min = 1, amount_max = 100, probability = 0.01},
}


for k,v in pairs(data.raw["simple-entity"]) do
	if (string.find(v.name, "rock", 1, true) or string.find(v.name, "boulder", 1, true)) then
		if v.minable then
			if v.minable.results then
				v.minable.results = Mine_Results
			elseif v.minable.result then
				v.minable.results = Mine_Results
				v.minable.result = nil
				v.minable.count = nil
			end
		end
		if v.loot then
			v.loot = Loot_Results
		end
	end
end

for k,v in pairs(data.raw["simple-entity"]) do
	if (string.find(v.name, "meteor", 1, true)) then
		if v.minable then
			if v.minable.results then
				v.minable.results = Mine_Results
			elseif v.minable.result then
				v.minable.results = Mine_Results
				v.minable.result = nil
				v.minable.count = nil
			end
		end
		if v.loot then
			v.loot = Loot_Results
		end
	end
end
