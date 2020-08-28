require "data/core/functions/prefix"
require "data/core/functions/colors"


local Enemy_Loot_Table = {
	{
		Name = "chitin",
		Chance = 0.45,
		Max_Count = 3,
		Tier = 1,
	},
	{
		Name = "sulfur",
		Chance = 0.15,
		Max_Count = 2,
		Tier = 15,
	},
	{
		Name = "obsidian",
		Chance = 0.08,
		Max_Count = 1,
		Tier = 27,
	},
	{
		Name = "diamond",
		Chance = 0.01,
		Max_Count = 0.5,
		Tier = 35,
	},
}


for k,v in pairs(Enemy_Loot_Table) do
	for _,z in pairs(data.raw.unit) do
		if not z.loot then z.loot = {} end
		if z.Tier and z.Loot_Tier then
			if z.Loot_Tier >= v.Tier then
				loottable = {
					item = v.Name,
					probability = v.Chance,
					count_min = 1,
					count_max = math.ceil(v.Max_Count * z.Tier),
				}
				table.insert(z.loot, loottable)
			end
		end
	end
end