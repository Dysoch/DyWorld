



for k,v in pairs(data.raw.tree) do
	if v.minable then
		if v.minable.result and v.minable.count then
			local COUNT = v.minable.count
			local RESULT = v.minable.result
			if not v.minable.results then v.minable.results = {} end
			INSERT = {type = "item", name = RESULT, amount_min = math.ceil(COUNT * 0.5), amount_max = math.ceil(COUNT * 5), probability = 0.98}
			table.insert(v.minable.results, INSERT)
		elseif v.minable.results then
			INSERT = {type = "item", name = "wood", amount_min = math.ceil(5 * 0.5), amount_max = math.ceil(5 * 5), probability = 0.98}
			table.insert(v.minable.results, INSERT)
		end
	end
end

local Tree_Loot_Table = {
	{
		Name = "wood",
		Chance = 0.05,
		Max_Count = 11,
	},
	{
		Name = "lignite",
		Chance = 0.005,
		Max_Count = 2,
	},
}


for k,v in pairs(Tree_Loot_Table) do
	for _,z in pairs(data.raw.tree) do
		if not z.loot then z.loot = {} end
		loottable = {
			item = v.Name,
			probability = v.Chance,
			count_min = 1,
			count_max = v.Max_Count,
		}
		table.insert(z.loot, loottable)
	end
end