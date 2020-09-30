





local Tree_Loot_Table = {
	{
		Name = "enemy-corpse",
		Chance = 0.05,
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
end