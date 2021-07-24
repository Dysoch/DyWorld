
local Rock_Mine_Results = {
	{type = "item", name = "sandstone", amount_min = 5, amount_max = 30, probability = 0.5},
	{type = "item", name = "limestone", amount_min = 15, amount_max = 50, probability = 0.5},
	{type = "item", name = "quartzite", amount_min = 10, amount_max = 25, probability = 0.5},
	{type = "item", name = "granite", amount_min = 2, amount_max = 20, probability = 0.5},
	{type = "item", name = "exotic-partical", amount_min = 1, amount_max = 1, probability = 0.001},
}
local Rock_Loot_Results = {
	{item = "granite", amount_min = 2, amount_max = 20, probability = 0.15},
	{item = "quartzite", amount_min = 10, amount_max = 25, probability = 0.15},
	{item = "limestone", amount_min = 15, amount_max = 50, probability = 0.15},
	{item = "sandstone", amount_min = 5, amount_max = 30, probability = 0.15},
	{item = "exotic-partical", amount_min = 1, amount_max = 1, probability = 0.001},
}
local Meteor_Mine_Results = {
	{type = "item", name = "limestone", amount_min = 1, amount_max = 100, probability = 0.75},
	{type = "item", name = "sandstone", amount_min = 1, amount_max = 75, probability = 0.5},
	{type = "item", name = "quartzite", amount_min = 1, amount_max = 50, probability = 0.25},
	{type = "item", name = "granite", amount_min = 1, amount_max = 25, probability = 0.125},
	{type = "item", name = "iron-ore-impure", amount_min = 1, amount_max = 50, probability = 0.5},
	{type = "item", name = "iron-ore", amount_min = 1, amount_max = 25, probability = 0.25},
	{type = "item", name = "copper-ore-impure", amount_min = 1, amount_max = 50, probability = 0.5},
	{type = "item", name = "copper-ore", amount_min = 1, amount_max = 25, probability = 0.25},
	{type = "item", name = "tin-ore-impure", amount_min = 1, amount_max = 50, probability = 0.5},
	{type = "item", name = "tin-ore", amount_min = 1, amount_max = 25, probability = 0.25},
	{type = "item", name = "titanium-ore-impure", amount_min = 1, amount_max = 50, probability = 0.25},
	{type = "item", name = "titanium-ore", amount_min = 1, amount_max = 25, probability = 0.125},
	{type = "item", name = "magnesium-ore-impure", amount_min = 1, amount_max = 50, probability = 0.25},
	{type = "item", name = "magnesium-ore", amount_min = 1, amount_max = 25, probability = 0.125},
	{type = "item", name = "aluminium-ore-impure", amount_min = 1, amount_max = 50, probability = 0.25},
	{type = "item", name = "aluminium-ore", amount_min = 1, amount_max = 25, probability = 0.125},
	{type = "item", name = "gold-ore-impure", amount_min = 1, amount_max = 50, probability = 0.125},
	{type = "item", name = "gold-ore", amount_min = 1, amount_max = 25, probability = 0.0625},
	{type = "item", name = "silver-ore-impure", amount_min = 1, amount_max = 50, probability = 0.125},
	{type = "item", name = "silver-ore", amount_min = 1, amount_max = 25, probability = 0.0625},
	{type = "item", name = "lead-ore-impure", amount_min = 1, amount_max = 50, probability = 0.125},
	{type = "item", name = "lead-ore", amount_min = 1, amount_max = 25, probability = 0.0625},
	{type = "item", name = "exotic-partical", amount_min = 1, amount_max = 1, probability = 0.001},
}
local Meteor_Loot_Results = {
	{item = "limestone", amount_min = 1, amount_max = 50, probability = 0.15},
	{item = "sandstone", amount_min = 1, amount_max = 37, probability = 0.15},
	{item = "quartzite", amount_min = 1, amount_max = 25, probability = 0.15},
	{item = "granite", amount_min = 1, amount_max = 12, probability = 0.15},
	{type = "item", name = "iron-ore-impure", amount_min = 1, amount_max = 50, probability = 0.05},
	{type = "item", name = "iron-ore", amount_min = 1, amount_max = 25, probability = 0.025},
	{type = "item", name = "copper-ore-impure", amount_min = 1, amount_max = 50, probability = 0.05},
	{type = "item", name = "copper-ore", amount_min = 1, amount_max = 25, probability = 0.025},
	{type = "item", name = "tin-ore-impure", amount_min = 1, amount_max = 50, probability = 0.05},
	{type = "item", name = "tin-ore", amount_min = 1, amount_max = 25, probability = 0.025},
	{type = "item", name = "titanium-ore-impure", amount_min = 1, amount_max = 50, probability = 0.025},
	{type = "item", name = "titanium-ore", amount_min = 1, amount_max = 25, probability = 0.0125},
	{type = "item", name = "magnesium-ore-impure", amount_min = 1, amount_max = 50, probability = 0.025},
	{type = "item", name = "magnesium-ore", amount_min = 1, amount_max = 25, probability = 0.0125},
	{type = "item", name = "aluminium-ore-impure", amount_min = 1, amount_max = 50, probability = 0.025},
	{type = "item", name = "aluminium-ore", amount_min = 1, amount_max = 25, probability = 0.0125},
	{type = "item", name = "gold-ore-impure", amount_min = 1, amount_max = 50, probability = 0.0125},
	{type = "item", name = "gold-ore", amount_min = 1, amount_max = 25, probability = 0.00625},
	{type = "item", name = "silver-ore-impure", amount_min = 1, amount_max = 50, probability = 0.0125},
	{type = "item", name = "silver-ore", amount_min = 1, amount_max = 25, probability = 0.00625},
	{type = "item", name = "lead-ore-impure", amount_min = 1, amount_max = 50, probability = 0.0125},
	{type = "item", name = "lead-ore", amount_min = 1, amount_max = 25, probability = 0.00625},
	{item = "exotic-partical", amount_min = 1, amount_max = 1, probability = 0.001},
}


for k,v in pairs(data.raw["simple-entity"]) do
	if (string.find(v.name, "rock", 1, true) or string.find(v.name, "boulder", 1, true)) then
		if v.minable then
			if v.minable.results then
				v.minable.results = Rock_Mine_Results
			elseif v.minable.result then
				v.minable.results = Rock_Mine_Results
				v.minable.result = nil
				v.minable.count = nil
			end
		end
		if v.loot then
			v.loot = Rock_Loot_Results
		end
	end
end

for k,v in pairs(data.raw["simple-entity"]) do
	if (string.find(v.name, "meteor", 1, true)) then
		if v.minable then
			if v.minable.results then
				v.minable.results = Meteor_Mine_Results
			elseif v.minable.result then
				v.minable.results = Meteor_Mine_Results
				v.minable.result = nil
				v.minable.count = nil
			end
		end
		if v.loot then
			v.loot = Meteor_Loot_Results
		end
	end
end
