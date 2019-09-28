require "data/core/functions/prefix"
require "data/core/functions/colors"


local Enemy_Loot_Table = {
	{
		Name = "chitin",
		Chance = 0.25,
		Max_Count = 4,
		Tier = 1,
	},
	{
		Name = "sulfur",
		Chance = 0.05,
		Max_Count = 2,
		Tier = 3,
	},
	{
		Name = "diamond",
		Chance = 0.05,
		Max_Count = 0.5,
		Tier = 4,
	},
}


for k,v in pairs(Enemy_Loot_Table) do
	for _,z in pairs(data.raw.turret) do
		if not z.loot then z.loot = {} end
		if z.Tier then
			if z.Tier >= v.Tier then
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