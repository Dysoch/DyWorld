require "data/core/functions/prefix"
require "data/core/functions/colors"


local Tree_Loot_Table = {
	{
		Name = "wood",
		Chance = 0.05,
		Max_Count = 2,
	},
	{
		Name = "resin",
		Chance = 0.001,
		Max_Count = 1,
	},
	{
		Name = "acorn",
		Chance = 0.01,
		Max_Count = 1,
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