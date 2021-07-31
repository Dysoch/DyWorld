





local Tree_Loot_Table = {
	{
		Name = "enemy-corpse",
		Chance = 0.05,
		Max_Count = 1,
	},
	{
		Name = "exotic-partical",
		Chance = 0.0005,
		Max_Count = 1,
	},
}


for k,v in pairs(Tree_Loot_Table) do
	for _,z in pairs(data.raw.unit) do
		if not z.loot then z.loot = {} end
		loottable = {
			item = v.Name,
			probability = v.Chance,
			count_min = 1,
			count_max = v.Max_Count,
		}
		table.insert(z.loot, loottable)
	end
	for _,z in pairs(data.raw["unit-spawner"]) do
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

for k,v in pairs(data.raw.unit) do
	if v.resistances then
		local insert = {type = "exotic-energy", decrease = 0, percent = 100,}
		table.insert(v.resistances, insert)
	else
		v.resistances = {{type = "exotic-energy", decrease = 0, percent = 100,}}
	end
end

for k,v in pairs(data.raw["unit-spawner"]) do
	if v.resistances then
		local insert = {type = "exotic-energy", decrease = 0, percent = 100,}
		table.insert(v.resistances, insert)
	else
		v.resistances = {{type = "exotic-energy", decrease = 0, percent = 100,}}
	end
end